import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/meal_provider.dart';
import '../animated_horizontal_list.dart';
import '../on_tap_opacity.dart';
import '../recommended_meals.dart';

final categories = {
  {'assets/icons/beer.svg', 'Beer'},
  {'assets/icons/bread.svg', 'Bread'},
  {'assets/icons/broccoli.svg', 'Vegs'},
  {'assets/icons/cake.svg', 'Cakes'},
  {'assets/icons/croissant.svg', 'Bakery'},
  {'assets/icons/hamburger.svg', 'Junk'},
  {'assets/icons/meat.svg', 'Meat'},
  {'assets/icons/popcorn.svg', 'Popcorn'},
  {'assets/icons/ramen.svg', 'Noodle'},
  {'assets/icons/salad.svg', 'Salad'},
  {'assets/icons/soup.svg', 'Soup'},
};

Category parseCategory(int index) {
  switch (index) {
    case 0:
      return Category.Category0;
    case 0:
      return Category.Category0;
    case 0:
      return Category.Category0;
    case 0:
      return Category.Category0;
    case 0:
      return Category.Category0;
    case 0:
      return Category.Category0;
    case 0:
      return Category.Category0;
    case 0:
      return Category.Category0;
    case 0:
      return Category.Category0;
    case 0:
      return Category.Category0;
    default:
      return Category.Category0;
  }
}

class HomeTab extends HookConsumerWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendedMeals = ref.watch(recommendedProvider);
    return ListView(
      children: <Widget>[
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                'Top Categories',
                style: Theme.of(context).textTheme.headline1,
              ),
              const Spacer(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 120,
            child: ListView.builder(
              cacheExtent: 0,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return AnimatedScrollViewItem(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: OnTapOpacityContainer(
                      curve: Curves.decelerate,
                      onTap: () {
                        ref.read(selectedCategoryProvider.notifier).state =
                            parseCategory(index);
                        Navigator.pushNamed(context, '/collection');
                      },
                      child: SizedBox(
                        width: 100.0,
                        height: 120.0,
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(color: Colors.black26),
                            ),
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  categories.elementAt(index).first,
                                ),
                                const Spacer(),
                                Text(
                                  categories.elementAt(index).last,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                'Recommended',
                style: Theme.of(context).textTheme.headline1,
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/collection'),
                child: Text(
                  'View more',
                  style: Theme.of(context).textTheme.headline2,
                ),
              )
            ],
          ),
        ),
        recommendedMeals.when(
          data: (data) {
            return RecommendedMealsCards(
              recommendedList: data,
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, e) => Center(
            child: Text(error.toString().trim()),
          ),
        ),
      ],
    );
  }
}
