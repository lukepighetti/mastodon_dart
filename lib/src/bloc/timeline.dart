import 'package:mastodon_dart/mastodon_dart.dart';
import 'package:rxdart/rxdart.dart';

typedef StatusGetter = Future<List<Status>> Function(String maxId);

class TimelineBloc {
  final StatusGetter fetchStatuses;
  final Stream<dynamic> statusStream;

  TimelineBloc(this.fetchStatuses, {this.statusStream}) {
    _requestingMore
        .where((req) => req == true)
        .throttle((_) => TimerStream(true, Duration(milliseconds: 500)))
        .listen(_handleRequest);

    statusStream?.listen(_handlePayload);
  }

  final Map<String, Status> _store = {};

  final _requestingMore = BehaviorSubject<bool>.seeded(true);
  final _statuses = BehaviorSubject<List<Status>>();

  Sink<bool> get requestingMoreSink => _requestingMore.sink;

  ValueStream<List<Status>> get statuses => _statuses;

  /// If we're requesting more, find the oldest id in the list,
  _handleRequest(bool isRequestingMore) async {
    if (isRequestingMore) {
      final hasStatuses = _statuses?.value?.isNotEmpty ?? false;

      List<Status> newStatuses = [];

      if (hasStatuses) {
        final oldestId = _statuses.value.last.id;

        newStatuses = await fetchStatuses(oldestId);
      } else {
        newStatuses = await fetchStatuses(null);
      }

      if (newStatuses.isNotEmpty) {
        newStatuses.forEach((s) => _store[s.id] = s);
        _updateStatuses();
      }

      _requestingMore.add(false);
    }
  }

  /// Handle stream events
  _handlePayload(dynamic payload) {
    if (payload is String) {
      _store.remove(payload);
    } else if (payload is Status) {
      _store[payload.id] = payload;
    } else {
      return;
    }

    _updateStatuses();
  }

  /// Sort [_store.values] and emit a new event to [_statuses]
  _updateStatuses() {
    final _sortedStatuses = _store.values.toList()
      ..sort((a, b) => b.id.compareTo(a.id));

    _statuses.add(_sortedStatuses);
  }
}
