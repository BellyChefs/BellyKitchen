import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../fav_card.dart';

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
