import 'package:belly_kitchen/models/meal.dart';
import 'package:belly_kitchen/ui/widgets/on_tap_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

final ingredients = [
  'assets/icons/melon.svg',
  'assets/icons/lemon.svg',
  'assets/icons/apple.svg',
  'assets/icons/banana.svg',
  'assets/icons/mango.svg',
];

class MealCard extends StatelessWidget {
  const MealCard({
    required this.mealData,
    Key? key,
  }) : super(key: key);
  final Meal mealData;

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Colors.black12),
        ),
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                    text: TextSpan(
                  text: '${mealData.title}\n',
                  style: Theme.of(context).textTheme.headline6,
                  children: <TextSpan>[
                    TextSpan(
                      text: '${mealData.calories}Cal',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                )),
              ),
              const Spacer(),
              Image.network(
                mealData.image,
                width: 140,
                filterQuality: FilterQuality.high,
                height: 140,
                fit: BoxFit.fill,
              )
            ]),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: ListView.separated(
                itemCount: ingredients.length,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardTheme.surfaceTintColor,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      ingredients.elementAt(index),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 8);
                },
              ),
            ),
            const Spacer(),
            Row(
              children: [
                OnTapOpacityContainer(
                  curve: Curves.ease,
                  onTap: () async => _launchUrl(Uri.parse(mealData.video)),
                  child: Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        const Icon(
                          Icons.play_circle_outline_rounded,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'WATCH VIDEO',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Text(mealData.time),
              ],
            ),
          ],
        ));
  }
}
