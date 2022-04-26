import 'package:json_annotation/json_annotation.dart';

import 'emoji.dart';

part 'account.g.dart';

/// Represents a user of Mastodon and their associated profile.
/// https://docs.joinmastodon.org/entities/account/

@JsonSerializable(
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

  final Account? moved;

  /// Additional metadata attached to a profile as name-value pairs

  final List<Field>? fields;

  /// A presentational flag. Indicates that the account may perform automated actions, may not be monitored, or identifies as a robot

  final bool? bot;

  /// The time and date the last status was posted at
  final DateTime lastStatusAt;

  Account({
    required this.id,
    required this.username,
    required this.acct,
    required this.displayName,
    required this.locked,
    required this.createdAt,
    required this.followersCount,
    required this.followingCount,
    required this.statusesCount,
    required this.note,
    required this.url,
    required this.avatar,
    required this.avatarStatic,
    required this.header,
    required this.headerStatic,
    required this.lastStatusAt,
    required this.emojis,
    required this.moved,
    required this.fields,
    required this.bot,
    required this.discoverable,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

/// Represents a profile field as a name-value pair with optional verification.
/// https://docs.joinmastodon.org/entities/field/

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Field {
  /// The key of a given field's key-value pai
  final String name;

  /// The value associated with the [name] key
  final String value;

  /// Timestamp of when the server verified a URL value for a rel="me” link

  final DateTime? verifiedAt;

  Field({
    required this.name,
    required this.value,
    required this.verifiedAt,
  });

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
}

/// Represents display or publishing preferences of user's own account.
/// Returned as an additional entity when verifying and updated credentials, as an attribute of Account.
/// https://docs.joinmastodon.org/entities/source/

@JsonSerializable(
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

  final String? privacy;

  /// Whether new statuses should be marked sensitive by default

  final bool? sensitive;

  /// The default posting language for new statuses

  final dynamic? language;

  /// The number of pending follow requests
  final int followRequestsCount;

  Source({
    required this.privacy,
    required this.sensitive,
    required this.language,
    required this.note,
    required this.fields,
    required this.followRequestsCount,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

/// Represents an OAuth token used for authenticating with the API and performing actions.
/// https://docs.joinmastodon.org/entities/token/

@JsonSerializable(
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
    required this.accessToken,
    required this.tokenType,
    required this.scope,
    required this.createdAt,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  static DateTime _secondsSinceEpoch(int seconds) =>
      DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
}
