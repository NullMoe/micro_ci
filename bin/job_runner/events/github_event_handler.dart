import 'package:glob/glob.dart';
import 'package:micro_ci/micro_ci.dart';

import '../job_runner_arguments.dart';


typedef _EventHandler<T extends Event> = JobRunnerArguments Function(List<T> filters, String payload);
typedef _EventsMapValue = (List<Event>, _EventHandler);

class GitHubEventHandler {
  GitHubEventHandler(this.events);

  final List<Event> events;
  late final Map<String, _EventsMapValue> _eventsMap = {
    'pull_request_review': (
      events.whereType<LocalReviewEvent>().toList(),
      _wrapHandler(_handleReviewEvent),
    ),
    'push': (
      events.whereType<PushEvent>().toList(),
      _wrapHandler(_handlePushEvent),
    )
  };

  _EventHandler _wrapHandler<T extends Event>(_EventHandler<T> handler) =>
    (filters, payload) => handler(filters as List<T>, payload);

  JobRunnerArguments _handleReviewEvent(List<LocalReviewEvent> filters, String payload) {
    if (filters.isEmpty)
      throw ArgumentError.value(filters, 'filters', 'empty');

    final review = WebHookPullRequestReview.parse(payload);

    if (review is WebHookPullRequestReviewSubmitted) {
      if (review.pullRequest.base.repo.fullName != review.pullRequest.head.repo.fullName)
        throw UnimplementedError('Review(${review.pullRequest.id}): building non-local review is not yet possible.');

      if (review.review.state != 'approved')
        throw Exception('Review(${review.pullRequest.id}): is not approved.');

      if (!filters.any((filter) =>
        filter.head.any((branchName) =>
          Glob(branchName).matches(review.pullRequest.head.ref),
        ) && (
          filter.base.isEmpty ||
          filter.base.any((branchName) =>
            Glob(branchName).matches(review.pullRequest.base.ref),
          )
        ),
      ))
        throw Exception('Review(${review.pullRequest.id}): does not match any event filter.');

      // _log(stdout, review, 'Checks passed. Running.');

      return JobRunnerArguments(
        headSha: review.pullRequest.head.sha,
        headBranch: review.pullRequest.head.ref,
        headRepoFullName: review.pullRequest.head.repo.fullName,
        baseBranch: review.pullRequest.base.sha,
        baseRepoFullName: review.pullRequest.base.ref,
        baseSha: review.pullRequest.base.repo.fullName,
      );
    }

    throw UnimplementedError('${review.runtimeType} handling is not implemented.');
  }

  JobRunnerArguments _handlePushEvent(List<PushEvent> filters, String payload) {
    if (filters.isEmpty)
      throw ArgumentError.value(filters, 'filters', 'empty');

    final push = WebHookPush.parse(payload);

    if (!filters.any((pushEvent) =>
      pushEvent.head.any((name) =>
        Glob(name).matches(push.branchName),
      ),
    ))
      throw Exception('Push(${push.after.substring(0, 7)}): does not match any event filter.');

    return JobRunnerArguments(
      headSha: push.after,
      headBranch: push.branchName,
      headRepoFullName: push.repository.fullName,
      baseBranch: null,
      baseRepoFullName: null,
      baseSha: null,
    );
  }

  JobRunnerArguments handleEvent(String eventName, String payload) =>
    switch (_eventsMap[eventName]) {
      _EventsMapValue($1: final filters, $2: final handler) =>
        handler(filters, payload),
      _ => throw UnimplementedError('$eventName is missing from events map.'),
    };
}
