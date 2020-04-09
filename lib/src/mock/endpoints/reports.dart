class MockReports {
  /// POST /api/v1/reports
  /// https://docs.joinmastodon.org/api/rest/reports/#post-api-v1-reports
  Future<dynamic> report(String id, {List<String> statusIds, String comment}) =>
      Future.value(null);
}
