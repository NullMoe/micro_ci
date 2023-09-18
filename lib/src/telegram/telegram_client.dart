import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

import 'models/message.dart';
import 'models/response.dart';


typedef TelegramFile = ({String path, String? name, String? caption});
typedef _ValidateFiles = ({
  Iterable<Iterable<TelegramFile>> parts,
  Iterable<TelegramFile> missing,
  Iterable<TelegramFile> large,
});

class TelegramClient {
  TelegramClient({required String token, Client? client})
    : _client = client ?? Client(),
      _token = token;

  final Client _client;
  final String _token;

  Uri _getUrl(String method, [Map<String, dynamic>? query]) =>
    Uri.https('api.telegram.org', '/bot$_token/$method', query);

  Future<TelegramMessage> sendMessage({
    required String chatId,
    required String message,
    int? replyTo,
  }) async {
    final request = Request('GET',
      _getUrl('sendMessage',
        {
          'chat_id': chatId,
          'text': message,
          if (replyTo != null)
            ...{
              'reply_to_message_id': replyTo.toString(),
              'allow_sending_without_reply': 'true',
            }
        }
      ),
    );

    final response = await Response.fromStream(await _client.send(request));
    // TODO: check response for errors
    return TelegramResponse<TelegramMessage>.parse(response.body).result;
  }

  _ValidateFiles _validateFiles(Iterable<TelegramFile> files, int maxSize, int maxCount) {
    final missing = <TelegramFile>[];
    final large = <TelegramFile>[];
    final filesToAttach = <TelegramFile>[];

    for (final telegramFile in files) {
      final file = File(telegramFile.path);
      if (!file.existsSync()) {
        missing.add(telegramFile);
        continue;
      }

      final fileSize = file.lengthSync();
      if (fileSize > maxSize) {
        large.add(telegramFile);
        continue;
      }

      filesToAttach.add(telegramFile);
    }

    return (
      parts: filesToAttach.slices(maxCount),
      missing: missing,
      large: large,
    );
  }

  Stream<List<TelegramMessage>> sendMediaGroup({
    required String chatId,
    required Iterable<TelegramFile> media,
    int? replyTo,
  }) async* {
    final files = _validateFiles(media, 50 * 1024 * 1024, 10);
    for (final part in files.parts) {
      final attachments = [
        for (final file in part)
          {
            'type': 'document',
            'media': 'attach://${basename(file.path)}',
            if (file.caption != null)
              'caption': file.caption,
          },
      ];

      final multipart = MultipartRequest('GET',
        _getUrl('sendMediaGroup',
          {
            'chat_id': chatId,
            'media': jsonEncode(attachments),
            if (replyTo != null)
              ...{
                'reply_to_message_id': replyTo.toString(),
                'allow_sending_without_reply': 'true',
              }
          }
        ),
      );

      multipart.files.addAll([
        for(final file in media)
          await MultipartFile.fromPath(basename(file.path), file.path, filename: file.name),
      ]);

      final response = await Response.fromStream(await _client.send(multipart));

      yield TelegramResponse<List<TelegramMessage>>.parse(response.body).result;
    }
  }
}
