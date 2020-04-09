import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';

part 'attachment.g.dart';

/// Represents a file or media attachment that can be added to a status.
/// https://docs.joinmastodon.org/entities/attachment/

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Attachment {
  final String id;
  final AttachmentType type;
  final Uri url;
  final Uri previewUrl;

  @JsonKey(nullable: true)
  final Uri remoteUrl;

  @JsonKey(nullable: true)
  final Uri textUrl;

  @JsonKey(nullable: true)
  final dynamic meta;

  @JsonKey(nullable: true)
  final String description;

  @JsonKey(nullable: true)
  final String blurhash;

  Attachment({
    this.id,
    this.type,
    this.url,
    this.remoteUrl,
    this.previewUrl,
    this.textUrl,
    this.meta,
    this.description,
    this.blurhash,
  });

  /// TODO: mock appropriate urls to match the attachment type
  Attachment.mock()
      : id = MockProperties.string,
        type = AttachmentType.unknown,
        url = MockProperties.headerUri,
        remoteUrl = MockProperties.headerUri,
        previewUrl = MockProperties.headerUri,
        textUrl = MockProperties.uri,
        meta = null,
        description = MockProperties.comment,
        blurhash = MockProperties.string;

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
}

/// https://docs.joinmastodon.org/api/entities/#type

enum AttachmentType { unknown, image, gifv, video, audio }
