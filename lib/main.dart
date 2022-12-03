import 'package:belly_kitchen/constants/theme.dart';
import 'package:belly_kitchen/models/meal.dart';
import 'package:belly_kitchen/providers/settings_providers.dart';
import 'package:belly_kitchen/ui/screens/about.dart';
import 'package:belly_kitchen/ui/screens/collection.dart';
import 'package:belly_kitchen/ui/screens/error.dart';
import 'package:belly_kitchen/ui/screens/general.dart';
import 'package:belly_kitchen/ui/screens/home.dart';
import 'package:belly_kitchen/ui/screens/loading.dart';
import 'package:belly_kitchen/ui/screens/login.dart';
import 'package:belly_kitchen/ui/screens/onboarding.dart';
import 'package:belly_kitchen/ui/screens/settings.dart';
import 'package:belly_kitchen/ui/widgets/tabs/search_tab.dart';
import 'package:dotenv/dotenv.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var dotenv = DotEnv(includePlatformEnvironment: true)..load();
final List<Meal> favMeals = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  final themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final themeMode = settings.maybeWhen(
        data: (data) =>
            data.themeMode == 'Light' ? ThemeMode.light : ThemeMode.dark,
        orElse: () => ThemeMode.system);
    final initialize = ref.watch(firebaseInitializerProvider);
    return MaterialApp(
        title: 'Flutter Demo',
        home:
            // initialize.when(
            //     data: (data) {
            //       return const AuthChecker();
            //     },
            //     loading: () => const LoadingScreen(),
            //     error: (e, stackTrace) => ErrorScreen(e: e, stackTrace: stackTrace)),
            initialize.when(
                data: (data) {
                  return const Onboarding();
                },
                loading: () => const LoadingScreen(),
                error: (e, stackTrace) =>
                    ErrorScreen(e: e, stackTrace: stackTrace)),
        routes: <String, WidgetBuilder>{
          '/home': (context) => const Home(),
          '/settings': (context) => const Settings(),
          '/search': (context) => const SearchTab(),
          '/about': (context) => const About(),
          '/login': (context) => const LoginPage(),
          '/profile': (context) => const Profile(),
          '/collection': (context) => const Collection(
                data: [],
              )
        },
        themeMode: themeMode,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark);
  }
}
