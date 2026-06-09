class AuthSession {
  const AuthSession({
    this.accessToken,
    this.refreshToken,
    this.username,
    this.name,
    this.roles = const <String>[],
  });

  final String? accessToken;
  final String? refreshToken;
  final String? username;
  final String? name;
  final List<String> roles;
}
