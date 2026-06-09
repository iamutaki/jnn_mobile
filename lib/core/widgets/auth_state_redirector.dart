import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../network/auth_token_storage.dart';

class AuthStateRedirector extends StatefulWidget {
  const AuthStateRedirector({required this.child, super.key});

  final Widget child;

  @override
  State<AuthStateRedirector> createState() => _AuthStateRedirectorState();
}

class _AuthStateRedirectorState extends State<AuthStateRedirector> {
  final _storage = AuthTokenStorage();
  StreamSubscription<bool>? _sub;

  @override
  void initState() {
    super.initState();
    _sub = _storage.authStateChanges.listen((isAuth) {
      if (!isAuth && mounted) {
        context.go('/login');
      }
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
