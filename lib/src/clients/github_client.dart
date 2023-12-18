import 'dart:convert';

import 'package:http/http.dart';

import '../models/github/api_models/check_status.dart';

class GitHubClient {
  GitHubClient({required this.token, Client? client,})
    : _client = client ?? Client();

  final String token;
  final Client _client;

  Future<String> createCommitStatus(String fullName, String sha, CheckStatus status) async {
    final response = await _client.post(Uri.https('api.github.com', '/repos/$fullName/statuses/$sha'),
      headers: {
        'Accept': 'application/vnd.github+json',
        'Authorization': 'Bearer $token',
        'X-GitHub-Api-Version': '2022-11-28',
      },
      body: jsonEncode(status.toMap()..removeWhere((key, value) => value == null)),
    );

    return response.body;
  }
}
