import 'package:json_annotation/json_annotation.dart';

part 'application.g.dart';

/// https://docs.joinmastodon.org/api/entities/#application

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Application {
  final String name;

  @JsonKey(nullable: true)
  final Uri website;

  Application({this.name, this.website});

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);
}
