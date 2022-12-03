import 'package:belly_kitchen/models/meal.dart';
import 'package:belly_kitchen/providers/meal_provider.dart';
import 'package:belly_kitchen/repository/database.dart';
import 'package:belly_kitchen/ui/widgets/meal_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Collection extends ConsumerWidget {
  const Collection({
    required this.data,
    Key? key,
  }) : super(key: key);
  final List<Meal> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final mealByCategory = ref.watch(selectedCategoryProvider);
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
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 64.0, bottom: 20, right: 24.0, left: 24.0),
            child:
                Text('Explore', style: Theme.of(context).textTheme.headline1),
          ),
          StreamBuilder<dynamic>(
            stream: database.getMealsByCategory(mealByCategory),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.error != null) {
                return const Center(
                  child: Text('Some error occurred'),
                );
              }
              final List<QueryDocumentSnapshot<Object?>>? result =
                  snapshot.data.docs as List<QueryDocumentSnapshot<Object?>>?;

              return MealList(result!);
            },
          ),
        ],
      ),
    );
  }
}
