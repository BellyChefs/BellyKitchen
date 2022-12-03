import 'package:belly_kitchen/constants/theme.dart';
import 'package:belly_kitchen/providers/network_provider.dart';
import 'package:belly_kitchen/providers/onboarding_provider.dart';
import 'package:belly_kitchen/providers/settings_providers.dart';
import 'package:belly_kitchen/repository/shared_prefs.dart';
import 'package:belly_kitchen/ui/screens/about.dart';
import 'package:belly_kitchen/ui/screens/auth.dart';
import 'package:belly_kitchen/ui/screens/collection.dart';
import 'package:belly_kitchen/ui/screens/general.dart';
import 'package:belly_kitchen/ui/screens/login.dart';
import 'package:belly_kitchen/ui/screens/no_internet.dart';
import 'package:belly_kitchen/ui/screens/onboarding.dart';
import 'package:belly_kitchen/ui/screens/profile.dart';
import 'package:belly_kitchen/ui/screens/register.dart';
import 'package:belly_kitchen/ui/screens/settings.dart';
import 'package:belly_kitchen/ui/widgets/tabs/search_tab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(
          SharedPreferencesService(sharedPreferences),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  final themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingViewModel = ref.read(onboardingProvider.notifier).state;
    bool isNetworkEnabled =
        ref.watch(handleMissingNetworkProvider).isNetworkEnabled;
    final settings = ref.watch(settingsProvider);
    final themeMode = settings.maybeWhen(
        data: (data) =>
            data.themeMode == 'Light' ? ThemeMode.light : ThemeMode.dark,
        orElse: () => ThemeMode.system);
    return isNetworkEnabled
        ? MaterialApp(
            title: 'Flutter Demo',
            home: !onboardingViewModel ? Onboarding() : Home(),
            routes: <String, WidgetBuilder>{
              '/home': (context) => const Home(),
              '/settings': (context) => const Settings(),
              '/search': (context) => const SearchTab(),
              '/about': (context) => const About(),
              '/login': (context) =>  Login(),
              '/register': (context) => Register(),
              '/authchecker': (context) => const AuthChecker(),
              '/profile': (context) => const Profile(),
              '/collection': (context) => const Collection(
                    data: [],
                  )
            },
            themeMode: themeMode,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark)
        : MaterialApp(
            home: NoInternet(),
            themeMode: themeMode,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
          );
  }
}
