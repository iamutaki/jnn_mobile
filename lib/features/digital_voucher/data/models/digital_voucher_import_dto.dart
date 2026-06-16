import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../voucher/data/models/voucher_dto.dart';
import '../../../sub_district/data/models/sub_district_dto.dart';

part 'digital_voucher_import_dto.freezed.dart';
part 'digital_voucher_import_dto.g.dart';

@freezed
abstract class DigitalVoucherImportDto with _$DigitalVoucherImportDto {
  const factory DigitalVoucherImportDto({
    required String id,
    required VoucherDto voucher,
    SubDistrictDto? subDistrict,
    required int totalCodes,
    String? notes,
    required DateTime createdAt,
    required String createdByUserId,
  }) = _DigitalVoucherImportDto;

  factory DigitalVoucherImportDto.fromJson(Map<String, dynamic> json) =>
      _$DigitalVoucherImportDtoFromJson(json);
}
