mixin Validators {
  /// Makes sure the authentication code is 64 characters and alphanumeric.
  validateAuthCode(String code) =>
      RegExp(r"^[a-zA-Z0-9]{64}$").hasMatch(code ?? "");
}
