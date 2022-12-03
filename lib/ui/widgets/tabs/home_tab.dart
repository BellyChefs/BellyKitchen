import 'package:belly_kitchen/providers/meal_provider.dart';
import 'package:belly_kitchen/repository/database.dart';
import 'package:belly_kitchen/ui/widgets/animated_horizontal_list.dart';
import 'package:belly_kitchen/ui/widgets/meal_list.dart';
import 'package:belly_kitchen/ui/widgets/on_tap_opacity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

String parseCategory(int index) {
  switch (index) {
    case 0:
      return 'beer';
    case 1:
      return 'bread';
    case 2:
      return 'vegs';
    case 3:
      return 'cakes';
    case 4:
      return 'bakery';
    case 5:
      return 'junk';
    case 6:
      return 'meat';
    case 7:
      return 'popcorn';
    case 8:
      return 'noodle';
    case 9:
      return 'salad';
    case 10:
      return 'soup';
    default:
      return 'vegs';
  }
}

class HomeTab extends ConsumerWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    return ListView(
      children: <Widget>[
        const SizedBox(
          height: 24,
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
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 24,
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
        StreamBuilder<dynamic>(
          stream: database.allMeals,
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
    );
  }
}
