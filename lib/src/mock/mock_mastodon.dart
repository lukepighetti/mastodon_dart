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
import 'endpoints/scheduled_statuses.dart';
import 'endpoints/search.dart';
import 'endpoints/statuses.dart';
import 'endpoints/timelines.dart';

class MockMastodon = MockAuthentication
    with
        MockAccountsMixin,
        MockAppsMixin,
        MockBlocksMixin,
        MockCustomEmojisMixin,
        MockDomainBlocksMixin,
        MockEndorsementsMixin,
        MockFavouritesMixin,
        MockFiltersMixin,
        MockFollowRequestsMixin,
        MockFollowSuggestionsMixin,
        MockInstancesMixin,
        MockListsMixin,
        MockMediaAttachmentsMixin,
        MockMutesMixin,
        MockNotificationsMixin,
        MockReportsMixin,
        MockScheduledStatusesMixin,
        MockSearchMixin,
        MockStatusesMixin,
        MockTimelinesMixin;

class MockAuthentication {
  final Uri baseUrl;

  MockAuthentication(this.baseUrl);

  String key;
}
