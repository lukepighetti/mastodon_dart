import 'package:mastodon_dart/mastodon_dart.dart';

class MockMediaAttachments {
  /// POST /api/v1/media
  /// https://docs.joinmastodon.org/api/rest/media/#post-api-v1-media
  Future<Attachment> uploadAttachment(dynamic file,
          {String description, dynamic focus}) =>
      Future.value(Attachment.mock());

  /// PUT /api/v1/media/:id
  /// https://docs.joinmastodon.org/api/rest/media/#put-api-v1-media-id
  Future<Attachment> updateAttachment(String id,
          {String description, dynamic focus}) =>
      Future.value(Attachment.mock());
}
