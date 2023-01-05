import 'package:json_annotation/json_annotation.dart';
import 'status.dart';

part 'context.g.dart';

/// Represents the tree around a given status. Used for reconstructing threads of statuses.
/// https://docs.joinmastodon.org/entities/context/

@JsonSerializable()
class Context {
  /// Parents in the thread
  final List<Status> ancestors;

  /// Children in the thread
  final List<Status> descendants;

  Context({
    required this.ancestors,
    required this.descendants,
  });

  factory Context.fromJson(Map<String, dynamic> json) =>
      _$ContextFromJson(json);
  Map<String, dynamic> toJson() => _$ContextToJson(this);
}
