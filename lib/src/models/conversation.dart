import 'package:json_annotation/json_annotation.dart';
import 'account.dart';
import 'status.dart';

part 'conversation.g.dart';

/// Represents a conversation with "direct message" visibility.
/// https://docs.joinmastodon.org/entities/conversation/

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Conversation {
  /// Local database ID of the conversation
  final String id;

  /// Participants in the conversation
  final List<Account> accounts;

  /// Is the conversation currently marked as unread?
  final bool unread;

  /// The last status in the conversation, to be used for optional display
  final Status? lastStatus;

  Conversation({
    required this.id,
    required this.accounts,
    required this.lastStatus,
    required this.unread,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}
