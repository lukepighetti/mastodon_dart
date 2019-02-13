import 'mixins/accounts.dart';
import 'mixins/apps.dart';
import 'mixins/blocks.dart';
import 'mixins/custom_emojis.dart';
import 'mixins/domain_blocks.dart';
import 'mixins/endorsements.dart';
import 'mixins/favourites.dart';
import 'mixins/filters.dart';
import 'mixins/follow_requests.dart';
import 'mixins/follow_suggestions.dart';
import 'mixins/instances.dart';
import 'mixins/lists.dart';
import 'mixins/media_attachments.dart';
import 'mixins/mutes.dart';

class MockMastodon
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
        MockMutesMixin {}
