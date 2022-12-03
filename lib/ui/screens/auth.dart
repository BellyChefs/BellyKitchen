import 'package:belly_kitchen/providers/auth_provider.dart';
import 'package:belly_kitchen/ui/screens/error.dart';
import 'package:belly_kitchen/ui/screens/loading.dart';
import 'package:belly_kitchen/ui/screens/login.dart';
import 'package:belly_kitchen/ui/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authStateProvider);
    return _authState.when(
      data: (data) {
        if (data != null) return Profile();
        return Login();
      },
      loading: () => const LoadingScreen(),
      error: (e, trace) => ErrorScreen(e: e, stackTrace: trace),
    );
  }
}
