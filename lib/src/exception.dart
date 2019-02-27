class MastodonException implements Exception {
  final int statusCode;
  final String message;

  MastodonException(this.statusCode, [this.message]);

  @override
  String toString() => "MastodonException: $statusCode $message";
}
