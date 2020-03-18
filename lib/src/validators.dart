mixin Validators {
  /// Deprecated because it doesn't work. Good reason, yeah?
  ///
  /// Makes sure the authentication code is 64 characters and alphanumeric.
  @deprecated
  validateAuthCode(String code) => RegExp(r"^[a-zA-Z0-9]{64}$").hasMatch(code ?? "");
}
