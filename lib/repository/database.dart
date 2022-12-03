import 'package:belly_kitchen/models/meal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/meal_provider.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final container = ProviderContainer();
  late CollectionReference _meals;

  Stream get allMeals => _firestore.collection('meals').snapshots();

  Stream getMealsByCategory(String category) => _firestore
      .collection('meals')
      .where('category', arrayContains: category)
      .snapshots();

  Stream allFav() {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    if (currentUser == null) return Stream.empty();
    return FirebaseFirestore.instance
        .collection('fav')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('items')
        .snapshots();
  }

  Stream isParticularMealFav(String mealId) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    if (currentUser == null) return Stream.empty();
    return FirebaseFirestore.instance
        .collection('fav')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('items')
        .where('mealId', isEqualTo: mealId)
        .snapshots();
  }

  Stream allSearches() {
    var result = _firestore
        .collection('meals')
        .where('category', arrayContains: '')
        .snapshots();
    container.listen<String>(
      searchTextProvider,
      (value, newValue) {
        result = _firestore
            .collection('meals')
            .where('category', arrayContains: newValue)
            .snapshots();
      },
    );
    return result;
  }

  Future<dynamic> addFav(Meal meal) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    if (currentUser == null) return false;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('fav');
    await _collectionRef.doc(currentUser.email).collection('items').add(
      {
        'mealId': meal.mealId,
        'calories': meal.calories,
        'category': meal.category,
        'image': meal.image,
        'rate': meal.rate,
        'time': meal.time,
        'title': meal.title,
        'video': meal.video,
      },
    );
    return true;
  }

  Future<dynamic> deleteFav(Meal meal) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    if (currentUser == null) return false;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('fav');
    final favToRemove = await _collectionRef
        .doc(currentUser.email)
        .collection('items')
        .where('mealId', isEqualTo: meal.mealId)
        .get();
    print('favToRemove $favToRemove');
    final favToRemoveID = favToRemove.docs.last.id;
    print('favToRemoveID $favToRemoveID');
    await _collectionRef
        .doc(currentUser.email)
        .collection('items')
        .doc(favToRemoveID)
        .delete();
    return true;
  }

  Future<bool> editMeal(Meal m, String mealId) async {
    _meals = _firestore.collection('meals');
    try {
      await _meals.doc(mealId).update(
        {
          'title': m.title,
          'calories': m.calories,
          'image': m.image,
          'time': m.time,
          'video': m.video,
          'category': m.category
        },
      );
      return true;
    } on Exception catch (e) {
      print(e);
      return Future.error(e);
    }
  }
}

final databaseProvider = Provider((ref) => Database());
