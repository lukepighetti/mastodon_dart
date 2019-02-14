# mastodon-dart

A Dart API for the Mastodon network. Work in progress.

[Mastodon data types](https://docs.joinmastodon.org/api/entities/)

[Mastodon endpoints](https://docs.joinmastodon.org/api/rest/accounts/)

Please wait until this API is more developed before contributing.

## Installation

```yaml
dependencies:
  mastodon:
    git: https://github.com/lukepighetti/mastodon-dart.git
```

## Mock Client

```dart
import 'package:mastodon/mastodon.dart';

main() async {
  final mastodon = MockMastodon();

  /// Hit the endpoints with blank parameters
  mastodon.account("").then((a) => print(
      [a, a.id, a.username, a.avatar, a.followersCount, a.followingCount]));

  /// Get mock data classes for building UIs
  /// [Instance of 'Account', 78056791, onegerbal4511, https://randomuser.me/api/portraits/men/64.jpg, 861, 34]
}
```
