import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../district/district_router.dart';
import '../../../reseller/reseller_router.dart';
import '../../../sub_district/sub_district_router.dart';
import '../../../voucher/voucher_router.dart';
import '../../data/models/master_data_type.dart';
import '../../master_data_router.dart';

class MasterDataPage extends StatelessWidget {
  const MasterDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      childPad: false,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: const Icon(FLucideIcons.arrowLeft, size: 24),
                  ),
                  const Gap(12),
                  Text(
                    'Master Data',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: MasterDataType.values.length,
                separatorBuilder: (_, _) =>
                    const Divider(height: 1, indent: 64),
                itemBuilder: (context, index) {
                  final type = MasterDataType.values[index];
                  return _MasterDataTile(type: type);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MasterDataTile extends StatelessWidget {
  final MasterDataType type;

  const _MasterDataTile({required this.type});

  String get _fullPath {
    return switch (type) {
      MasterDataType.district => DistrictRouter.district.path,
      MasterDataType.subDistrict => SubDistrictRouter.subDistrict.path,
      MasterDataType.voucher => VoucherRouter.voucher.path,
      MasterDataType.personel => '/master-data${MasterDataRouter.personel.path}',
      MasterDataType.reseller => ResellerRouter.reseller.path,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.push(_fullPath),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: type.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(type.icon, color: type.color, size: 20),
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type.label,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(5),
                    Text(
                      type.description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                FLucideIcons.chevronRight,
                size: 16,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
