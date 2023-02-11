import 'dart:io';

import 'package:mastodon_dart/mastodon_dart.dart';
import 'package:mastodon_dart/src/exception.dart';

/// This example shows how to use the Mastodon Dart library.
///
/// Run from a terminal with:
/// BEARER_TOKEN="TOKEN" WEBSITE="https://example.social" dart run example/main.dart

main() async {
  Map<String, String> env = Platform.environment;
  final String? bearerToken = env['BEARER_TOKEN'];
  final Uri? website = Uri.tryParse(env['WEBSITE'] ?? '');

  if (bearerToken == null || bearerToken.isEmpty) {
    print('BEARER_TOKEN environment variable not set.');
    exit(1);
  }
  if (website == null) {
    print('WEBSITE environment variable not set.');
    exit(1);
  }

  final client = Mastodon(website);
  client.token = bearerToken;

  try {
    final response = await client.verifyCredentials();
    final currentAccount = response.result.model;
    if (currentAccount == null) {
      print('Error parsing account: ${response.result.error}');
      exit(1);
    }
    print('Hello ${currentAccount.username}!');
    print('\n');
  } on MastodonException catch (e) {
    print(e.message);
    exit(1);
  }

  final response = await client.timeline(limit: 5);
  for (final result in response.results) {
    final status = result.model;
    if (status == null) {
      print('Error parsing status: ${result.error!.exception}');
      continue;
    }
    print('@${status.account.acct}: ${_stripHtml(status.content)}');
  }
}

/// This is just to create a cleaner output.
/// Don't actually parse HTML with regex.
_stripHtml(String html) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  return html.replaceAll(exp, '');
}
