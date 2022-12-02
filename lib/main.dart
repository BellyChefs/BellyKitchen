import 'package:belly_kitchen/providers/settings_providers.dart';
import 'package:belly_kitchen/ui/screens/about.dart';
import 'package:belly_kitchen/ui/screens/collection.dart';
import 'package:belly_kitchen/ui/screens/general.dart';
import 'package:belly_kitchen/ui/screens/onboarding.dart';
import 'package:belly_kitchen/ui/widgets/tabs/search_tab.dart';
import 'package:belly_kitchen/ui/screens/settings.dart';
import 'package:dotenv/dotenv.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'constants/theme.dart';
import 'models/meal.dart';

var dotenv = DotEnv(includePlatformEnvironment: true)..load();
final List<Meal> favMeals = [];
Future<void> main() async {
  await Supabase.initialize(
      url: 'https://xhmjwwoukqigrerthyql.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhobWp3d291a3FpZ3JlcnRoeXFsIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njc0NzY4MDYsImV4cCI6MTk4MzA1MjgwNn0.7AG5ufCcAK1wI5Jw33KtSj_XKIlIDgMb3Ygs5SHnHWI');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  final themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    final themeMode = settings.maybeWhen(
        data: (data) =>
            data.themeMode == 'Light' ? ThemeMode.light : ThemeMode.dark,
        orElse: () => ThemeMode.system);
    return MaterialApp(
        title: 'Flutter Demo',
        home: const Onboarding(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => const Home(),
          '/settings': (BuildContext context) => const Settings(),
          '/search': (BuildContext context) => const SearchTab(),
          '/about': (BuildContext context) => const About(),
          '/collection': (BuildContext context) => const Collection(
                data: [],
              )
        },
        themeMode: themeMode,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark);
  }
}
