import 'package:freezed_annotation/freezed_annotation.dart';

part 'reseller_profile_dto.freezed.dart';
part 'reseller_profile_dto.g.dart';

/// Profil reseller dari endpoint `v1/profile/reseller`.
///
/// Memberikan konteks desa (sub-district) reseller yang sedang login, dipakai
/// untuk menentukan voucher mana yang boleh dijual oleh reseller tersebut.
@freezed
abstract class ResellerProfileDto with _$ResellerProfileDto {
  const factory ResellerProfileDto({
    /// Bisa `null`/kosong bila reseller belum dipetakan ke desa mana pun.
    String? subDistrictId,
    double? lat,
    double? lon,
  }) = _ResellerProfileDto;

  factory ResellerProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ResellerProfileDtoFromJson(json);
}
