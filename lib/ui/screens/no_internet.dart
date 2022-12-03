import 'package:flutter/material.dart';

import '../widgets/text_card.dart';

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
