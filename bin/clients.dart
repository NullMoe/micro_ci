import 'package:http/http.dart';
import 'package:micro_ci/src/github/github_client.dart';
import 'package:micro_ci/src/telegram/telegram_client.dart';

import 'server.dart';

final gitHubClient = GitHubClient(token: serverConfig.gitHubToken, client: Client());
final telegramClient = TelegramClient(token: serverConfig.telegramToken, client: Client());
