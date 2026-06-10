import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/failures/user_failure.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_datasource.dart';
import '../models/user_dto.dart';
import '../models/user_request.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._remoteDatasource);

  final UserRemoteDatasource _remoteDatasource;

  @override
  Future<Either<UserFailure, List<UserDto>>> getUsers() async {
    try {
      final response = await _remoteDatasource.getUsers();
      return Either.right(response.data ?? []);
    } on DioException catch (error) {
      return Either.left(UserFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(UserFailure(error.toString()));
    }
  }

  @override
  Future<Either<UserFailure, Unit>> createUser({
    required String name,
    required String username,
    String? password,
    String? phone,
    String? email,
    String? avatar,
    required List<String> roleIds,
  }) async {
    try {
      await _remoteDatasource.createUser(
        UserRequest(
          name: name,
          username: username,
          password: password,
          phone: phone,
          email: email,
          avatar: avatar,
          roleIds: roleIds,
        ),
      );
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(UserFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(UserFailure(error.toString()));
    }
  }

  @override
  Future<Either<UserFailure, Unit>> updateUser({
    required String id,
    required String name,
    required String username,
    String? password,
    String? phone,
    String? email,
    String? avatar,
    required List<String> roleIds,
  }) async {
    try {
      await _remoteDatasource.updateUser(
        id,
        UserRequest(
          name: name,
          username: username,
          password: password,
          phone: phone,
          email: email,
          avatar: avatar,
          roleIds: roleIds,
        ),
      );
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(UserFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(UserFailure(error.toString()));
    }
  }

  @override
  Future<Either<UserFailure, UserDto>> getUser(String id) async {
    try {
      final response = await _remoteDatasource.getUser(id);
      return Either.right(response.data!);
    } on DioException catch (error) {
      return Either.left(UserFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(UserFailure(error.toString()));
    }
  }

  @override
  Future<Either<UserFailure, Unit>> deleteUser(String id) async {
    try {
      await _remoteDatasource.deleteUser(id);
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(UserFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(UserFailure(error.toString()));
    }
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

    return 'Terjadi kesalahan. Silakan coba lagi.';
  }
}
