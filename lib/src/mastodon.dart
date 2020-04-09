import 'authentication.dart';
import 'utilities.dart';
import 'validators.dart';
import 'endpoints/accounts.dart';
import 'endpoints/apps.dart';
import 'endpoints/blocks.dart';
import 'endpoints/bookmarks.dart';
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
import 'endpoints/polls.dart';
import 'endpoints/preferences.dart';
import 'endpoints/push.dart';
import 'endpoints/reports.dart';
import 'endpoints/scheuled_statuses.dart';
import 'endpoints/search.dart';
import 'endpoints/statuses.dart';
import 'endpoints/timelines.dart';
import 'websockets/websockets.dart';

class _Base = Authentication with Utilities, Validators;

class _Rest = _Base
    with
        Accounts,
        Apps,
        Blocks,
        Bookmarks,
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
        Polls,
        Preferences,
        Push,
        Reports,
        ScheduledStatuses,
        Search,
        Statuses,
        Timelines;

/// A Mastodon object that provides access to Mastodon endpoints
class Mastodon = _Rest with Websockets;
