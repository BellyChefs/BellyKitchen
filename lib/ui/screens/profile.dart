import 'package:belly_kitchen/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/menu_btn.dart';
import '../widgets/text_card.dart';

class Profile extends ConsumerWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(fireBaseAuthProvider);
    final _auth = ref.watch(authenticationProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () => Navigator.pop(context),
            splashRadius: 24.0),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: 800,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 128),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profile",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 48),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Information about your account.",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextCard(
                    textBlock: TextBlock(
                      title: "Credentials",
                      body: [
                        'Username: ${data.currentUser!.displayName ?? 'Anonymous'}',
                        'Email: ${data.currentUser!.email ?? 'No email provided'}',
                        'Telephone: ${data.currentUser!.phoneNumber ?? 'No phone Number provided'}',
                        'Account created: '+data.currentUser!.metadata.creationTime.toString(),
                        'Last seen: '+data.currentUser!.metadata.lastSignInTime.toString(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  MenuButton(
                    icon: Icons.logout,
                    title: "Log out.",
                    onPressed: _auth.signOut,
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
