import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';

part 'filter.g.dart';

/// Represents a user-defined filter for determining which statuses should not be shown to the user.
/// https://docs.joinmastodon.org/entities/filter/
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

  final bool wholeWord;

  @JsonKey(nullable: true)
  final DateTime expiresAt;

  final bool irreversible;

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
