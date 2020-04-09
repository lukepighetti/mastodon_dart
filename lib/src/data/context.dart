import 'package:json_annotation/json_annotation.dart';
import 'status.dart';

part 'context.g.dart';

/// Represents the tree around a given status. Used for reconstructing threads of statuses.
/// https://docs.joinmastodon.org/entities/context/

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Context {
  /// Parents in the thread
  final List<Status> ancestors;

  /// Children in the thread
  final List<Status> descendants;

  Context({
    this.ancestors,
    this.descendants,
  });

  Context.mock()
      : ancestors = [
          Status.mock(),
          Status.mock(),
        ],
        descendants = [
          Status.mock(),
          Status.mock(),
        ];

  factory Context.fromJson(Map<String, dynamic> json) =>
      _$ContextFromJson(json);
}
