import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/entities/auth_session.dart';
import '../../domain/failures/auth_failure.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/login_request_dto.dart';
import '../models/login_response_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remoteDatasource);

  final AuthRemoteDatasource _remoteDatasource;

  @override
  Future<Either<AuthFailure, AuthSession>> login({
    required String username,
    required String password,
  }) async {
    try {
      final request = LoginRequestDto(username: username, password: password);
      final response = await _remoteDatasource.login(request);

      final payload = response.data;
      if (payload == null) {
        final errorMessage = response.error;
        if (errorMessage != null && errorMessage.trim().isNotEmpty) {
          return Either.left(AuthFailure(errorMessage));
        }
        return Either.left(AuthFailure('Login response data is empty.'));
      }

      return Either.right(_mapLoginResponse(payload));
    } on DioException catch (error) {
      return Either.left(AuthFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(AuthFailure(error.toString()));
    }
  }

  AuthSession _mapLoginResponse(LoginResponseDto dto) {
    final user = dto.user;

    return AuthSession(
      accessToken: dto.accessToken,
      refreshToken: dto.refreshToken,
      username: user?.username,
      name: user?.name,
      roles: user?.roles ?? const <String>[],
    );
  }

  String _mapDioError(DioException error) {
    final responseData = error.response?.data;

    if (responseData is Map<String, dynamic>) {
      final message = responseData['error'];
      if (message is String && message.trim().isNotEmpty) {
        return message;
      }
    }

    if (error.message != null && error.message!.trim().isNotEmpty) {
      return error.message!;
    }

    return 'Login gagal. Silakan coba lagi.';
  }
}
