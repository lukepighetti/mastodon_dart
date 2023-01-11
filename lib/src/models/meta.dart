import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

/// Metadata returned by Paperclip.
/// May contain subtrees small and original, as well as various other top-level
/// properties.
///
/// More importantly, there may be another top-level focus Hash object on
/// images as of 2.3.0, with coordinates can be used for smart thumbnail
/// cropping
///
/// https://docs.joinmastodon.org/entities/MediaAttachment/#meta

@JsonSerializable()
class Meta {
  String? length;
  double? duration;
  int? fps;
  String? size;
  int? width;
  int? height;
  double? aspect;
  Focus? focus;
  String? audioEncode;
  String? audioBitrate;
  String? audioChannels;
  Details? original;
  Details? small;

  Meta({
    this.length,
    this.duration,
    this.fps,
    this.size,
    this.width,
    this.height,
    this.aspect,
    this.focus,
    this.audioEncode,
    this.audioBitrate,
    this.audioChannels,
    this.original,
    this.small,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class Focus {
  double? x;
  double? y;

  Focus({
    this.x,
    this.y,
  });

  factory Focus.fromJson(Map<String, dynamic> json) => _$FocusFromJson(json);
  Map<String, dynamic> toJson() => _$FocusToJson(this);
}

@JsonSerializable()
class Details {
  double? duration;
  int? bitrate;
  int? width;
  int? height;
  String? size;
  double? aspect;
  String? frameRate;

  Details({
    this.duration,
    this.bitrate,
    this.width,
    this.height,
    this.size,
    this.aspect,
    this.frameRate,
  });

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);
  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}
