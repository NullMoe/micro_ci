import 'dart:convert';


/// [CommandLineArgumentsConverter] internal state.
enum _State {
  noToken,
  normalToken,
  singleQuote,
  doubleQuote,
}

/// This converter tokenize a String into a list of String arguments,
/// with behavior similar to parsing command line arguments to a program.
/// Quoted Strings are treated as single arguments, and escaped characters
/// are translated so that the tokenized arguments have the same meaning.
class CommandLineArgumentsConverter extends Converter<String, List<String>> {
  const CommandLineArgumentsConverter();

  // Based on https://sourceforge.net/p/drjava/git_repo/ci/master/tree/drjava/src/edu/rice/cs/util/ArgumentTokenizer.java#l51
  /*
   * Copyright (c) 2001-2010, JavaPLT group at Rice University (drjava@rice.edu)
   * All rights reserved.
   * 
   * Redistribution and use in source and binary forms, with or without
   * modification, are permitted provided that the following conditions are met:
   *    * Redistributions of source code must retain the above copyright
   *      notice, this list of conditions and the following disclaimer.
   *    * Redistributions in binary form must reproduce the above copyright
   *      notice, this list of conditions and the following disclaimer in the
   *      documentation and/or other materials provided with the distribution.
   *    * Neither the names of DrJava, the JavaPLT group, Rice University, nor the
   *      names of its contributors may be used to endorse or promote products
   *      derived from this software without specific prior written permission.
   * 
   * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
   * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
   * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
   * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
   * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
   * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
   * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
   * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
   * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
   * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
   * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
   */
  @override
  List<String> convert(String input)  {
    final argumentsList = <String>[];
    final currentArgument = StringBuffer();

    var escaped = false;
    var state = _State.noToken;

    for (var i = 0; i < input.length; i++) {
      final character = input[i];

      // Escaped state: just append the next character to the current arg.
      if (escaped) {
        escaped = false;
        currentArgument.write(character);
      } else {
        switch (state) {
          case _State.singleQuote:
            // Seen the close quote; continue this arg until whitespace is seen
            if (character == '\'')
              state = _State.normalToken;
            else
              currentArgument.write(character);
          case _State.doubleQuote:
            if (character == '"') {
              // Seen the close quote; continue this arg until whitespace is seen
              state = _State.normalToken;
            } else if (character == r'\') {
              // Look ahead, and only escape quotes or backslashes
              i++;
              final next = input[i];
              if (next == '"' || next == r'\') {
                currentArgument.write(next);
              } else {
                currentArgument
                  ..write(character)
                  ..write(next);
              }
            } else {
              currentArgument.write(character);
            }
          case _State.normalToken || _State.noToken:
            switch (character) {
              case r'\':
                escaped = true;
                state = _State.normalToken;
              case '\'':
                state = _State.singleQuote;
              case '"':
                state = _State.doubleQuote;
              default:
                if (character != ' ') {
                  currentArgument.write(character);
                  state = _State.normalToken;
                } else if (state == _State.normalToken) {
                  // Whitespace ends the token; start a new one
                  print('$currentArgument');
                  argumentsList.add(currentArgument.toString());
                  currentArgument.clear();
                  state = _State.noToken;
                }
            }
        }
      }
    }

    if (escaped) {
      // If we're still escaped, put in the backslash
      currentArgument.write(r'\');
      argumentsList.add(currentArgument.toString());
    } else if (state != _State.noToken) {
      // Close the last argument if we haven't yet
      argumentsList.add(currentArgument.toString());
    }

    return argumentsList;
  }
}
