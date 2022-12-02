import 'package:belly_kitchen/models/meal.dart';
import 'package:belly_kitchen/providers/meal_provider.dart';
import 'package:belly_kitchen/ui/widgets/meal_grid.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Collection extends HookConsumerWidget {

  const Collection({required this.data, Key? key,}) : super(key: key);
  final List<Meal> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealByCategory = ref.watch(mealByCategoryProvider);
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 64.0, bottom: 20),
                child: Text('Explore',
                    style: Theme.of(context).textTheme.headline1),
              ),
            ),
            mealByCategory.when(
              data: (data) {
                return MealGrid(
                  mealGridList: data,
                );
              },
              loading: () => const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, e) => SliverToBoxAdapter(
                child: Center(
                  child: Text(error.toString().trim()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}