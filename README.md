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

  mastodon.followers("anyString").then(print);
}
```
