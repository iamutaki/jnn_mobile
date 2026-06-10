import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/failures/voucher_failure.dart';
import '../../domain/repositories/voucher_repository.dart';
import '../datasources/voucher_remote_datasource.dart';
import '../models/voucher_dto.dart';
import '../models/voucher_request.dart';

class VoucherRepositoryImpl implements VoucherRepository {
  VoucherRepositoryImpl(this._remoteDatasource);

  final VoucherRemoteDatasource _remoteDatasource;

  @override
  Future<Either<VoucherFailure, List<VoucherDto>>> getVouchers() async {
    try {
      final response = await _remoteDatasource.getVouchers();
      return Either.right(response.data ?? []);
    } on DioException catch (error) {
      return Either.left(VoucherFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(VoucherFailure(error.toString()));
    }
  }

  @override
  Future<Either<VoucherFailure, Unit>> createVoucher(
    String name,
    int price,
    String? description,
  ) async {
    try {
      await _remoteDatasource.createVoucher(
        VoucherRequest(name: name, price: price, description: description),
      );
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(VoucherFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(VoucherFailure(error.toString()));
    }
  }

  @override
  Future<Either<VoucherFailure, Unit>> updateVoucher(
    String id,
    String name,
    int price,
    String? description,
  ) async {
    try {
      await _remoteDatasource.updateVoucher(
        id,
        VoucherRequest(name: name, price: price, description: description),
      );
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(VoucherFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(VoucherFailure(error.toString()));
    }
  }

  @override
  Future<Either<VoucherFailure, Unit>> deleteVoucher(String id) async {
    try {
      await _remoteDatasource.deleteVoucher(id);
      return Either.right(unit);
    } on DioException catch (error) {
      return Either.left(VoucherFailure(_mapDioError(error)));
    } catch (error) {
      return Either.left(VoucherFailure(error.toString()));
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
