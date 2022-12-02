import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/meal_provider.dart';

class SearchTab extends HookConsumerWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meals = ref.watch(mealSearchProvider);
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
              child: meals.maybeWhen(
                  data: (data) {
                    return Stack(
                      children: [
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: data.length,
                          itemBuilder: (ctx, int id) => ProviderScope(
                            // overrides: [
                            //   currentMeal.overrideWithValue(data[id]),
                            // ],
                            child: Container(color: Colors.indigo),
                          ),
                        ),
                        if (data.isEmpty) const Center(child: Text('No result'))
                      ],
                    );
                  },
                  orElse: () => const Center(
                        child: CircularProgressIndicator(),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
