import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/auth_provider.dart';
import '../widgets/input_txt.dart';

class Login extends HookConsumerWidget {
  Login({Key? key}) : super(key: key);

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authenticationProvider);
    final loading = useState(false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                          "Login",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 48),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Welcome back you're been missed.",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  InputText(
                    icon: Icons.email,
                    title: "Email address",
                    controller: _email,
                  ),
                  const SizedBox(height: 16),
                  InputText(
                    icon: Icons.password,
                    title: "Password",
                    controller: _password,
                  ),
                  const SizedBox(height: 32),
                  loading.value
                      ? Center(child: CircularProgressIndicator())
                      : Center(
                          child: Column(
                            children: [
                              OutlinedButton(
                                child: Text(
                                  "Sign in.",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                onPressed: () async {
                                  loading.value = !loading.value;
                                  await auth
                                      .signInWithEmailAndPassword(
                                          _email.text, _password.text, context)
                                      .whenComplete(
                                        () => auth.authStateChange.listen(
                                          (event) async {
                                            if (event == null) {
                                              loading.value = !loading.value;
                                              return;
                                            }
                                          },
                                        ),
                                      );
                                },
                                style: ButtonStyle(
                                  minimumSize:
                                      MaterialStateProperty.all(Size(200, 40)),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                ),
                              ),
                              OutlinedButton(
                                child: Text("Or with Google.",
                                    style:
                                        Theme.of(context).textTheme.headline3),
                                onPressed: () async {
                                  loading.value = !loading.value;
                                  await auth
                                      .signInWithGoogle(context)
                                      .whenComplete(
                                        () => auth.authStateChange.listen(
                                          (event) async {
                                            if (event == null) {
                                              loading.value = !loading.value;
                                              return;
                                            }
                                          },
                                        ),
                                      );
                                },
                                style: ButtonStyle(
                                  minimumSize:
                                      MaterialStateProperty.all(Size(200, 40)),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                  Row(children: [
                    const Spacer(),
                    Text('Not a member?',
                        style: Theme.of(context).textTheme.bodyText1),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/register'),
                      child: Text('Register now',
                          style: Theme.of(context).textTheme.headline2),
                    ),
                    const Spacer(),
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
