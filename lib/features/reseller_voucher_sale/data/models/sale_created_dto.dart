import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_created_dto.freezed.dart';
part 'sale_created_dto.g.dart';

/// Response `POST /v1/reseller-voucher-sale` (201): hanya membawa id sale baru.
/// Field lain (saleNo, status, dll) di-generate backend & diambil via GET detail.
@freezed
abstract class SaleCreatedDto with _$SaleCreatedDto {
  const factory SaleCreatedDto({required String id}) = _SaleCreatedDto;

  factory SaleCreatedDto.fromJson(Map<String, dynamic> json) =>
      _$SaleCreatedDtoFromJson(json);
}
