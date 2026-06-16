import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/models/paginated_result.dart';
import '../../domain/failures/reseller_voucher_sale_failure.dart';
import '../../domain/repositories/reseller_voucher_sale_repository.dart';
import '../datasources/reseller_voucher_sale_remote_datasource.dart';
import '../models/reseller_voucher_sale_detail_dto.dart';
import '../models/reseller_voucher_sale_dto.dart';
import '../models/reseller_voucher_sale_request.dart';

class ResellerVoucherSaleRepositoryImpl
    implements ResellerVoucherSaleRepository {
  ResellerVoucherSaleRepositoryImpl(this._remoteDatasource);

  final ResellerVoucherSaleRemoteDatasource _remoteDatasource;

  @override
  Future<Either<ResellerVoucherSaleFailure, String>> create(
    ResellerVoucherSaleRequest request,
  ) async {
    try {
      final idempotencyKey = _generateIdempotencyKey(request);
      final response =
          await _remoteDatasource.create(request, idempotencyKey);
      final id = response.data?.id;
      if (id == null) {
        return Either.left(
          const ResellerVoucherSaleFailure('Id sale tidak ditemukan'),
        );
      }
      return Either.right(id);
    } on DioException catch (error) {
      return Either.left(ResellerVoucherSaleFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(ResellerVoucherSaleFailure(error.toString()));
    }
  }

  String _generateIdempotencyKey(ResellerVoucherSaleRequest request) {
    final sortedItems = List<ResellerVoucherSaleItem>.from(request.items)
      ..sort((a, b) => a.voucherId.compareTo(b.voucherId));

    final buffer = StringBuffer()
      ..write(request.saleDate)
      ..write('|')
      ..write(request.saleMonth)
      ..write('|');

    for (var i = 0; i < sortedItems.length; i++) {
      if (i > 0) buffer.write(',');
      buffer.write(
        '${sortedItems[i].voucherId}:${sortedItems[i].qty}:${sortedItems[i].unitPrice}',
      );
    }

    return Uuid().v5(Namespace.oid.value, buffer.toString());
  }

  @override
  Future<Either<ResellerVoucherSaleFailure, ResellerVoucherSaleDetailDto>>
      getById(String id) async {
    try {
      final response = await _remoteDatasource.getById(id);
      final detail = response.data;
      if (detail == null) {
        return Either.left(
          const ResellerVoucherSaleFailure('Data sale tidak ditemukan'),
        );
      }
      return Either.right(detail);
    } on DioException catch (error) {
      return Either.left(ResellerVoucherSaleFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(ResellerVoucherSaleFailure(error.toString()));
    }
  }

  @override
  Future<Either<ResellerVoucherSaleFailure, Unit>> complete(String id) async {
    try {
      await _remoteDatasource.complete(id);
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(ResellerVoucherSaleFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(ResellerVoucherSaleFailure(error.toString()));
    }
  }

  @override
  Future<Either<ResellerVoucherSaleFailure, Unit>> cancel(String id) async {
    try {
      await _remoteDatasource.cancel(id);
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(ResellerVoucherSaleFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(ResellerVoucherSaleFailure(error.toString()));
    }
  }

  @override
  Future<
      Either<ResellerVoucherSaleFailure,
          PaginatedResult<ResellerVoucherSaleDto>>> getHistory(
    String? cursor,
  ) async {
    try {
      final response = await _remoteDatasource.getHistory(cursor);
      final items = response.data ?? [];
      final nextCursor = response.meta?['nextCursor'] as String?;
      return Either.right(
        PaginatedResult(items: items, nextCursor: nextCursor),
      );
    } on DioException catch (error) {
      return Either.left(ResellerVoucherSaleFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(ResellerVoucherSaleFailure(error.toString()));
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
