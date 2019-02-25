export 'dart:convert';
export 'package:http/http.dart';

export 'package:mastodon/mastodon.dart';

class MastodonException implements Exception {
  final String message;

  MastodonException(this.message);

  @override
  String toString() => message;
}
