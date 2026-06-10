import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/failures/sub_district_failure.dart';
import '../../domain/repositories/sub_district_repository.dart';
import '../datasources/sub_district_remote_datasource.dart';
import '../models/sub_district_dto.dart';
import '../models/sub_district_request.dart';

class SubDistrictRepositoryImpl implements SubDistrictRepository {
  SubDistrictRepositoryImpl(this._remoteDatasource);

  final SubDistrictRemoteDatasource _remoteDatasource;

  @override
  Future<Either<SubDistrictFailure, List<SubDistrictDto>>>
      getSubDistricts() async {
    try {
      final response = await _remoteDatasource.getSubDistricts();
      return Either.right(response.data ?? []);
    } on DioException catch (error) {
      return Either.left(SubDistrictFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(SubDistrictFailure(error.toString()));
    }
  }

  @override
  Future<Either<SubDistrictFailure, Unit>> createSubDistrict(
    String districtId,
    String name,
  ) async {
    try {
      await _remoteDatasource.createSubDistrict(
        SubDistrictRequest(districtId: districtId, name: name),
      );
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(SubDistrictFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(SubDistrictFailure(error.toString()));
    }
  }

  @override
  Future<Either<SubDistrictFailure, Unit>> updateSubDistrict(
    String id,
    String districtId,
    String name,
  ) async {
    try {
      await _remoteDatasource.updateSubDistrict(
        id,
        SubDistrictRequest(districtId: districtId, name: name),
      );
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(SubDistrictFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(SubDistrictFailure(error.toString()));
    }
  }

  @override
  Future<Either<SubDistrictFailure, Unit>> deleteSubDistrict(
    String id,
  ) async {
    try {
      await _remoteDatasource.deleteSubDistrict(id);
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(SubDistrictFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(SubDistrictFailure(error.toString()));
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
