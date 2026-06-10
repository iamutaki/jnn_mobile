import 'package:fpdart/fpdart.dart';

import '../failures/user_failure.dart';
import '../../data/models/user_dto.dart';

abstract interface class UserRepository {
  Future<Either<UserFailure, List<UserDto>>> getUsers();
  Future<Either<UserFailure, Unit>> createUser({
    required String name,
    required String username,
    String? password,
    String? phone,
    String? email,
    String? avatar,
    required List<String> roleIds,
  });
  Future<Either<UserFailure, Unit>> updateUser({
    required String id,
    required String name,
    required String username,
    String? password,
    String? phone,
    String? email,
    String? avatar,
    required List<String> roleIds,
  });
  Future<Either<UserFailure, UserDto>> getUser(String id);
  Future<Either<UserFailure, Unit>> deleteUser(String id);
}
