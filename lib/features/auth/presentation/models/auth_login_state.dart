import '../../domain/entities/auth_session.dart';

class AuthLoginState {
  const AuthLoginState({
    this.isSubmitting = false,
    this.errorMessage,
    this.session,
  });

  final bool isSubmitting;
  final String? errorMessage;
  final AuthSession? session;

  AuthLoginState copyWith({
    bool? isSubmitting,
    String? errorMessage,
    bool clearErrorMessage = false,
    AuthSession? session,
    bool clearSession = false,
  }) {
    return AuthLoginState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
      session: clearSession ? null : session ?? this.session,
    );
  }
}
