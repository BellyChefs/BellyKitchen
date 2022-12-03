import 'package:flutter/material.dart';

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
