class MastodonException implements Exception {
  final int statusCode;
  final String message;
  final String description;

  MastodonException(this.statusCode, this.message, this.description);

  @override
  String toString() => "MastodonException: $statusCode $message";
}
