import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/onboarding_provider.dart';

class Onboarding extends ConsumerWidget {
  const Onboarding({Key? key}) : super(key: key);

  Future<void> onGetStarted(BuildContext context, WidgetRef ref) async {
    final onboardingViewModel = ref.read(onboardingProvider.notifier);
    await onboardingViewModel.completeOnboarding();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 255, 89, 47),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Spacer(),
                Text.rich(
                  TextSpan(// default text style
                      children: <TextSpan>[
                    TextSpan(
                        text: 'Meet new people\n',
                        style: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: 'to cook together',
                      style: GoogleFonts.dmSans(
                          color: Colors.amberAccent,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                    bottom: 40.0,
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.black,
                      ),
                    ),
                    child: const Text(
                      'Get started',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                    onPressed: () {
                      onGetStarted(context, ref);
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ),
              ]),
              Center(
                child: Image.asset('assets/icon.jpeg',
                    height: 300, fit: BoxFit.fitHeight),
              ),
            ],
          ),
        ),
      );
}
