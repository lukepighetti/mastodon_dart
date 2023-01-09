## 1.0.9 (1/9/2023)

- Fix: Make website optional for appCredentials

## 1.0.8 (1/6/2023)

- Fix: Remove follow scope as it is now included in write

## 1.0.7 (1/5/2023)

- Feat: add toJson methods
- Fix: Handle malformed Card#authorUrl parsing

## 1.0.6 (1/3/2023)

- Feat: update Account fields
- Feat: update NotificationType values

## 1.0.5 (12/23/2022)

- Feat: add Poll option type

## 1.0.4 (12/12/2022)

- Feat: add file attachment support

## 1.0.3 (12/11/2022)

- Feat: `Mastodon.websocketFactory` is now optional 
- Fix: move `Application.vapidKey` to `AuthenticatedApplication`

## 1.0.2 (12/9/2022)

- Fix: make `Status.text` nullable

## 1.0.1 (11/14/2022)

- Null safety
- remove mocks
- update deps
- remove dead example
- remove business logic classes

## 0.3.2 (4/9/2020)
- Fix [issue #30](https://github.com/lukepighetti/mastodon_dart/issues/30)

## 0.3.0 (4/9/2020)
- Add most missing data entities
- Add most missing api endpoints
- Update many data entities with properties that were added in recent versions of Mastodon
- Move mock library into `/src`
- Major documentation upgrades
- Update Dart SDK constraints
- `0.3.0+1` address pub health

## 0.2.2 (4/6/2020)
- Improve `AuthBloc`:
  - Do not await AuthStorage twice in constructor
  - Add `logOut` function
  - Better docs

## 0.2.1 (4/4/2020)
- Added bookmarks endpoint with corresponding MockBookmarks class
- Renamed `bookmarkStatus` to `bookmark`, `unbookmarkStatus` to `unbookmark` to closer match the Mastodon docs.
- Moved `bookmark` and `unbookmark` methods to bookmarks endpoint

## 0.2.0 (4/2/2020)
- Major refactor for `AuthBloc`
  - Introduce `NullInterceptorSink<T>` class to ensure that data being added to a sink cannot be null. Update `codeSink` to use the `NullInterceptorSink`.
  - Make sure we do not call `_handleCode` until we have an authenticated application
  - Introduce `_initialized` Completer, `initialized` Future, and `hasAccount` bool check
  - Update `_registerApplication` with a null check/error throw
  - Update `_handleCode` to take an `AuthenticatedApplication` as well as a code
  - Better error handling
  - Updated documentation
- Removed deprecated example code. Updated code coming soon.

## 0.1.5 (3/19/2020)
- Add missing `text` property to `Status`

## 0.1.4 - 0.1.4+3 (3/18/2020)
- Add missing `bookmarked` property to `Status`
- Address pub health suggestions

## 0.1.3 (3/17/2020)
- Add missing attachment type to `AttachmentType` enum

## 0.1.2 (3/17/2020)
- Add missing parameter to the `Notifications` endpoint
- 0.2.1+1: Null coalesce Notification `exclude_types`

## 0.1.1+1 (3/16/2020)
- Add new `NotificationsBloc` to handle retrieving Notifications

## 0.1.0+9 (3/15/2020)
- Deprecate flakey auth code validator

## 0.1.0+7 (3/15/2020)
- Update dependencies
- Update rxdart code for latest version
- Add formal example project
