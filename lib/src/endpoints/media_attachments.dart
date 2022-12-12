import 'dart:convert';

import '../authentication.dart';
import '../models/attachment.dart';
import '../utilities.dart';

mixin MediaAttachments on Authentication, Utilities {
  /// POST /api/v2/media
  ///
  /// - authenticated (requires user)
  /// - write write:media
  Future<Attachment> uploadAttachment(String file,
      {String? description, Object? focus}) async {
    final response = await request(
      Method.post,
      "/api/v2/media",
      authenticated: true,
      payload: {
        "description": description,
        "focus": focus,
      },
      files: {
        "file": file,
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
