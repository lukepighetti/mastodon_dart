import 'package:mastodon/mock/mock_mastodon.dart';

import 'mixins/accounts.dart';
import 'mixins/apps.dart';
import 'mixins/blocks.dart';
import 'mixins/search.dart';
import 'mixins/statuses.dart';
import 'mixins/timelines.dart';

class Mastodon = Authentication
    with Accounts, Apps, Blocks, Search, Statuses, Timelines;

class Authentication implements MockAuthentication {
  final Uri baseUrl;

  Authentication(this.baseUrl);

  String key;
}
