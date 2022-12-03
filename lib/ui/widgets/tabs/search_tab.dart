import 'package:belly_kitchen/providers/meal_provider.dart';
import 'package:belly_kitchen/repository/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../meal_list.dart';

class SearchTab extends ConsumerWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 46,
                    child: CupertinoSearchTextField(
                      backgroundColor: Theme.of(context)
                          .floatingActionButtonTheme
                          .backgroundColor,
                      onChanged: (value) =>
                          {ref.read(searchTextProvider.notifier).state = value},
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.filter_alt_outlined,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  splashRadius: 22,
                  onPressed: () {},
                )
              ],
            ),
            Expanded(
              child: StreamBuilder<dynamic>(
                stream: database.allSearches(),
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
            )
          ],
        ),
      ),
    );
  }
}
