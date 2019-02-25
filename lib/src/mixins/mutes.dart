import '../library.dart';

import 'package:mastodon/mock/mixins/mutes.dart';

mixin Mutes on Authentication implements MockMutesMixin {
  /// GET /api/v1/mutes
  ///
  /// - authentication (requires user)
  /// - read:mutes follow
  ///
  /// https://docs.joinmastodon.org/api/rest/mutes/#get-api-v1-mutes
  Future<List<Account>> mutes({int limit = 40}) => throw UnimplementedError();

  /// POST /api/v1/accounts/:id/mute
  ///
  /// - authentication (requires user)
  /// - write:mutes follow
  ///
  /// https://docs.joinmastodon.org/api/rest/mutes/#post-api-v1-accounts-id-mute
  Future<Relationship> muteAccount(String id) => throw UnimplementedError();

  /// POST /api/v1/accounts/:id/unmute
  ///
  /// - authentication (requires user)
  /// - write:mutes follow
  ///
  /// https://docs.joinmastodon.org/api/rest/mutes/#post-api-v1-accounts-id-unmute
  Future<Relationship> unmuteAccount(String id) => throw UnimplementedError();

  /// POST /api/v1/statuses/:id/mute
  ///
  /// - authentication (requires user)
  /// - write write:mutes
  ///
  /// https://docs.joinmastodon.org/api/rest/mutes/#post-api-v1-statuses-id-mute
  Future<Status> muteStatus(String id) => throw UnimplementedError();

  /// POST /api/v1/statuses/:id/unmute
  ///
  /// - authentication (requires user)
  /// - write write:mutes
  ///
  /// https://docs.joinmastodon.org/api/rest/mutes/#post-api-v1-statuses-id-unmute
  Future<Status> unmuteStatus(String id) => throw UnimplementedError();
}
