import 'package:flutter/material.dart';

import '../widgets/menu_btn.dart';
import '../widgets/text_card.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          "About",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 48),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Information about app and developers.",
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
                  const SizedBox(height: 16),
                  const MenuButton(
                    icon: Icons.bug_report_rounded,
                    title: "Report a bug.",
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
