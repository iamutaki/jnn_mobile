import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../../shared/widgets/data_error_widget.dart';
import '../../../voucher/data/models/voucher_dto.dart';
import '../../../voucher/presentation/providers/voucher_providers.dart';
import '../providers/sub_district_voucher_providers.dart';

String _formatPrice(int price) {
  final str = price.toString();
  final buffer = StringBuffer();
  for (var i = 0; i < str.length; i++) {
    if (i > 0 && (str.length - i) % 3 == 0) buffer.write('.');
    buffer.write(str[i]);
  }
  return buffer.toString();
}

class SubDistrictVoucherPage extends ConsumerStatefulWidget {
  const SubDistrictVoucherPage({super.key, required this.subDistrictId});

  final String subDistrictId;

  @override
  ConsumerState<SubDistrictVoucherPage> createState() =>
      _SubDistrictVoucherPageState();
}

class _SubDistrictVoucherPageState
    extends ConsumerState<SubDistrictVoucherPage> {
  Set<String> _selectedIds = {};
  bool _isSaving = false;
  bool _isInitialized = false;

  @override
  Widget build(BuildContext context) {
    final vouchersAsync = ref.watch(voucherListProvider);
    final assignedAsync = ref.watch(
      subDistrictVoucherProvider(widget.subDistrictId),
    );

    if (!_isInitialized &&
        assignedAsync.hasValue &&
        assignedAsync.value!.isNotEmpty) {
      _selectedIds = assignedAsync.value!.toSet();
      _isInitialized = true;
    }

    return Scaffold(
      body: FScaffold(
        childPad: false,
        child: SafeArea(
          child: Column(
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
                      'Voucher Desa',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 24),
              Expanded(
                child: vouchersAsync.when(
                  loading: () =>
                      const Center(child: FCircularProgress.loader()),
                  error: (error, _) => DataErrorWidget(
                    onRetry: () =>
                        ref.read(voucherListProvider.notifier).refresh(),
                  ),
                  data: (vouchers) => assignedAsync.when(
                    loading: () =>
                        const Center(child: FCircularProgress.loader()),
                    error: (error, _) => DataErrorWidget(
                      onRetry: () => ref
                          .read(
                            subDistrictVoucherProvider(
                              widget.subDistrictId,
                            ).notifier,
                          )
                          .refresh(),
                    ),
                    data: (_) {
                      if (vouchers.isEmpty) return _buildEmptyState();
                      return _buildVoucherList(vouchers);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: FButton(
            onPress: _isSaving ? null : _handleSave,
            variant: FButtonVariant.primary,
            child: _isSaving
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: FCircularProgress.loader(),
                  )
                : const Text('Simpan'),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(FLucideIcons.ticket, size: 48, color: Colors.grey.shade300),
          const Gap(8),
          Text(
            'Belum ada voucher',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  Widget _buildVoucherList(List<VoucherDto> vouchers) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
      child: FTileGroupMixin.selectGroup(
        label: const Text('Pilih Voucher'),
        control: FMultiValueControl.lifted(
          value: _selectedIds,
          onChange: (value) => setState(() => _selectedIds = value),
        ),
        children: vouchers
            .map(
              (v) => FSelectTile(
                title: Text(v.name),
                subtitle: Text('Rp${_formatPrice(v.price)}'),
                value: v.id,
                suffix: Icon(FLucideIcons.ticket),
              ),
            )
            .toList(),
      ),
    );
  }

  Future<void> _handleSave() async {
    setState(() => _isSaving = true);

    try {
      await ref
          .read(subDistrictVoucherProvider(widget.subDistrictId).notifier)
          .save(_selectedIds.toList());
      if (!mounted) return;
      Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSaving = false);
      showFToast(
        context: context,
        variant: FToastVariant.destructive,
        icon: const Icon(FLucideIcons.alertCircle, size: 16),
        title: Text(e.toString().replaceFirst('Exception: ', '')),
      );
    }
  }
}
