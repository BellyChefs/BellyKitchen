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
          color: const Color.fromARGB(230, 255, 72, 15),
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
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Image.asset('assets/icon.jpeg',
                    height: 400, fit: BoxFit.fitHeight),
              ),
            ],
          ),
        ),
      );
}
