import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

/// Opens the native contact picker and returns the selected phone number
/// in international format (e.g. `6281234567890`), or `null` if cancelled.
///
/// If the contact has multiple phone numbers, a bottom sheet is shown
/// for the user to choose.
Future<String?> showContactPhonePicker(BuildContext context) async {
  // Request contacts permission first (required on Android when using properties)
  final status = await FlutterContacts.permissions.request(PermissionType.read);
  if (status != PermissionStatus.granted && status != PermissionStatus.limited) return null;

  final contact = await FlutterContacts.native.showPicker(
    properties: {ContactProperty.phone},
  );

  if (contact == null) return null;
  if (contact.phones.isEmpty) return null;

  // Single number → pick directly
  if (contact.phones.length == 1) {
    return _normalizePhone(contact.phones.first.number);
  }

  // Multiple numbers → let user choose
  if (!context.mounted) return null;

  final selected = await showModalBottomSheet<String>(
    context: context,
    backgroundColor: Theme.of(context).colorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => _PhoneSelectorSheet(
      contactName: contact.displayName ?? '',
      phones: contact.phones,
    ),
  );

  if (selected == null) return null;
  return _normalizePhone(selected);
}

/// Normalize a phone number to international format without the leading `+`.
///
/// Handles:
/// - `+62812...` → `62812...`
/// - `0812...`    → `62812...`
/// - `62812...`   → `62812...`
/// - `812...`     → `62812...`
String _normalizePhone(String raw) {
  var number = raw.replaceAll(RegExp(r'[\s\-\(\)]'), '');

  if (number.startsWith('+')) {
    return number.substring(1);
  }

  if (number.startsWith('62')) {
    return number;
  }

  if (number.startsWith('0')) {
    return '62${number.substring(1)}';
  }

  return '62$number';
}

/// Get a human-readable label for a phone.
String? _phoneLabel(Phone phone) {
  if (phone.label.label == PhoneLabel.custom && phone.label.customLabel != null) {
    return phone.label.customLabel;
  }
  return phone.label.label.name;
}

class _PhoneSelectorSheet extends StatelessWidget {
  final String contactName;
  final List<Phone> phones;

  const _PhoneSelectorSheet({
    required this.contactName,
    required this.phones,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              children: [
                Icon(
                  FLucideIcons.user,
                  size: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const Gap(8),
                Expanded(
                  child: Text(
                    contactName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const Gap(4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pilih nomor telepon',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
            ),
          ),
          const Divider(height: 16),
          ...phones.map(
            (phone) => ListTile(
              dense: true,
              title: Text(
                phone.number,
                style: const TextStyle(fontSize: 14),
              ),
              subtitle: _phoneLabel(phone) != null
                  ? Text(
                      _phoneLabel(phone)!,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade500,
                      ),
                    )
                  : null,
              trailing: const Icon(FLucideIcons.phone, size: 16),
              onTap: () => Navigator.of(context).pop(phone.number),
            ),
          ),
          const Gap(8),
        ],
      ),
    );
  }
}
