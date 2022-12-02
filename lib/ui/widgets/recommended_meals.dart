import 'package:belly_kitchen/models/meal.dart';
import 'package:belly_kitchen/ui/screens/details.dart';
import 'package:belly_kitchen/ui/widgets/meal_card.dart';
import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

class RecommendedMealsCards extends StatelessWidget {
  const RecommendedMealsCards({
    required this.recommendedList,
    Key? key,
  }) : super(key: key);
  final List<Meal> recommendedList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TCard(
        size: Size(MediaQuery.of(context).size.width, 400),
        cards: List.generate(
          recommendedList.length,
          (index) {
            return GestureDetector(
              onTap: () => Navigator.push<dynamic>(
                context,
                MaterialPageRoute<StatefulWidget>(
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
