class JobRunnerArguments {
  const JobRunnerArguments({
    required this.headBranch,
    required this.headRepoFullName,
    required this.headSha,
    this.baseBranch,
    this.baseRepoFullName,
    this.baseSha,
  });

  final String headBranch;
  final String headRepoFullName;
  final String headSha;
  final String? baseBranch;
  final String? baseRepoFullName;
  final String? baseSha;
}
