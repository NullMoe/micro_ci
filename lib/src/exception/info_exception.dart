class InfoException implements Exception {
  InfoException(this.message, {this.original});

  Object? message;
  Exception? original;

  @override
  String toString() => 'InfoException($message, original: $original)';
}
