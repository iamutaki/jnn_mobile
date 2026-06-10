import 'package:freezed_annotation/freezed_annotation.dart';

part 'voucher_dto.freezed.dart';
part 'voucher_dto.g.dart';

int _priceFromJson(Object? json) {
  if (json is int) return json;
  if (json is double) return json.toInt();
  if (json is String) return int.tryParse(json) ?? 0;
  return 0;
}

@freezed
abstract class VoucherDto with _$VoucherDto {
  const factory VoucherDto({
    @Default('') String id,
    required String name,
    @JsonKey(fromJson: _priceFromJson) required int price,
    String? description,
  }) = _VoucherDto;

  factory VoucherDto.fromJson(Map<String, dynamic> json) =>
      _$VoucherDtoFromJson(json);
}
