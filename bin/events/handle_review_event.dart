import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';

import '../config/event.dart';
import '../github/webhook_models/pull_request_review.dart';
import '../server.dart';
import '../tools/check_events.dart';
import '../tools/run.dart';

void _log(IOSink sink, WebHookPullRequestReviewSubmitted review, String message) =>
  sink.writeln('Review(${review.pullRequest.id})[${review.pullRequest.head.label} -> ${review.pullRequest.base.label}]: $message');

Future<void> handleReviewEvent(String body) async {
  final Object review;
  try {
    review = WebHookPullRequestReview.parse(body);
  } on MapperException catch (e) {
    stderr.writeln('MapperException while parsing WebHookPullRequestReview.\n$e');
    return;
  }

  if (review is WebHookPullRequestReviewSubmitted) {
    if (review.pullRequest.base.repo.fullName != review.pullRequest.head.repo.fullName) {
      _log(stdout, review, 'Building non-local review is not yet possible. Skip.');
      return;
    }
    if (review.review.state != 'approved') {
      _log(stdout, review, 'Review is not approved. Skip.');
      return;
    }
    for (final MapEntry(key: jobName, value: job) in config.jobs.entries) {
      final events = job.events.whereType<LocalReviewEvent>();
      if (events.isEmpty)
        continue;

      var hit = false;
      for (final event in events) {
        final head = checkList(event.head, review.pullRequest.head.ref, (p0) => p0);
        final base = event.base.isEmpty || checkList(event.base, review.pullRequest.base.ref, (p0) => p0);

        if (head && base) {
          hit = true;
          break;
        }
      }

      if (!hit)
        continue;

      _log(stdout, review, 'Checks passed. Running.');
      await run(
        (
          job: job,
          jobName: jobName,
          headSha: review.pullRequest.head.sha,
          headBranch: review.pullRequest.head.ref,
          headRepoFullName: review.pullRequest.head.repo.fullName,
          baseBranch: review.pullRequest.base.sha,
          baseRepoFullName: review.pullRequest.base.ref,
          baseSha: review.pullRequest.base.repo.fullName,
        ),
      );

      return;
    }

    _log(stdout, review, 'No events found for this review. Skip.');
  }
}
