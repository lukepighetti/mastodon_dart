import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon/mock/properties.dart';

part 'filter.g.dart';

/// https://docs.joinmastodon.org/api/entities/#filter
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

  Filter.mock()
      : id = MockProperties.string,
        phrase = MockProperties.tag,
        context = MockProperties.randomSublist([
          FilterContext.home,
          FilterContext.notifications,
          FilterContext.public,
          FilterContext.thread,
        ]),
        expiresAt = MockProperties.pastDate,
        irreversible = MockProperties.boolean,
        wholeWord = MockProperties.boolean;

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
}

enum FilterContext { home, notifications, public, thread }
