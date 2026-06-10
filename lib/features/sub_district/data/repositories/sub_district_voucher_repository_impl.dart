import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/failures/sub_district_voucher_failure.dart';
import '../../domain/repositories/sub_district_voucher_repository.dart';
import '../datasources/sub_district_voucher_remote_datasource.dart';
import '../models/sub_district_voucher_request.dart';
import '../../../voucher/data/models/voucher_dto.dart';

class SubDistrictVoucherRepositoryImpl
    implements SubDistrictVoucherRepository {
  SubDistrictVoucherRepositoryImpl(this._remoteDatasource);

  final SubDistrictVoucherRemoteDatasource _remoteDatasource;

  @override
  Future<Either<SubDistrictVoucherFailure, List<VoucherDto>>>
      getSubDistrictVouchers(String subDistrictId) async {
    try {
      final response =
          await _remoteDatasource.getSubDistrictVouchers(subDistrictId);
      return Either.right(response.data ?? []);
    } on DioException catch (error) {
      return Either.left(SubDistrictVoucherFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(SubDistrictVoucherFailure(error.toString()));
    }
  }

  @override
  Future<Either<SubDistrictVoucherFailure, Unit>>
      replaceSubDistrictVouchers(
    String subDistrictId,
    List<String> voucherIds,
  ) async {
    try {
      await _remoteDatasource.replaceSubDistrictVouchers(
        subDistrictId,
        SubDistrictVoucherRequest(voucherIds: voucherIds),
      );
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(SubDistrictVoucherFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(SubDistrictVoucherFailure(error.toString()));
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
