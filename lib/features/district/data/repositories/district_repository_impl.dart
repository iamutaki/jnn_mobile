import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/failures/district_failure.dart';
import '../../domain/repositories/district_repository.dart';
import '../datasources/district_remote_datasource.dart';
import '../models/district_dto.dart';
import '../models/district_request.dart';

class DistrictRepositoryImpl implements DistrictRepository {
  DistrictRepositoryImpl(this._remoteDatasource);

  final DistrictRemoteDatasource _remoteDatasource;

  @override
  Future<Either<DistrictFailure, List<DistrictDto>>> getDistricts() async {
    try {
      final response = await _remoteDatasource.getDistricts();
      return Either.right(response.data ?? []);
    } on DioException catch (error) {
      return Either.left(DistrictFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(DistrictFailure(error.toString()));
    }
  }

  @override
  Future<Either<DistrictFailure, Unit>> createDistrict(
    String name,
  ) async {
    try {
      await _remoteDatasource.createDistrict(DistrictRequest(name: name));
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(DistrictFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(DistrictFailure(error.toString()));
    }
  }

  @override
  Future<Either<DistrictFailure, Unit>> updateDistrict(
    String id,
    String name,
  ) async {
    try {
      await _remoteDatasource.updateDistrict(id, DistrictRequest(name: name));
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(DistrictFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(DistrictFailure(error.toString()));
    }
  }

  @override
  Future<Either<DistrictFailure, Unit>> deleteDistrict(String id) async {
    try {
      await _remoteDatasource.deleteDistrict(id);
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(DistrictFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(DistrictFailure(error.toString()));
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
