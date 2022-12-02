import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

import '../../models/meal.dart';
import '../screens/details.dart';
import 'meal_card.dart';
import 'on_tap_opacity.dart';

class RecommendedMealsCards extends StatelessWidget {
  final List<Meal> recommendedList;

  const RecommendedMealsCards({Key? key, required this.recommendedList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TCard(
        size: Size(MediaQuery.of(context).size.width, 400),
        cards: List.generate(
          recommendedList.length,
          (int index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Details(data: recommendedList[index])),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardTheme.color,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 17),
                      blurRadius: 23.0,
                      spreadRadius: -13.0,
                      color: Theme.of(context).cardTheme.shadowColor!,
                    )
                  ],
                ),
                child: MealCard(
                  mealData: recommendedList[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
