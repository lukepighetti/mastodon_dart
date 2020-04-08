import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/mock/properties.dart';

import 'emoji.dart';

part 'account.g.dart';

/// https://docs.joinmastodon.org/entities/account/

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

  @JsonKey(nullable: true)
  final bool bot;

  final DateTime createdAt;
  final String note;
  final Uri url;
  final Uri avatar;
  final Uri avatarStatic;
  final Uri header;
  final Uri headerStatic;
  final int followersCount;
  final int followingCount;
  final int statusesCount;
  final DateTime lastStatusAt;
  final List<Emoji> emojis;

  @JsonKey(nullable: true)
  final Account moved;

  @JsonKey(nullable: true)
  final List<Field> fields;

  Account({
    this.id,
    this.username,
    this.acct,
    this.displayName,
    this.locked,
    this.createdAt,
    this.followersCount,
    this.followingCount,
    this.statusesCount,
    this.note,
    this.url,
    this.avatar,
    this.avatarStatic,
    this.header,
    this.headerStatic,
    this.lastStatusAt,
    this.emojis,
    this.moved,
    this.fields,
    this.bot,
  });

  Account.mock()
      : id = MockProperties.string,
        username = MockProperties.username,
        acct = MockProperties.string,
        displayName = MockProperties.fullName,
        locked = MockProperties.boolean,
        createdAt = MockProperties.pastDate,
        followersCount = MockProperties.integer,
        followingCount = MockProperties.integer,
        statusesCount = MockProperties.integer,
        note = MockProperties.comment,
        url = MockProperties.uri,
        avatar = MockProperties.avatarUri,
        avatarStatic = MockProperties.avatarUri,
        header = MockProperties.headerUri,
        headerStatic = MockProperties.headerUri,
        lastStatusAt = MockProperties.pastDate,
        emojis = <Emoji>[Emoji.mock(), Emoji.mock(), Emoji.mock()],
        moved = null,
        fields = <Field>[Field.mock(), Field.mock()],
        bot = MockProperties.boolean;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

/// https://docs.joinmastodon.org/api/entities/#field

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Field {
  final String name;
  final String value;

  @JsonKey(nullable: true)
  final DateTime verifiedAt;

  Field({
    this.name,
    this.value,
    this.verifiedAt,
  });

  Field.mock()
      : name = MockProperties.firstName,
        value = MockProperties.tag,
        verifiedAt = MockProperties.pastDate;

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
}

/// https://docs.joinmastodon.org/api/entities/#source

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Source {
  @JsonKey(nullable: true)
  final String privacy;

  @JsonKey(nullable: true)
  final bool sensitive;

  @JsonKey(nullable: true)
  final dynamic language;

  final String note;
  final List<Field> fields;

  Source({
    this.privacy,
    this.sensitive,
    this.language,
    this.note,
    this.fields,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

/// https://docs.joinmastodon.org/api/entities/#token

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Token {
  final String accessToken;
  final String tokenType;
  final String scope;

  @JsonKey(fromJson: _secondsSinceEpoch)
  final DateTime createdAt;

  static DateTime _secondsSinceEpoch(int seconds) =>
      DateTime.fromMillisecondsSinceEpoch(seconds * 1000);

  Token({
    this.accessToken,
    this.tokenType,
    this.scope,
    this.createdAt,
  });

  Token.mock()
      : accessToken = MockProperties.string,
        tokenType = MockProperties.string,
        scope = MockProperties.string,
        createdAt = MockProperties.pastDate;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
