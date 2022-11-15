class MastodonException implements Exception {
  MastodonException(this.statusCode, this.message, this.description);

  final int statusCode;
  final String message;
  final String description;

  @override
  String toString() => "MastodonException($statusCode, $message, $description)";
}
