import 'authentication.dart';
import 'utilities.dart';

import 'endpoints/accounts.dart';
import 'endpoints/apps.dart';
import 'endpoints/blocks.dart';
import 'endpoints/custom_emojis.dart';
import 'endpoints/domain_blocks.dart';
import 'endpoints/endorsements.dart';
import 'endpoints/favourites.dart';
import 'endpoints/filters.dart';
import 'endpoints/follow_requests.dart';
import 'endpoints/follow_suggestions.dart';
import 'endpoints/instances.dart';
import 'endpoints/lists.dart';
import 'endpoints/media_attachments.dart';
import 'endpoints/mutes.dart';
import 'endpoints/notifications.dart';
import 'endpoints/reports.dart';
import 'endpoints/scheuled_statuses.dart';
import 'endpoints/search.dart';
import 'endpoints/statuses.dart';
import 'endpoints/timelines.dart';

class _Base = Authentication with Utilities;

class Mastodon = _Base
    with
        Accounts,
        Apps,
        Blocks,
        CustomEmojis,
        DomainBlocks,
        Endorsements,
        Favourites,
        Filters,
        FollowRequests,
        FollowSuggestions,
        Instances,
        Lists,
        MediaAttachments,
        Mutes,
        Notifications,
        Reports,
        ScheduledStatuses,
        Search,
        Statuses,
        Timelines;
