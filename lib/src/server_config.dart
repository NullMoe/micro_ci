import 'dart:io';

import 'package:dotenv/dotenv.dart';


class ServerConfig {
  const ServerConfig._({
    required this.ciPort,
    required this.telegramToken,
    required this.gitHubToken,
    required this.ciToken,
  });

  factory ServerConfig.load(String? path) {
    if (path != null && File(path).existsSync())
      dotenv.load([path]);


    final telegramToken = getString('TELEGRAM_TOKEN');
    if (telegramToken == null)
      throw Exception('TELEGRAM_TOKEN environment variable must be specified.');

    final gitHubToken = getString('GITHUB_TOKEN');
    if (gitHubToken == null)
      throw Exception('GITHUB_TOKEN environment variable must be specified.');

    final port = getNum<int>('CI_SERVER_PORT') ?? 10427;

    final ciServerToken = getString('CI_SERVER_API_ACCESS_TOKEN');
    if (ciServerToken == null)
      throw Exception('CI_SERVER_API_ACCESS_TOKEN environment variable must be specified.');

    return ServerConfig._(
      ciPort: port,
      telegramToken: telegramToken,
      gitHubToken: gitHubToken,
      ciToken: ciServerToken,
    );
  }

  final String telegramToken;
  final String gitHubToken;
  final int ciPort;
  final String ciToken;

  static final dotenv = DotEnv();

  /// Returns environment variable or `.env` variable
  static String? getString(String variable) =>
    Platform.environment[variable] ?? dotenv[variable];

  static T? getNum<T extends num>(String variable) => switch(getString(variable)) {
    final String value => switch(T) {
      double => double.tryParse(value),
      int => int.tryParse(value),
      _ => null,
    } as T?,
    _ => null,
  };
}
