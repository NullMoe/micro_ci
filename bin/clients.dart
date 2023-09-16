import 'package:http/http.dart';

import 'github/github_client.dart';
import 'server.dart';
import 'telegram/telegram_client.dart';

final gitHubClient = GitHubClient(token: serverConfig.gitHubToken, client: Client());
final telegramClient = TelegramClient(token: serverConfig.telegramToken, client: Client());
