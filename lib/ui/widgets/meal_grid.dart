import 'package:belly_kitchen/models/meal.dart';
import 'package:belly_kitchen/ui/widgets/on_tap_opacity.dart';
import 'package:flutter/material.dart';

class MealGrid extends StatelessWidget {
  const MealGrid({
    required this.mealGridList,
    Key? key,
  }) : super(key: key);
  final List<Meal> mealGridList;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return OnTapOpacityContainer(
            onTap: () {},
            curve: Curves.ease,
            child: Container(
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.1),
                    blurRadius: 4,
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.network(
                        mealGridList[index].image,
                        width: 96,
                        height: 96,
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        mealGridList[index].title,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      const Spacer(),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${mealGridList[index].calories}Cal - ${mealGridList[index].time}mins',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        childCount: mealGridList.length,
      ),
    );
  }
}
