import '../library.dart';

/// View and vote on polls attached to statuses. To discover poll ID,
/// you will need to GET a Status first and then check for a `poll` property.
///
/// https://docs.joinmastodon.org/methods/statuses/polls/
mixin Polls on Authentication, Utilities {
  /// GET /api/v1/polls/:id
  ///
  /// - public if parent status is public
  /// - token + read:statuses if parent status is private
  Future<Poll> poll(String id) async {
    final response = await request(
      Method.get,
      "/api/v1/polls/$id",
    );

    return Poll.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/polls/:id/votes
  ///
  /// - token + write:statuses
  Future<Poll> voteOnPoll(String id) async {
    final response = await request(
      Method.get,
      "/api/v1/polls/$id/votes",
    );

    return Poll.fromJson(json.decode(response.body));
  }
}
