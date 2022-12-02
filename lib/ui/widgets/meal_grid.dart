import 'package:flutter/material.dart';

import '../../models/meal.dart';
import 'on_tap_opacity.dart';

class MealGrid extends StatelessWidget {
  final List<Meal> mealGridList;
  const MealGrid({Key? key, required this.mealGridList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
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
                    spreadRadius: 0,
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
