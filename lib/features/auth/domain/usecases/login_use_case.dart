import 'package:fpdart/fpdart.dart';

import '../entities/auth_session.dart';
import '../failures/auth_failure.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  const LoginUseCase(this._repository);

  final AuthRepository _repository;

  Future<Either<AuthFailure, AuthSession>> call(LoginParams params) {
    return _repository.login(
      username: params.username.trim(),
      password: params.password,
    );
  }
}

class LoginParams {
  const LoginParams({required this.username, required this.password});

  final String username;
  final String password;
}
