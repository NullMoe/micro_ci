
import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';

import '../config/event.dart';
import '../github/webhook_models/push.dart';
import '../server.dart';
import '../tools/check_events.dart';
import '../tools/run.dart';


void _log(IOSink sink, WebHookPush push, String message) =>
  sink.writeln('Push(${push.after.substring(0, 7)})[${push.branchName}]: $message');

Future<void> handlePushEvent(String body) async {
  final WebHookPush push;
  try {
    push = WebHookPush.parse(body);
  } on MapperException catch (e) {
    stderr.writeln('MapperException while parsing WebHookPush.\n$e');
    return;
  }

  for (final MapEntry(key: jobName, value: job) in config.jobs.entries) {
    final events = job.events.whereType<PushEvent>();
    if (events.isEmpty)
      continue;

      var hit = false;
      for (final event in events) {
        final head = checkList(event.head, push.branchName, (p0) => p0);

        if (head) {
          hit = true;
          break;
        }
      }

      if (!hit)
        continue;

    _log(stdout, push, 'Checks passed. Running.');
    await run(
      (
        job: job,
        jobName: jobName,
        headSha: push.after,
        headBranch: push.branchName,
        headRepoFullName: push.repository.fullName,
        baseBranch: null,
        baseRepoFullName: null,
        baseSha: null,
      ),
    );

    return;
  }

  _log(stdout, push, 'No events found for this push. Skip.');
}
