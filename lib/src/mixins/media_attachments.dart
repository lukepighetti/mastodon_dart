import '../library.dart';

import '../mock/mixins/media_attachments.dart';

mixin MediaAttachments on Authentication implements MockMediaAttachmentsMixin {
  /// POST /api/v1/media
  ///
  /// - authenticated (requires user)
  /// - write write:media
  ///
  /// https://docs.joinmastodon.org/api/rest/media/#post-api-v1-media
  Future<Attachment> uploadAttachment(dynamic file,
      {String description, dynamic focus}) async {
    /// TODO: implement [file], [focus]
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/media",
      queryParameters: {
        "file": file,
        "description": description,
        "focus": focus,
      },
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/media/$id",
      queryParameters: {
        "description": description,
        "focus": focus,
      }..removeWhere((_, value) => value == null),
    );

    final response = await put(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    return Attachment.fromJson(json.decode(response.body));
  }
}
