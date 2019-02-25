import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon/src/mock/properties.dart';

import 'account.dart';
import 'status.dart';

part 'conversation.g.dart';

/// https://docs.joinmastodon.org/api/entities/#conversation

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Conversation {
  final String id;
  final List<Account> accounts;

  @JsonKey(nullable: true)
  final Status lastStatus;

  final bool unread;

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
