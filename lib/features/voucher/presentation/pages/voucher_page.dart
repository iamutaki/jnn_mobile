import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../shared/widgets/data_error_widget.dart';
import '../../data/models/voucher_dto.dart';
import '../providers/voucher_providers.dart';

String _formatPrice(int price) {
  final str = price.toString();
  final buffer = StringBuffer();
  for (var i = 0; i < str.length; i++) {
    if (i > 0 && (str.length - i) % 3 == 0) buffer.write('.');
    buffer.write(str[i]);
  }
  return buffer.toString();
}

class VoucherPage extends ConsumerStatefulWidget {
  const VoucherPage({super.key});

  @override
  ConsumerState<VoucherPage> createState() => _VoucherPageState();
}

class _VoucherPageState extends ConsumerState<VoucherPage> {
  static const _skeletonItems = [
    VoucherDto(id: '1', name: 'Voucher dummy', price: 5000),
    VoucherDto(id: '2', name: 'Voucher dummy', price: 5000),
    VoucherDto(id: '3', name: 'Voucher dummy', price: 5000),
    VoucherDto(id: '4', name: 'Voucher dummy', price: 5000),
    VoucherDto(id: '5', name: 'Voucher dummy', price: 5000),
  ];

  @override
  Widget build(BuildContext context) {
    final vouchersAsync = ref.watch(voucherListProvider);

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
                      'Voucher',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 24),
              Expanded(
                child: () {
                  if (vouchersAsync.isLoading) {
                    return _buildList(_skeletonItems, isLoading: true);
                  }

                  if (vouchersAsync.hasError) {
                    return _buildError(context, vouchersAsync.error);
                  }

                  final items = vouchersAsync.asData?.value ?? [];

                  if (items.isEmpty) return _buildEmptyState();

                  return RefreshIndicator(
                    onRefresh: _onRefresh,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    color: Theme.of(context).colorScheme.primary,
                    child: _buildList(items),
                  );
                }(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: FButton(
            onPress: () => _showForm(),
            prefix: const Icon(FLucideIcons.plus, size: 18),
            variant: FButtonVariant.primary,
            child: const Text('Tambah Voucher'),
          ),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    await ref.read(voucherListProvider.notifier).refresh();
  }

  Widget _buildError(BuildContext context, Object? error) {
    return DataErrorWidget(
      error: error,
      onRetry: () => ref.read(voucherListProvider.notifier).refresh(),
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
            'Belum ada data voucher',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<VoucherDto> items, {bool isLoading = false}) {
    return Skeletonizer(
      enabled: isLoading,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 80),
        itemCount: items.length,
        separatorBuilder: (_, _) => const Divider(height: 1, indent: 16),
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: ValueKey(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              color: Colors.red.shade400,
              child: const Icon(FLucideIcons.trash2, color: Colors.white),
            ),
            confirmDismiss: (_) =>
                _confirmAndDelete(context, item.id),
            child: Material(
              type: MaterialType.transparency,
              child: ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                title: Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  item.description ?? 'Rp${_formatPrice(item.price)}',
                  style: const TextStyle(fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Icon(
                  FLucideIcons.pencil,
                  size: 16,
                  color: Colors.grey.shade400,
                ),
                onTap: isLoading ? null : () => _showForm(item: item),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<bool> _confirmAndDelete(BuildContext context, String id) async {
    final confirmed = await showFDialog<String>(
      context: context,
      builder: (context, style, animation) => FDialog(
        title: const Text('Hapus Data'),
        body: const Text('Yakin ingin menghapus voucher ini?'),
        actions: [
          FButton(
            onPress: () => Navigator.of(context).pop('cancel'),
            variant: FButtonVariant.secondary,
            child: const Text('Batal'),
          ),
          FButton(
            onPress: () => Navigator.of(context).pop('delete'),
            variant: FButtonVariant.destructive,
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (confirmed != 'delete') return false;

    try {
      await ref.read(voucherListProvider.notifier).delete(id);
      return true;
    } catch (e) {
      if (!context.mounted) return false;
      showFToast(
        context: context,
        variant: FToastVariant.destructive,
        icon: const Icon(FLucideIcons.alertCircle, size: 16),
        title: Text(
          e.toString().replaceFirst('Exception: ', ''),
        ),
      );
      return false;
    }
  }

  Future<void> _showForm({VoucherDto? item}) async {
    final notifier = ref.read(voucherListProvider.notifier);
    final success = await showFDialog<bool>(
      context: context,
      builder: (context, style, animation) => _VoucherFormDialog(
        initialName: item?.name ?? '',
        initialPrice: item == null ? '' : _formatPrice(item.price),
        initialDescription: item?.description,
        isEditing: item != null,
        onSubmit: item != null
            ? (name, price, description) =>
                  notifier.edit(item.id, name, price, description)
            : (name, price, description) =>
                  notifier.create(name, price, description),
      ),
    );

    if (success != true) return;
  }
}

class _VoucherFormDialog extends StatefulWidget {
  final String initialName;
  final String initialPrice;
  final String? initialDescription;
  final bool isEditing;
  final Future<void> Function(String name, int price, String? description)
      onSubmit;

  const _VoucherFormDialog({
    required this.initialName,
    required this.initialPrice,
    required this.initialDescription,
    required this.isEditing,
    required this.onSubmit,
  });

  @override
  State<_VoucherFormDialog> createState() => _VoucherFormDialogState();
}

class _VoucherFormDialogState extends State<_VoucherFormDialog> {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _priceCtrl;
  late final TextEditingController _descCtrl;
  bool _isSubmitting = false;
  String? _nameError;
  String? _priceError;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.initialName);
    _priceCtrl = TextEditingController(text: widget.initialPrice);
    _descCtrl = TextEditingController(text: widget.initialDescription ?? '');
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _priceCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  bool _validate() {
    final name = _nameCtrl.text.trim();
    final price = _priceCtrl.text.trim().replaceAll('.', '');
    bool valid = true;

    setState(() {
      if (name.length < 2) {
        _nameError = 'Nama voucher minimal 2 karakter';
        valid = false;
      } else {
        _nameError = null;
      }

      final parsed = int.tryParse(price);
      if (price.isEmpty || parsed == null || parsed < 0) {
        _priceError = 'Harga harus berupa angka positif';
        valid = false;
      } else {
        _priceError = null;
      }
    });

    return valid;
  }

  Future<void> _handleSubmit() async {
    if (!_validate() || _isSubmitting) return;

    setState(() => _isSubmitting = true);

    try {
      final price = int.parse(_priceCtrl.text.trim().replaceAll('.', ''));
      await widget.onSubmit(
        _nameCtrl.text.trim(),
        price,
        _descCtrl.text.trim().isEmpty ? null : _descCtrl.text.trim(),
      );
      if (!mounted) return;
      Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      showFToast(
        context: context,
        variant: FToastVariant.destructive,
        icon: const Icon(FLucideIcons.alertCircle, size: 16),
        title: Text(e.toString().replaceFirst('Exception: ', '')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FDialog(
      title: Text(widget.isEditing ? 'Edit Voucher' : 'Tambah Voucher'),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FTextField(
            control: FTextFieldControl.managed(
              controller: _nameCtrl,
              onChange: (_) {
                if (_nameError != null) {
                  setState(() => _nameError = null);
                }
              },
            ),
            label: const Text('Nama Voucher'),
            hint: 'Nama voucher',
            error: _nameError != null ? Text(_nameError!) : null,
            readOnly: _isSubmitting,
          ),
          const Gap(8),
          FTextField(
            control: FTextFieldControl.managed(
              controller: _priceCtrl,
              onChange: (_) {
                if (_priceError != null) {
                  setState(() => _priceError = null);
                }
              },
            ),
            label: const Text('Harga'),
            hint: 'Harga voucher',
            keyboardType: TextInputType.number,
            inputFormatters: [
              CurrencyTextInputFormatter.currency(
                locale: 'id',
                decimalDigits: 0,
                symbol: '',
              ),
            ],
            error: _priceError != null ? Text(_priceError!) : null,
            readOnly: _isSubmitting,
          ),
          const Gap(8),
          FTextField(
            control: FTextFieldControl.managed(controller: _descCtrl),
            label: const Text('Deskripsi (opsional)'),
            hint: 'Deskripsi voucher',
            readOnly: _isSubmitting,
          ),
        ],
      ),
      actions: [
        FButton(
          onPress: _isSubmitting ? null : _handleSubmit,
          child: _isSubmitting
              ? SizedBox(
                  width: 16,
                  height: 16,
                  child: FCircularProgress.loader(),
                )
              : Text(widget.isEditing ? 'Simpan' : 'Tambah'),
        ),
      ],
    );
  }
}
