import 'package:belly_kitchen/repository/shared_prefs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, bool>((ref) {
  final sharedPreferencesService = ref.watch(sharedPreferencesProvider);
  return OnboardingNotifier(sharedPreferencesService);
});

class OnboardingNotifier extends StateNotifier<bool> {
  OnboardingNotifier(this.sharedPreferencesService)
      : super(sharedPreferencesService.isOnboardingComplete());
  final SharedPreferencesService sharedPreferencesService;

  Future<void> completeOnboarding() async {
    await sharedPreferencesService.setOnboardingComplete();
    state = true;
  }

  bool get isOnboardingComplete => state;
}
