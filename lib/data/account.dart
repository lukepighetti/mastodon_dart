import 'package:json_annotation/json_annotation.dart';

import 'emoji.dart';

part 'account.g.dart';

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Account {
  final String id;
  final String username;
  final String acct;
  final String displayName;
  final bool locked;
  final DateTime created_at;
  final int followersCount;
  final int followingCount;
  final int statusesCount;
  final String note;
  final Uri url;
  final Uri avatar;
  final Uri avatarStatic;
  final Uri header;
  final Uri headerStatic;
  final List<Emoji> emojis;

  @JsonKey(nullable: true)
  final Account moved;

  @JsonKey(nullable: true)
  final List<dynamic> fields;

  @JsonKey(nullable: true)
  final bool bot;

  Account({
    this.id,
    this.username,
    this.acct,
    this.displayName,
    this.locked,
    this.created_at,
    this.followersCount,
    this.followingCount,
    this.statusesCount,
    this.note,
    this.url,
    this.avatar,
    this.avatarStatic,
    this.header,
    this.headerStatic,
    this.emojis,
    this.moved,
    this.fields,
    this.bot,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
