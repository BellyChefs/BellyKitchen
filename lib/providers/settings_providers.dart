import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod/riverpod.dart';

import '../models/settings_details.dart';
import '../models/settings_state.dart';

final storageProvider =
    Provider<FlutterSecureStorage>((ref) => const FlutterSecureStorage());

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>(
    (ref) => SettingsNotifier(ref.read));

class SettingsNotifier extends StateNotifier<SettingsState> {
  // ignore: deprecated_member_use
  final Reader read;

  late SettingsDetails details;

  SettingsNotifier(this.read) : super(const SettingsState.initial()) {
    loadData();
  }

  void loadData() async {
    state = const SettingsState.loading();
    final language =
        (await read(storageProvider).read(key: "language")) ?? "en";
    final notificationsMode =
        (await read(storageProvider).read(key: "notificationsMode")) ??
            'Disabled';
    final themeMode =
        (await read(storageProvider).read(key: "themeMode")) ?? 'Light';
    details = SettingsDetails(
      currentLanguage: language,
      notificationsMode: notificationsMode,
      themeMode: themeMode,
    );
    state = SettingsState.data(details: details);
  }

  void setLanguage(String language) async {
    state = const SettingsState.loading();
    await read(storageProvider).write(key: "language", value: language);
    details = details.copyWith(currentLanguage: language);
    state = SettingsState.data(details: details);
  }

  Future<void> setNotificationsMode(String notificationsMode) async {
    state = const SettingsState.loading();
    await read(storageProvider)
        .write(key: "notificationsEnabled", value: notificationsMode);
    details = details.copyWith(notificationsMode: notificationsMode);
    state = SettingsState.data(details: details);
  }

  void setThemeMode(String themeMode) async {
    state = const SettingsState.loading();
    await read(storageProvider).write(key: "themeMode", value: themeMode);
    details = details.copyWith(themeMode: themeMode);
    state = SettingsState.data(details: details);
  }
}
