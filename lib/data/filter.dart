import 'package:json_annotation/json_annotation.dart';

part 'filter.g.dart';

/// https://docs.joinmastodon.org/api/entities/#context
///
/// TODO: follow Implementation Notes

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Filter {
  final String id;
  final String phrase;
  final List<FilterContext> context;

  @JsonKey(nullable: true)
  final DateTime expiresAt;

  final bool irreversible;
  final bool wholeWord;

  Filter({
    this.id,
    this.phrase,
    this.context,
    this.expiresAt,
    this.irreversible,
    this.wholeWord,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
}

enum FilterContext { home, notifications, public, thread }
