import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/failures/profile_failure.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';
import '../models/profile_dto.dart';
import '../models/reseller_profile_dto.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._remoteDatasource);

  final ProfileRemoteDatasource _remoteDatasource;

  @override
  Future<Either<ProfileFailure, ProfileDto>> getProfile() async {
    try {
      final response = await _remoteDatasource.getProfile();
      final profile = response.data;

      if (profile == null) {
        return Either.left(const ProfileFailure('Data profil tidak ditemukan'));
      }

      return Either.right(profile);
    } on DioException catch (error) {
      return Either.left(ProfileFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(ProfileFailure(error.toString()));
    }
  }

  @override
  Future<Either<ProfileFailure, ResellerProfileDto>> getResellerProfile() async {
    try {
      final response = await _remoteDatasource.getResellerProfile();
      final resellerProfile = response.data;

      if (resellerProfile == null) {
        return Either.left(
          const ProfileFailure('Data profil reseller tidak ditemukan'),
        );
      }

      return Either.right(resellerProfile);
    } on DioException catch (error) {
      return Either.left(ProfileFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(ProfileFailure(error.toString()));
    }
  }

  @override
  Future<Either<ProfileFailure, Unit>> updateAvatar(String avatarUrl) async {
    try {
      await _remoteDatasource.updateAvatar({'avatar': avatarUrl});
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(ProfileFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(ProfileFailure(error.toString()));
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
