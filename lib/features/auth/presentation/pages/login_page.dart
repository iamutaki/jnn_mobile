import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../flavors.dart';

/// Halaman login utama menggunakan Forui widgets.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _usernameError;
  String? _passwordError;
  bool _logoLoaded = false;

  bool _validate() {
    setState(() {
      _usernameError = _usernameController.text.trim().isEmpty
          ? 'Username wajib diisi'
          : null;
      _passwordError = _passwordController.text.trim().isEmpty
          ? 'Password wajib diisi'
          : null;
    });
    return _usernameError == null && _passwordError == null;
  }

  void _onLogin() {
    if (!_validate()) return;
    debugPrint('Login attempt: ${_usernameController.text.trim()}');
    // TODO: Implement actual authentication
    context.go('/home');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(60),

              // Logo — selebar 2 item, pakai skeletonizer saat loading
              Skeletonizer(enabled: !_logoLoaded, child: _buildLogo()),

              const Gap(48),

              // Username field
              FTextField(
                control: FTextFieldControl.managed(
                  controller: _usernameController,
                  onChange: (_) {
                    if (_usernameError != null) {
                      setState(() => _usernameError = null);
                    }
                  },
                ),
                label: const Text('Username'),
                hint: 'Masukkan username',
                error: _usernameError != null ? Text(_usernameError!) : null,
              ),

              const Gap(16),

              // Password field — icon mata: terbuka = sedang terlihat, tertutup = sedang tersembunyi
              FTextField.password(
                suffixBuilder: (context, style, obscure, variants) => Padding(
                  padding: style.obscureButtonPadding,
                  child: FButton.icon(
                    style: style.obscureButtonStyle,
                    onPress: variants.contains(FTextFieldVariant.disabled)
                        ? null
                        : () => obscure.value = !obscure.value,
                    child: obscure.value
                        ? context.theme.icons.eyeClosed(context)
                        : context.theme.icons.eye(context),
                  ),
                ),
                control: FTextFieldControl.managed(
                  controller: _passwordController,
                  onChange: (_) {
                    if (_passwordError != null) {
                      setState(() => _passwordError = null);
                    }
                  },
                ),
                label: const Text('Password'),
                hint: 'Masukkan password',
                error: _passwordError != null ? Text(_passwordError!) : null,
              ),

              const Gap(24),

              // Tombol Masuk
              FButton(onPress: _onLogin, child: const Text('Masuk')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    final logo = F.appFlavor == Flavor.staging
        ? 'assets/icons/logo.staging.png'
        : 'assets/icons/logo.png';

    return Column(
      children: [
        // Logo selebar 2 item (~dialami lebar layar)
        FractionallySizedBox(
          widthFactor: 0.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              logo,
              fit: BoxFit.contain,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (frame != null && !_logoLoaded) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) setState(() => _logoLoaded = true);
                  });
                }
                return child;
              },
              errorBuilder: (context, error, stackTrace) {
                // Fallback kalau image gagal load
                if (!_logoLoaded) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) setState(() => _logoLoaded = true);
                  });
                }
                return Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade200,
                  ),
                  child: const Icon(
                    Icons.phone_android_rounded,
                    size: 48,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
        ),
        const Gap(16),
        const Text(
          'Masuk ke akun Anda',
          style: TextStyle(fontSize: 14, color: Color(0xFF8C8C8C)),
        ),
      ],
    );
  }
}
