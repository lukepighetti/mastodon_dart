import 'dart:convert';

import '../authentication.dart';
import '../data/attachment.dart';
import '../utilities.dart';

mixin MediaAttachments on Authentication, Utilities {
  /// POST /api/v1/media
  ///
  /// - authenticated (requires user)
  /// - write write:media
  Future<Attachment> uploadAttachment(dynamic file,
      {String? description, Object? focus}) async {
    final response = await request(
      Method.post,
      "/api/v1/media",
      authenticated: true,
      payload: {
        "file": file,
        "description": description,
        "focus": focus,
      },
    );

    return Attachment.fromJson(json.decode(response.body));
  }

  /// PUT /api/v1/media/:id
  ///
  /// - authenticated (requires user)
  /// - write write:media
  Future<Attachment> updateAttachment(String id,
      {String? description, Object? focus}) async {
    final response = await request(
      Method.put,
      "/api/v1/media/$id",
      authenticated: true,
      payload: {
        "description": description,
        "focus": focus,
      }..removeWhere((_, value) => value == null),
    );

    return Attachment.fromJson(json.decode(response.body));
  }
}
