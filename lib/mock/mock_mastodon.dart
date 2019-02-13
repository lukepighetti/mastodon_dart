import 'mixins/accounts.dart';
import 'mixins/apps.dart';
import 'mixins/blocks.dart';
import 'mixins/custom_emojis.dart';
import 'mixins/domain_blocks.dart';
import 'mixins/endorsements.dart';
import 'mixins/favourites.dart';
import 'mixins/filters.dart';

class MockMastodon
    with
        MockAccountsMixin,
        MockAppsMixin,
        MockBlocksMixin,
        MockCustomEmojisMixin,
        MockDomainBlocksMixin,
        MockEndorsementsMixin,
        MockFavouritesMixin,
        MockFiltersMixin {}
