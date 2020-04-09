import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';

import 'emoji.dart';

part 'account.g.dart';

/// Represents a user of Mastodon and their associated profile.
/// https://docs.joinmastodon.org/entities/account/

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Account {
  /// The account id
  final String id;

  /// The username of the account, not including domain
  final String username;

  /// The Webfinger account URI. Equal to username for local users, or username@domain for remote users
  final String acct;

  /// The location of the user's profile page
  final Uri url;

  /// The profile's display name
  final String displayName;

  /// The profile's bio / description
  final String note;

  /// An image icon that is shown next to statuses and in the profile
  final Uri avatar;

  /// A static version of the avatar. Equal to avatar if its value is a static image; different if avatar is an animated GIF
  final Uri avatarStatic;

  /// An image banner that is shown above the profile and in profile cards
  final Uri header;

  /// A static version of the header. Equal to header if its value is a static image; different if header is an animated GIF
  final Uri headerStatic;

  /// Whether the account manually approves follow requests
  final bool locked;

  /// Custom emoji entities to be used when rendering the profile. If none, an empty array will be returned
  final List<Emoji> emojis;

  /// Whether the account has opted into discovery features such as the profile directory
  final bool discoverable;

  /// When the account was created
  final DateTime createdAt;

  /// How many statuses are attached to this account
  final int statusesCount;

  /// The reported followers of this profile
  final int followersCount;

  /// The reported follows of this profile
  final int followingCount;

  /// Indicates that the profile is currently inactive and that its user has moved to a new account
  @JsonKey(nullable: true)
  final Account moved;

  /// Additional metadata attached to a profile as name-value pairs
  @JsonKey(nullable: true)
  final List<Field> fields;

  /// A presentational flag. Indicates that the account may perform automated actions, may not be monitored, or identifies as a robot
  @JsonKey(nullable: true)
  final bool bot;

  /// The time and date the last status was posted at
  final DateTime lastStatusAt;

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
    this.discoverable,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

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
        bot = MockProperties.boolean,
        discoverable = MockProperties.boolean;
}

/// Represents a profile field as a name-value pair with optional verification.
/// https://docs.joinmastodon.org/entities/field/

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Field {
  /// The key of a given field's key-value pai
  final String name;

  /// The value associated with the [name] key
  final String value;

  /// Timestamp of when the server verified a URL value for a rel="me” link
  @JsonKey(nullable: true)
  final DateTime verifiedAt;

  Field({
    this.name,
    this.value,
    this.verifiedAt,
  });

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);

  Field.mock()
      : name = MockProperties.firstName,
        value = MockProperties.tag,
        verifiedAt = MockProperties.pastDate;
}

/// Represents display or publishing preferences of user's own account.
/// Returned as an additional entity when verifying and updated credentials, as an attribute of Account.
/// https://docs.joinmastodon.org/entities/source/

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Source {
  /// Profile bio
  final String note;

  /// Metadata about the account
  final List<Field> fields;

  /// The default post privacy to be used for new statuses
  /// - public = Public post
  /// - unlisted = Unlisted post
  /// - private = Followers-only post
  /// - direct = Direct post
  @JsonKey(nullable: true)
  final String privacy;

  /// Whether new statuses should be marked sensitive by default
  @JsonKey(nullable: true)
  final bool sensitive;

  /// The default posting language for new statuses
  @JsonKey(nullable: true)
  final dynamic language;

  /// The number of pending follow requests
  final int followRequestsCount;

  Source({
    this.privacy,
    this.sensitive,
    this.language,
    this.note,
    this.fields,
    this.followRequestsCount,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

/// Represents an OAuth token used for authenticating with the API and performing actions.
/// https://docs.joinmastodon.org/entities/token/

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Token {
  /// An OAuth token to be used for authorization
  final String accessToken;

  /// The OAuth token type. Mastodon uses `Bearer` tokens
  final String tokenType;

  /// The OAuth scopes granted by this token, space-separated
  final String scope;

  /// When the token was generated
  @JsonKey(fromJson: _secondsSinceEpoch)
  final DateTime createdAt;

  Token({
    this.accessToken,
    this.tokenType,
    this.scope,
    this.createdAt,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Token.mock()
      : accessToken = MockProperties.string,
        tokenType = MockProperties.string,
        scope = MockProperties.string,
        createdAt = MockProperties.pastDate;

  static DateTime _secondsSinceEpoch(int seconds) =>
      DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
}
