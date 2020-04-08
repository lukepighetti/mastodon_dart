import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/mock/properties.dart';

import 'account.dart';
import 'status.dart';

part 'conversation.g.dart';

/// Represents a conversation with "direct message" visibility.
/// https://docs.joinmastodon.org/entities/conversation/

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Conversation {
  final String id;
  final bool unread;
  final List<Account> accounts;

  @JsonKey(nullable: true)
  final Status lastStatus;

  Conversation({
    this.id,
    this.accounts,
    this.lastStatus,
    this.unread,
  });

  Conversation.mock()
      : id = MockProperties.string,
        accounts = MockProperties.randomSublist([
          Account.mock(),
          Account.mock(),
          Account.mock(),
          Account.mock(),
        ]),
        lastStatus = Status.mock(),
        unread = MockProperties.boolean;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}
