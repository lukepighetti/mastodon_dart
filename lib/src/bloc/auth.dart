import 'dart:async';
import 'dart:convert';

import 'package:mastodon/src/data/application.dart';
import 'package:mastodon/src/mastodon.dart';
import 'package:rxdart/rxdart.dart';

import 'package:http/http.dart' show post;

class AuthBloc {
  final Mastodon mastodon;

  final Uri website;
  final String redirectUris;
  final String clientName;
  final List<String> scopes;

  ///
  /// Authentication steps:
  ///
  /// 1. Listen to [AuthBloc.uri], navigate user to external browser on event.
  /// 2. The user will interact with the page to authenticate.
  ///   Default settings will have them copy-paste a code into your app.
  /// 3. Add the code to [AuthBloc.codeSink.add]
  /// 4. Listen to [AuthBloc.token], navigate the user to the homepage on event.
  ///
  /// Notes: Provide a [Mastodon] instance with a previous token to short-circuit the process.
  AuthBloc(
    this.mastodon,
    this.website, {
    this.redirectUris = "urn:ietf:wg:oauth:2.0:oob",
    this.clientName = "mastodon-dart",
    this.scopes = const ["write", "read", "follow", "push"],
  }) {
    final previousToken = mastodon.key;

    if (previousToken == null) {
      _app.map(_mapAppToUri).listen(_uri.add);

      _code
          .asyncMap(_mapCodeToToken)
          .doOnData((token) => mastodon.key = token)
          .listen(_token.add);

      _registerApp();
    } else {
      _token.add(previousToken);
    }
  }

  final _app = BehaviorSubject<AuthenticatedApplication>();
  final _code = BehaviorSubject<String>();
  final _token = BehaviorSubject<String>();
  final _uri = BehaviorSubject<Uri>();

  Sink<String> get codeSink => _code.sink;

  ValueObservable<Uri> get uri => _uri.stream;
  ValueObservable<String> get token => _token.stream;

  /// Register the application and add it to [_app]
  Future _registerApp() async {
    final application = await mastodon.appCredentials(
        website, redirectUris, clientName, scopes);

    _app.add(application);
  }

  /// Generate the Uri needed to authenticate the app. This
  /// uri will be navigated to for the user, preferably in an
  /// external browser to improve security.
  Uri _mapAppToUri(AuthenticatedApplication app) {
    assert(app?.clientId != null && app?.clientSecret != null);

    return mastodon.authorizationUrl.replace(
      queryParameters: {
        "response_type": "code",
        "client_id": app.clientId,
        "client_secret": app.clientSecret,
        "redirect_uri": redirectUris,
        "scope": scopes.join(" "),
      },
    );
  }

  /// Authenticate the [authCode] which should be provided
  /// by the oauth flow, such as a user copy-pasting the
  /// code from the browser.
  Future<String> _mapCodeToToken(String authCode) async {
    assert(_app?.value?.clientId != null);

    final response = await post(
      mastodon.tokenUrl,
      body: {
        "client_id": _app.value.clientId,
        "client_secret": _app.value.clientSecret,
        "grant_type": "authorization_code",
        "code": authCode,
        "redirect_uri": redirectUris,
      },
    );

    final results = Map.from(jsonDecode(response.body));

    final token = results["access_token"] as String;

    return token;
  }
}
