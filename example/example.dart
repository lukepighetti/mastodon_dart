import 'package:mastodon/mastodon.dart';

main() async {
  final mastodon = MockMastodon();

  /// Hit the endpoints with blank parameters
  mastodon.account("").then((a) => print(
      [a, a.id, a.username, a.avatar, a.followersCount, a.followingCount]));

  /// Get mock data classes for building UIs
  /// [Instance of 'Account', 78056791, onegerbal4511, https://randomuser.me/api/portraits/men/64.jpg, 861, 34]
}
