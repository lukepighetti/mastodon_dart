import 'dart:async';
import 'dart:convert';
import 'package:mastodon_dart/src/data/account.dart';
import 'package:mastodon_dart/src/data/application.dart';
import 'package:mastodon_dart/src/mastodon.dart';
import 'package:async/async.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' show post;

/// This class ensures that data being added to a sink cannot be null
class NullInterceptorSink<T> extends DelegatingStreamSink<T> {
  NullInterceptorSink(StreamSink<T> sink) : super(sink);
  @override
  void add(T data) {
    if (data == null) {
      throw ArgumentError.notNull('data');
    }
    super.add(data);
  }
}

/// AuthBloc handles the authentication process for a [Mastodon] application. In order for a user
/// to be able to log into the application, the application must first be authenticated. Once the application
/// is authenticated, the user can navigate to the browser via the [_uri]. When the user returns to the application with
/// their auth code, user authentication will be performed with that code.
class AuthBloc {
  /// Handles the storing, retrieving, and deleting of the auth code
  final AuthStorageDelegate storage;
  /// A Mastodon instance
  final Mastodon mastodon;
  /// The Uri used to navigate the user to the browser for authentication
  final Uri website;
  /// Can be user-provided, defaults to "urn:ietf:wg:oauth:2.0:oob"
  final String redirectUris;
  /// The name of the application using the Mastodon API
  final String clientName;
  /// Mastodon API scopes; can be user defined, defaults to "write", "read", "follow", "push"
  final List<String> scopes;

  AuthBloc(
    this.mastodon,
    this.website, {
    this.storage,
    this.redirectUris = "urn:ietf:wg:oauth:2.0:oob",
    this.clientName = "mastodon_dart",
    this.scopes = const ["write", "read", "follow", "push"],
  }) {
    /// When the bloc is instantiated it will check for a stored auth token.
    /// If there is no token, we register the application. If there is a token
    /// it gets added to [_token]
    storage.fetchToken.then((String token) async {
      final savedToken = mastodon.token ?? token;

      _app.listen(_handleApplication);
      CombineLatestStream.combine2(_code, _app, _handleCode).listen((_) {});
      _token.listen(_handleToken);

      if (savedToken == null) {
        await _registerApplication();
      } else {
        _token.add(savedToken);
        await _account.first;
      }
      _initalized.complete();
    }).catchError((error, stackTrace) {
      print('Error getting authorization token: $error');
      _initalized.completeError(error, stackTrace);
    });
  }

  final _initalized = Completer();
  final _account = BehaviorSubject<Account>();
  final _app = BehaviorSubject<AuthenticatedApplication>();
  final _code = BehaviorSubject<String>();
  final _uri = BehaviorSubject<Uri>();
  final _token = BehaviorSubject<String>();

  Sink<String> get codeSink => NullInterceptorSink(_code.sink);

  ValueStream<Account> get account => _account.stream;
  ValueStream<Uri> get uri => _uri.stream;
  ValueStream<String> get token => _token.stream;
  bool get hasAccount => _account.value != null;
  Future get initalized => _initalized.future;

  /// Register the application and add it to [_app]
  Future<void> _registerApplication() async {
    final application = await mastodon.appCredentials(
        website, redirectUris, clientName, scopes);
    if (application == null) {
      throw ArgumentError.notNull('application');
    }
    _app.add(application);
  }

  /// Generate the Uri needed to authenticate the app. This
  /// uri will be navigated to for the user, preferably in an
  /// external browser to improve security.
  void _handleApplication(AuthenticatedApplication app) {
    assert(app?.clientId != null && app?.clientSecret != null);

    final uri = mastodon.authorizationUrl.replace(
      queryParameters: {
        "response_type": "code",
        "client_id": app.clientId,
        "client_secret": app.clientSecret,
        "redirect_uri": redirectUris,
        "scope": scopes.join(" "),
      },
    );

    _uri.add(uri);
  }

  /// Authenticate the auth code which should be provided
  /// by the oauth flow, such as a user copy-pasting the
  /// code from the browser.
  ///
  /// If the code validates, it will automatically trigger the
  /// authentication process. It does not wait for confirmation.
  void _handleCode(String code, AuthenticatedApplication app) {
    if (code == null || app == null) {
      return;
    }
    post(
      mastodon.tokenUrl,
      body: {
        "client_id": app.clientId,
        "client_secret": app.clientSecret,
        "grant_type": "authorization_code",
        "code": code,
        "redirect_uri": redirectUris,
        "scope": scopes.join(" "),
      },
    ).then((authResponse) {
      print(authResponse.body);
      final results = Token.fromJson(jsonDecode(authResponse?.body));

      final token = results.accessToken;

      _token.add(token);
    }).catchError(
        (error, trace) => print('Error validating authCode: $error\n$trace'));
  }

  /// Saves, sets, and verifies a token.
  /// Then adds the [Account] to [_account.add]
  Future<void> _handleToken(String token) async {
    if (token != null) {
      if (token != await storage.fetchToken) {
        await storage.saveToken(token);
      }

      mastodon.token = token;

      final account = await mastodon.verifyCredentials();

      _account.add(account);
    }
  }

  /// Handles logging the user out. Deletes the stored auth token, wipes the values
  /// from the code, token, and account streams
  Future<void> logOut() async {
    storage.deleteToken();
    _code.value = null;
    _token.value = null;
    _account.value = null;
  }

  dispose() {
    _account.close();
    _app.close();
    _code.close();
    _uri.close();
    _token.close();
  }

  @override
  String toString() {
    return 'AuthBloc{${hashCode.toRadixString(16)}}';
  }
}

/// A simple storage driver interface that allows
/// fetching, saving, and deleting of a [token] as a String
abstract class AuthStorageDelegate {
  Future<void> saveToken(String token);
  Future<void> deleteToken();
  Future<String> get fetchToken;
}
