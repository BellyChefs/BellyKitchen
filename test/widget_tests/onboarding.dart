import 'package:belly_kitchen/ui/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Onboarding Screen meets requirements.', () {
    setUp(() async {});

    testWidgets('Onboarding Screen proceeded well.', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: const Onboarding(),
          ),
        ),
      );
      final btnFinder = find.text('Get started');
      final txtFinder = find.text('Meet new people\nto cook together');

      expect(btnFinder, findsOneWidget);
      expect(txtFinder, findsOneWidget);
    });

    testWidgets('Onboarding Screen has btn to go further.', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: const Onboarding(),
          ),
        ),
      );
      await tester.tap(find.text('Get started'));
      await tester.pump();
      final btnFinder = find.text('Get started');
      expect(btnFinder, findsOneWidget);
    });
  });
}
