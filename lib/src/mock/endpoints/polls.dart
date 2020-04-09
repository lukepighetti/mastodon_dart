import 'package:mastodon_dart/mastodon_dart.dart';

class MockPolls {
  /// GET /api/v1/polls/:id
  Future<Poll> poll(String id) => Future.value(Poll.mock());

  /// POST /api/v1/polls/:id/votes
  Future<Poll> voteOnPoll(String id) => Future.value(Poll.mock());
}
