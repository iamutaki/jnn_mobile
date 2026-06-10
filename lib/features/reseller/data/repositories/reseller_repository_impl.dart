import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/failures/reseller_failure.dart';
import '../../domain/repositories/reseller_repository.dart';
import '../datasources/reseller_remote_datasource.dart';
import '../models/reseller_dto.dart';
import '../models/reseller_request.dart';

class ResellerRepositoryImpl implements ResellerRepository {
  ResellerRepositoryImpl(this._remoteDatasource);

  final ResellerRemoteDatasource _remoteDatasource;

  @override
  Future<Either<ResellerFailure, List<ResellerDto>>> getResellers() async {
    try {
      final response = await _remoteDatasource.getResellers();
      return Either.right(response.data ?? []);
    } on DioException catch (error) {
      return Either.left(ResellerFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(ResellerFailure(error.toString()));
    }
  }

  @override
  Future<Either<ResellerFailure, Unit>> createReseller(
    String name,
    String username,
    String? password,
    String? phone,
    String? avatar,
    String? venuePhoto,
    String? subDistrictId,
    int? commissionRate,
    int? commissionAmount,
    double? lat,
    double? lng,
  ) async {
    try {
      await _remoteDatasource.createReseller(
        ResellerRequest(
          name: name,
          username: username,
          password: password,
          phone: phone,
          avatar: avatar,
          venuePhoto: venuePhoto,
          subDistrictId: subDistrictId,
          commissionRate: commissionRate,
          commissionAmount: commissionAmount,
          lat: lat,
          lng: lng,
        ),
      );
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(ResellerFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(ResellerFailure(error.toString()));
    }
  }

  @override
  Future<Either<ResellerFailure, Unit>> updateReseller(
    String id,
    String name,
    String username,
    String? password,
    String? phone,
    String? avatar,
    String? venuePhoto,
    String? subDistrictId,
    int? commissionRate,
    int? commissionAmount,
    double? lat,
    double? lng,
  ) async {
    try {
      await _remoteDatasource.updateReseller(
        id,
        ResellerRequest(
          name: name,
          username: username,
          password: password,
          phone: phone,
          avatar: avatar,
          venuePhoto: venuePhoto,
          subDistrictId: subDistrictId,
          commissionRate: commissionRate,
          commissionAmount: commissionAmount,
          lat: lat,
          lng: lng,
        ),
      );
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(ResellerFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(ResellerFailure(error.toString()));
    }
  }

  @override
  Future<Either<ResellerFailure, ResellerDto>> getReseller(String id) async {
    try {
      final response = await _remoteDatasource.getReseller(id);
      return Either.right(response.data!);
    } on DioException catch (error) {
      return Either.left(ResellerFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(ResellerFailure(error.toString()));
    }
  }

  @override
  Future<Either<ResellerFailure, Unit>> deleteReseller(String id) async {
    try {
      await _remoteDatasource.deleteReseller(id);
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(ResellerFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(ResellerFailure(error.toString()));
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
