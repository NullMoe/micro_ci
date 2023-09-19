extension SubstituteEnvironmentVariables on String {
  String substituteEnvironmentVariables(Map<String, String> env) =>
    replaceAllMapped(RegExp('%([A-Za-z0-9_-]+)%'),
      (match) => env[match.group(1)] ?? '%${match.group(1)}%',
    );
}
