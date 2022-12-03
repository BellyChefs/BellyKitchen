import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final String title;

  const MenuButton(
      {required this.icon, required this.title, this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 4,
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: Theme.of(context).canvasColor,
          ),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              splashColor: Colors.transparent,
              onTap: () => onPressed?.call(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Row(
                  children: [
                    Icon(this.icon, color: Theme.of(context).primaryColorDark),
                    const SizedBox(width: 16),
                    Text(
                      this.title,
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextBlock {
  final String title;
  final List<String> body;

  TextBlock({required this.title, required this.body});
}

class TextCard extends StatelessWidget {
  final TextBlock textBlock;

  const TextCard({
    required this.textBlock,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 4,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(textBlock.title,
                      style: Theme.of(context).textTheme.headline6),
                  const SizedBox(height: 8),
                  Text(textBlock.body.join("\n"),
                      style: Theme.of(context).textTheme.bodyText1)
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                          "Oops..",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 48),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Seems there is no internet connection.",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextCard(
                    textBlock: TextBlock(
                      title: "App Version",
                      body: ["0.0.1"],
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextCard(
                    textBlock: TextBlock(
                      title: "Developers",
                      body: [
                        "Amirreza Darvishzadeh",
                        "Mauricio Salguero Gaspar",
                        "Mohamed Elbayoumi",
                        "Ahror Jabborov"
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
