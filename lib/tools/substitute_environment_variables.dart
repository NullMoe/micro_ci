extension SubstituteEnvironmentVariables on String {
  static final _pattern = RegExp(r'\$(?:(\w+)|(?:\{(\w+)\}))');

  String substituteEnvironmentVariables(Map<String, String> env) =>
    replaceAllMapped(_pattern, (match) =>
      env[match.group(1) ?? match.group(2)] ?? match.group(0)!,
    );
}
