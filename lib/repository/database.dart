import 'package:belly_kitchen/models/meal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final container = ProviderContainer();
  late CollectionReference _meals;

  Stream get allVegs => _firestore.collection('vegs').snapshots();

  Stream get allMeals => _firestore.collection('meals').snapshots();

  Stream allFav() {
    final authState = container.read(authStateProvider);
    if (authState.value != null) {
      return FirebaseFirestore.instance
          .collection('fav')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('items')
          .snapshots();
    } else {
      throw Exception('Login failed');
    }
  }

  Future<dynamic> addFav(Meal meal) async {
    final authState = container.read(authStateProvider);
    if (authState.value != null) {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      var currentUser = _auth.currentUser;
      CollectionReference _collectionRef =
          FirebaseFirestore.instance.collection('fav');
      await _collectionRef.doc(currentUser!.email).collection('items').add(
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
    } else {
      print("Login failed");
      return false;
    }
  }

  Future<dynamic> deleteFav(Meal meal) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('fav');
    final favToRemove = await _collectionRef
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('items')
        .where('mealId', isEqualTo: meal.mealId)
        .get();
    print('favToRemove $favToRemove');
    final favToRemoveID = favToRemove.docs.last.id;
    print('favToRemoveID $favToRemoveID');
    await _collectionRef
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('items')
        .doc(favToRemoveID)
        .delete();
  }

  Future<bool> addNewMovie(Meal m) async {
    _meals = _firestore.collection('meals');
    try {
      await _meals.add(
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
      return Future.error(e);
    }
  }

  Future<bool> removeMovie(String movieId) async {
    _meals = _firestore.collection('meals');
    try {
      await _meals.doc(movieId).delete();
      return true;
    } on Exception catch (e) {
      print(e);
      return Future.error(e);
    }
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
