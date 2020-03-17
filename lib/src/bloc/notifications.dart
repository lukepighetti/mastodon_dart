import 'package:mastodon_dart/mastodon_dart.dart';
import 'package:rxdart/rxdart.dart' hide Notification;

typedef NotificationsGetter = Future<List<Notification>> Function(String maxId);

/// This bloc handles retrieving Notifications
class NotificationsBloc {
  final NotificationsGetter fetchNotifications;
  final Stream<dynamic> notificationsStream;

  NotificationsBloc(this.fetchNotifications, {this.notificationsStream}) {
    _requestingMore
        .where((req) => req == true)
        .throttle((_) => TimerStream(true, Duration(milliseconds: 500)))
        .listen(_handleRequest);

    notificationsStream?.listen(_handlePayload);
  }

  final Map<String, Notification> _store = {};

  final _requestingMore = BehaviorSubject<bool>.seeded(true);
  final _notifications = BehaviorSubject<List<Notification>>();

  Sink<bool> get requestingMoreSink => _requestingMore.sink;

  ValueStream<List<Notification>> get notifications => _notifications;

  /// If we're requesting more Notifications, find the oldest id in the list,
  _handleRequest(bool isRequestingMore) async {
    if (isRequestingMore) {
      final hasNotifications = _notifications?.value?.isNotEmpty ?? false;

      List<Notification> newNotifications = [];

      if (hasNotifications) {
        final oldestId = _notifications.value.last.id;

        newNotifications = await fetchNotifications(oldestId);
      } else {
        newNotifications = await fetchNotifications(null);
      }

      if (newNotifications.isNotEmpty) {
        newNotifications.forEach((n) => _store[n.id] = n);
        _updateNotifications();
      }

      _requestingMore.add(false);
    }
  }

  /// Handle stream events
  _handlePayload(dynamic payload) {
    if (payload is String) {
      _store.remove(payload);
    } else if (payload is Notification) {
      _store[payload.id] = payload;
    } else {
      return;
    }

    _updateNotifications();
  }

  /// Sort [_store.values] and emit a new event to [_notifications]
  _updateNotifications() {
    final _sortedStatuses = _store.values.toList()
      ..sort((a, b) => b.id.compareTo(a.id));

    _notifications.add(_sortedStatuses);
  }
}