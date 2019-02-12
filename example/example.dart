import 'package:mastodon/mastodon.dart';

main() async {
  final mastodon = MockMastodon();

  mastodon.account("id").then((a) =>
      print([a.id, a.username, a.avatar, a.followersCount, a.followingCount]));
}
