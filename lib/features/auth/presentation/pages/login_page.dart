import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../flavors.dart';
import '../providers/auth_login_providers.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = useMemoized(() => FormGroup({
      'username': FormControl<String>(validators: [Validators.required]),
      'password': FormControl<String>(validators: [Validators.required]),
    }));
    final formRebuild = useState(0);
    final logoLoaded = useState(false);

    useEffect(() {
      ref.listen(authLoginProvider, (previous, next) {
        if (next.session != null) context.go('/home');
        if (next.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(next.errorMessage!)),
          );
        }
      });
      return null;
    }, []);

    Future<void> onLogin() async {
      form.markAllAsTouched();
      formRebuild.value++;
      if (!form.valid) return;

      await ref.read(authLoginProvider.notifier).submit(
        username: form.control('username').value as String? ?? '',
        password: form.control('password').value as String? ?? '',
      );
    }

    final loginState = ref.watch(authLoginProvider);
    final isLoading = loginState.isSubmitting;
    formRebuild.value; // trigger rebuild setelah markAllAsTouched
    final usernameControl = form.control('username');
    final passwordControl = form.control('password');
    final usernameError = _controlErrorText(
      usernameControl,
      'Username wajib diisi',
    );
    final passwordError = _controlErrorText(
      passwordControl,
      'Password wajib diisi',
    );

    return FScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(60),
              Skeletonizer(
                enabled: !logoLoaded.value,
                child: _buildLogo(logoLoaded),
              ),
              const Gap(48),
              FTextField(
                control: FTextFieldControl.managed(
                  onChange: (value) => usernameControl.value = value.text,
                ),
                label: const Text('Username'),
                hint: 'Masukkan username',
                error: usernameError != null ? Text(usernameError) : null,
              ),
              const Gap(16),
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
                  onChange: (value) => passwordControl.value = value.text,
                ),
                label: const Text('Password'),
                hint: 'Masukkan password',
                error: passwordError != null ? Text(passwordError) : null,
              ),
              const Gap(24),
              if (loginState.errorMessage != null) ...[
                Text(
                  loginState.errorMessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFFB42318),
                  ),
                ),
                const Gap(16),
              ],
              FButton(
                onPress: isLoading ? null : onLogin,
                child: isLoading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Masuk'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildLogo(ValueNotifier<bool> logoLoaded) {
    final logo = F.appFlavor == Flavor.staging
        ? 'assets/icons/logo.staging.png'
        : 'assets/icons/logo.png';

    return Column(
      children: [
        FractionallySizedBox(
          widthFactor: 0.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              logo,
              fit: BoxFit.contain,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (frame != null && !logoLoaded.value) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (context.mounted) logoLoaded.value = true;
                  });
                }
                return child;
              },
              errorBuilder: (context, error, stackTrace) {
                if (!logoLoaded.value) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (context.mounted) logoLoaded.value = true;
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

  static String? _controlErrorText(
    AbstractControl<dynamic> control,
    String requiredText,
  ) {
    if (!control.invalid || !control.touched) return null;
    if (control.hasError(ValidationMessage.required)) return requiredText;
    return 'Input tidak valid';
  }
}
