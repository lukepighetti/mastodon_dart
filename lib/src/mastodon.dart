import 'package:mastodon/mock/mock_mastodon.dart';

import 'mixins/accounts.dart';
import 'mixins/apps.dart';
import 'mixins/blocks.dart';
import 'mixins/custom_emojis.dart';
import 'mixins/domain_blocks.dart';
import 'mixins/search.dart';
import 'mixins/statuses.dart';
import 'mixins/timelines.dart';

class Mastodon = Authentication
    with
        Accounts,
        Apps,
        Blocks,
        CustomEmojis,
        DomainBlocks,
        Search,
        Statuses,
        Timelines;

class Authentication implements MockAuthentication {
  final Uri baseUrl;

  Authentication(this.baseUrl);

  String key;
}
