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
  /// The ID of the attachment in the database
  final String id;
  /// The type of the attachment, enumerated in [AttachmentType]
  /// - unknown = unsupported or unrecognized file type
  /// - image = Static image
  /// - gifv = Looping, soundless animation
  /// - video = Video clip
  /// - audio = Audio track
  final AttachmentType type;
  /// The location of the original full-size attachment
  final Uri url;
  /// The location of a scaled-down preview of the attachment
  final Uri previewUrl;
  /// The location of the full-size original attachment on the remote website
  @JsonKey(nullable: true)
  final Uri remoteUrl;
  /// A shorter URL for the attachment
  @JsonKey(nullable: true)
  final Uri textUrl;
  /// Metadata returned by Paperclip
  /// May contain subtrees small and original, as well as various other top-level properties.
  /// More importantly, there may be another top-level focus Hash object as of Mastodon 2.3.0,
  /// with coordinates can be used for smart thumbnail cropping
  @JsonKey(nullable: true)
  final dynamic meta;
  /// Alternate text that describes what is in the media attachment, to be used for the visually impaired or when media attachments do not load
  @JsonKey(nullable: true)
  final String description;
  /// A hash computed by the (BlurHash algorithm)[https://github.com/woltapp/blurhash], for generating colorful preview thumbnails when media has not been downloaded yet
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

enum AttachmentType { unknown, image, gifv, video, audio }
