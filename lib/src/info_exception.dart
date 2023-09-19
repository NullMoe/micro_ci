class InfoException implements Exception {
  InfoException(this.message, {this.original});

  Object? message;
  Exception? original;
}
