import '../library.dart';

import '../mock/endpoints/media_attachments.dart';

mixin MediaAttachments
    on Authentication, Utilities
    implements MockMediaAttachments {
  /// POST /api/v1/media
  ///
  /// - authenticated (requires user)
  /// - write write:media
  ///
  /// https://docs.joinmastodon.org/api/rest/media/#post-api-v1-media
  Future<Attachment> uploadAttachment(dynamic file,
      {String description, dynamic focus}) async {
    /// TODO: implement [file], [focus]

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
  ///
  /// https://docs.joinmastodon.org/api/rest/media/#put-api-v1-media-id
  Future<Attachment> updateAttachment(String id,
      {String description, dynamic focus}) async {
    /// TODO: implement [file], [focus]

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
