import 'package:belly_kitchen/main.dart';
import 'package:belly_kitchen/ui/widgets/fav_card.dart';
import 'package:flutter/material.dart';

class FavTab extends StatelessWidget {
  const FavTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (favMeals.isEmpty)
                const Center(child: Text('Nothing to show')),
              ...favMeals.map((e) => FavCard(meal: e)),
            ],
          ),
        ),
      ),
    );
  }
}
