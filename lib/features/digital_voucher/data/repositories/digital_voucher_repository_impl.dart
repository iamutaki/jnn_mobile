import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/models/paginated_result.dart';
import '../../domain/failures/digital_voucher_failure.dart';
import '../../domain/repositories/digital_voucher_repository.dart';
import '../datasources/digital_voucher_remote_datasource.dart';
import '../models/digital_voucher_dto.dart';
import '../models/digital_voucher_import_dto.dart';
import '../models/digital_voucher_request.dart';

class DigitalVoucherRepositoryImpl implements DigitalVoucherRepository {
  DigitalVoucherRepositoryImpl(this._remoteDatasource);

  final DigitalVoucherRemoteDatasource _remoteDatasource;

  @override
  Future<Either<DigitalVoucherFailure, Unit>> createBulk(
    DigitalVoucherBulkRequest request,
  ) async {
    try {
      await _remoteDatasource.createBulk(request);
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(DigitalVoucherFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(DigitalVoucherFailure(error.toString()));
    }
  }

  @override
  Future<Either<DigitalVoucherFailure, PaginatedResult<DigitalVoucherImportDto>>>
      getImportHistory(String? cursor) async {
    try {
      final response = await _remoteDatasource.getImportHistory(cursor);
      final items = response.data ?? [];
      final nextCursor = response.meta?['nextCursor'] as String?;
      return Either.right(PaginatedResult(items: items, nextCursor: nextCursor));
    } on DioException catch (error) {
      return Either.left(DigitalVoucherFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(DigitalVoucherFailure(error.toString()));
    }
  }

  @override
  Future<Either<DigitalVoucherFailure, DigitalVoucherDto>> getById(
    String id,
  ) async {
    try {
      final response = await _remoteDatasource.getById(id);
      final digitalVoucher = response.data;
      if (digitalVoucher == null) {
        return Either.left(
          const DigitalVoucherFailure('Voucher tidak ditemukan'),
        );
      }
      return Either.right(digitalVoucher);
    } on DioException catch (error) {
      return Either.left(DigitalVoucherFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(DigitalVoucherFailure(error.toString()));
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
