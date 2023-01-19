class MastodonException implements Exception {
  final int statusCode;
  final String message;
  final String description;

  MastodonException(this.statusCode, this.message, this.description);

  @override
  String toString() => "MastodonException: $statusCode $message";
}

class ResultException implements Exception {
  final Exception exception;
  final String unparsed;

  ResultException({
    required this.exception,
    required this.unparsed,
  });

  @override
  String toString() => "ResultException: $exception";
}
