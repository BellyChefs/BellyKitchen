import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:belly_kitchen/providers/auth_provider.dart';
import 'package:belly_kitchen/providers/settings_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Settings extends HookConsumerWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final userStatus = ref.watch(fireBaseAuthProvider);
    final details =
        settings.maybeWhen(data: (details) => details, orElse: () => null);
    final darkModeSwitch = useState(details?.themeMode == 'Dark');
    final authState = ref.watch(authStateProvider);
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
      body: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
          child: Text('Settings', style: Theme.of(context).textTheme.headline1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Account', style: Theme.of(context).textTheme.headline3),
              const SizedBox(
                height: 32.0,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    child: Padding(
                      padding: const EdgeInsets.all(4), // Border radius
                      child: ClipOval(
                        child: Image.network(
                          userStatus.currentUser?.photoURL ??
                              'https://media.tarkett-image.com/large/TH_24567081_24594081_24596081_24601081_24563081_24565081_24588081_001.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Center(
                    child: RichText(
                        text: TextSpan(
                      text:
                          '${userStatus.currentUser?.displayName ?? 'Please login'}\n',
                      style: Theme.of(context).textTheme.headline4,
                      children: <TextSpan>[
                        TextSpan(
                          text: userStatus.currentUser?.email == null
                              ? 'Or create account'
                              : 'Personal Info',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    )),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FloatingActionButton(
                      heroTag: 'person',
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/authchecker'),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(
                height: 32.0,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: FloatingActionButton(
                        heroTag: 'language_rounded',
                        elevation: 0,
                        backgroundColor: Colors.orange.withAlpha(30),
                        onPressed: () {},
                        child: const Icon(
                          Icons.language_rounded,
                          size: 24,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Text(
                      'Language',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const Spacer(),
                    Text(
                      //details?.currentLanguage ??
                      'English',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(width: 24),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: FloatingActionButton(
                        heroTag: 'language',
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () async {
                          final result = await showConfirmationDialog<String>(
                              title: 'Select Language',
                              context: context,
                              actions: [
                                // TODO: поправить баг в светлой теме
                                const AlertDialogAction(
                                  key: 'en',
                                  label: 'English',
                                ),
                                const AlertDialogAction(
                                  key: 'ru',
                                  label: 'Russian',
                                )
                              ]);

                          //await context.setLocale(Locale(result ?? 'en'));
                          ref
                              .read(settingsProvider.notifier)
                              .setLanguage(result ?? 'en');
                        },
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: FloatingActionButton(
                        heroTag: 'notification',
                        elevation: 0,
                        backgroundColor: Colors.blueAccent.withAlpha(30),
                        onPressed: () {},
                        child: const Icon(
                          Icons.notifications_none,
                          size: 24,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Text(
                      'Notification',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: FloatingActionButton(
                        heroTag: 'notifications',
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () {},
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: FloatingActionButton(
                        heroTag: 'dark_mode',
                        elevation: 0,
                        backgroundColor: Colors.indigo.withAlpha(30),
                        onPressed: () {},
                        child: const Icon(
                          Icons.dark_mode_outlined,
                          size: 24,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Text(
                      'Dark Mode',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const Spacer(),
                    CupertinoSwitch(
                      value: darkModeSwitch.value,
                      activeColor: Colors.indigoAccent,
                      onChanged: (value) {
                        ref
                            .read(settingsProvider.notifier)
                            .setThemeMode(value ? 'Dark' : 'Light');
                        darkModeSwitch.value = !darkModeSwitch.value;
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: FloatingActionButton(
                        heroTag: 'help',
                        elevation: 0,
                        backgroundColor: Colors.pinkAccent.withAlpha(30),
                        onPressed: () {},
                        child: const Icon(
                          Icons.help_outline,
                          size: 24,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Text(
                      'Help',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: FloatingActionButton(
                        heroTag: 'rfjjfn',
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () => Navigator.pushNamed(context, '/about'),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
