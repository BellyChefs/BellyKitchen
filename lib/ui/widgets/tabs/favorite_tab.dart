import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../repository/database.dart';
import '../meal_list.dart';

class FavTab extends ConsumerWidget {
  const FavTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children:  [
            StreamBuilder<dynamic>(
              stream: database.allFav(),
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
        ),
    );
  }
}
