import 'package:belly_kitchen/providers/auth_provider.dart';
import 'package:belly_kitchen/repository/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/meal.dart';

class MealTile extends ConsumerWidget {
  const MealTile({Key? key, this.meal}) : super(key: key);
  final dynamic meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final userStatus = ref.watch(fireBaseAuthProvider);
    final List<dynamic> categories = meal['category'] as List<dynamic>;
    final category = categories.fold('', (previousValue, dynamic element) {
      return '$previousValue ⋅ ${element.toString()}';
    });
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.94,
      height: 140,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        color: Colors.white70,
        elevation: 10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.28,
                  maxHeight: MediaQuery.of(context).size.width * 0.28,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    meal['image'].toString(),
                    fit: BoxFit.cover,
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      meal['title'].toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                    child: Text(
                      category,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 16),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.star_border_purple500_rounded,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: meal['rate'].toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 8, 0),
                  child: SizedBox(
                    height: 32,
                    width: 32,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('fav')
                          .doc(FirebaseAuth.instance.currentUser!.email)
                          .collection('items')
                          .where('mealId', isEqualTo: meal['mealId'].toString())
                          .snapshots(),
                      builder: (context, snapshot) {
                        print(snapshot.toString());
                        print(snapshot.data.toString());
                        if (snapshot.data == null ||
                            snapshot.data!.docs.length == 0) {
                          return IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () async {
                              await database.addFav(
                                Meal(
                                  time: meal['time'],
                                  title: meal['title'],
                                  calories: meal['calories'],
                                  category: meal['category'],
                                  video: meal['video'],
                                  image: meal['image'],
                                  rate: meal['rate'],
                                  mealId: meal['mealId'],
                                ),
                              );
                            },
                          );
                        } else {
                          return IconButton(
                            icon: const Icon(Icons.favorite),
                            onPressed: () async {
                              await database.deleteFav(
                                Meal(
                                  time: meal['time'],
                                  title: meal['title'],
                                  calories: meal['calories'],
                                  category: meal['category'],
                                  video: meal['video'],
                                  image: meal['image'],
                                  rate: meal['rate'],
                                  mealId: meal['mealId'],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 8, 16),
                  child: Text(
                    meal['time'].toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
