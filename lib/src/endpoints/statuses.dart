import 'dart:convert';

import 'package:http/http.dart' as http;

import '../authentication.dart';
import '../exception.dart';
import '../models/account.dart';
import '../models/card.dart';
import '../models/context.dart';
import '../models/status.dart';
import '../models/visibility.dart';
import '../response.dart';
import '../result.dart';
import '../utilities.dart';

typedef StatusResponse = Response<Result<Status>>;

mixin Statuses on Authentication, Utilities {
  /// GET /api/v1/statuses/:id
  ///
  /// - public
  /// - read read:statuses
  Future<StatusResponse> status(String id) async {
    final response = await request(
      Method.get,
      "/api/v1/statuses/$id",
    );

    try {
      return Response(
        Result.success(
          Status.fromJson(json.decode(response.body)),
        ),
      );
    } on Exception catch (e) {
      return Response(
        Result.failure(
          ModelException(
            exception: e,
            unparsed: response.body,
          ),
        ),
      );
    }
  }

  /// GET /api/v1/statuses/:id/context
  ///
  /// - public / authenticated
  /// - read read:statuses
  ///
  /// NOTE: Public if the status is public
  Future<Context> context(String id) async {
    final response = await request(
      Method.get,
      "/api/v1/statuses/$id/context",
    );

    return Context.fromJson(json.decode(response.body));
  }

  /// GET /api/v1/statuses/:id/card
  ///
  /// - public
  /// - read read:statuses
  Future<Card?> card(String id) async {
    final response = await request(
      Method.get,
      "/api/v1/statuses/$id/card",
    );

    final map = Map<String, dynamic>.from(json.decode(response.body));

    if (map.isEmpty) {
      return null;
    } else {
      return Card.fromJson(map);
    }
  }

  /// GET /api/v1/statuses/:id/reblogged_by
  ///
  /// - public
  /// - read read:statuses
  Future<List<Account>> rebloggedBy(String id, {int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/statuses/$id/reblogged_by",
      payload: {
        "limit": limit.toString(),
      },
    );

    final body = List<Map<String, dynamic>>.from(json.decode(response.body));

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// GET /api/v1/statuses/:id/favourited_by
  ///
  /// - public
  /// - read read:statuses
  Future<List<Account>> favouritedBy(String id, {int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/statuses/$id/favourited_by",
      payload: {
        "limit": limit.toString(),
      },
    );

    final body = List<Map<String, dynamic>>.from(json.decode(response.body));

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// POST /api/v1/statuses
  ///
  /// Currently only supports a single media attachment.
  ///   https://github.com/dart-lang/http/issues/47
  ///
  /// - authenticated
  /// - write write:statuses
  Future<Status> publishStatus({
    String? status,
    String? inReplyToId,
    List<String> mediaIds = const [],
    bool sensitive = false,
    String? spoilerText,
    Visibility? visibility,
    DateTime? scheduledAt,
    dynamic language,
  }) async {
    assert(status != null || mediaIds.isNotEmpty);
    assert(mediaIds.length < 2);

    final response = await request(
      Method.post,
      "/api/v1/statuses",
      authenticated: true,
      payload: {
        "status": status,
        "in_reply_to_id": inReplyToId,
        "media_ids[]": mediaIds.isEmpty ? null : mediaIds.first,
        "sensitive": "$sensitive",
        "visibility": visibility?.toString().split(".").last,
        "scheduled_at": scheduledAt?.toIso8601String(),
        "language": language?.toString(),
      },
    );

    return Status.fromJson(json.decode(response.body));
  }

  /// DELETE /api/v1/statuses/:id
  ///
  /// - authenticated
  /// - write write:statuses
  Future<void> deleteStatus(String id) async {
    try {
      await request(
        Method.delete,
        "/api/v1/statuses/$id",
        authenticated: true,
      );
    } on MastodonException catch (e) {
      if (e.statusCode == 404) {
        throw MastodonException(404, "mastodon_dart_error",
            "Cannot delete a status that does not exist");
      }
    }
  }

  /// POST /api/v1/statuses/:id/reblog
  ///
  /// - authenticated
  /// - write write:statuses
  Future<Status> reblog(String id) async {
    late final http.Response response;

    try {
      response = await request(
        Method.post,
        "/api/v1/statuses/$id/reblog",
        authenticated: true,
      );
    } on MastodonException catch (e) {
      if (e.statusCode == 404) {
        throw MastodonException(404, "mastodon_dart_error",
            "Cannot reblog a status that does not exist");
      }
    }

    return Status.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/statuses/:id/unreblog
  ///
  /// - authenticated
  /// - write write:statuses
  Future<Status> unreblog(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/statuses/$id/unreblog",
      authenticated: true,
    );

    return Status.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/statuses/:id/pin
  ///
  /// - authenticated
  /// - write write:statuses
  Future<Status> pinStatus(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/statuses/$id/pin",
      authenticated: true,
    );

    return Status.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/statuses/:id/unpin
  ///
  /// - authenticated
  /// - write write:statuses
  Future<Status> unpinStatus(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/statuses/$id/unpin",
      authenticated: true,
    );

    return Status.fromJson(json.decode(response.body));
  }
}
