import 'package:belly_kitchen/repository/database.dart';
import 'package:belly_kitchen/ui/widgets/home_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MealList extends ConsumerWidget {
  MealList(this.mealList, {super.key});

  final List<QueryDocumentSnapshot> mealList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    return mealList.isNotEmpty
        ? ListView.separated(
            itemCount: mealList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final dynamic meal = mealList[index].data();
              return Dismissible(
                onDismissed: (_) async {
                  await database.removeMovie(mealList[index].id).then((res) {
                    if (res) {
                    } else {}
                  });
                },
                key: Key(mealList[index].id),
                child: MealTile(meal: meal),
              );
            },
          )
        : const Center(child: Text('No Meals yet'));
  }
}
