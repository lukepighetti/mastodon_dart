import 'package:json_annotation/json_annotation.dart';

part 'attachment.g.dart';

/// Represents a file or media attachment that can be added to a status.
/// https://docs.joinmastodon.org/entities/attachment/

@JsonSerializable()
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

  final Uri? remoteUrl;

  /// A shorter URL for the attachment

  final Uri? textUrl;

  /// Metadata returned by Paperclip
  /// May contain subtrees small and original, as well as various other top-level properties.
  /// More importantly, there may be another top-level focus Hash object as of Mastodon 2.3.0,
  /// with coordinates can be used for smart thumbnail cropping

  final Object? meta;

  /// Alternate text that describes what is in the media attachment, to be used for the visually impaired or when media attachments do not load

  final String? description;

  /// A hash computed by the [BlurHash algorithm](https://github.com/woltapp/blurhash), for generating colorful preview thumbnails when media has not been downloaded yet

  final String? blurhash;

  Attachment({
    required this.id,
    required this.type,
    required this.url,
    required this.remoteUrl,
    required this.previewUrl,
    required this.textUrl,
    required this.meta,
    required this.description,
    required this.blurhash,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}

enum AttachmentType { unknown, image, gifv, video, audio }
