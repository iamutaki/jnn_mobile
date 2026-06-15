import 'package:flutter/material.dart';

/// Dialog picker untuk memilih bulan & tahun (tanpa tanggal).
///
/// Mengembalikan `(year, month)` via [showMonthYearPicker], atau `null` jika
/// dibatalkan. Reusable di seluruh app.
///
/// Contoh:
/// ```dart
/// final result = await showMonthYearPicker(
///   context: context,
///   initialYear: 2026,
///   initialMonth: 6,
/// );
/// if (result != null) {
///   final (year, month) = result;
/// }
/// ```
Future<(int, int)?> showMonthYearPicker({
  required BuildContext context,
  required int initialYear,
  required int initialMonth,
  int? firstYear,
  int? lastYear,
}) {
  return showDialog<(int, int)>(
    context: context,
    builder: (context) => _MonthYearPickerDialog(
      initialYear: initialYear,
      initialMonth: initialMonth,
      firstYear: firstYear,
      lastYear: lastYear,
    ),
  );
}

class _MonthYearPickerDialog extends StatefulWidget {
  const _MonthYearPickerDialog({
    required this.initialYear,
    required this.initialMonth,
    this.firstYear,
    this.lastYear,
  });

  final int initialYear;
  final int initialMonth;
  final int? firstYear;
  final int? lastYear;

  @override
  State<_MonthYearPickerDialog> createState() => _MonthYearPickerDialogState();
}

class _MonthYearPickerDialogState extends State<_MonthYearPickerDialog> {
  static const _monthLabels = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  late int _year = widget.initialYear;
  late int _month = widget.initialMonth;

  bool get _canGoPrev => widget.firstYear == null || _year > widget.firstYear!;
  bool get _canGoNext => widget.lastYear == null || _year < widget.lastYear!;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: _canGoPrev ? () => setState(() => _year--) : null,
          ),
          Text('$_year', style: theme.textTheme.titleLarge),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: _canGoNext ? () => setState(() => _year++) : null,
          ),
        ],
      ),
      content: SizedBox(
        width: 280,
        child: GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          childAspectRatio: 2.2,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          children: List.generate(12, (i) {
            final month = i + 1;
            final selected = month == _month;
            return InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => setState(() => _month = month),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected
                      ? theme.colorScheme.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: selected
                        ? theme.colorScheme.primary
                        : theme.dividerColor,
                  ),
                ),
                child: Text(
                  _monthLabels[i],
                  style: TextStyle(
                    fontSize: 13,
                    color: selected
                        ? theme.colorScheme.onPrimary
                        : theme.textTheme.bodyMedium?.color,
                    fontWeight:
                        selected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Batal'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop((_year, _month)),
          child: const Text('Pilih'),
        ),
      ],
    );
  }
}
