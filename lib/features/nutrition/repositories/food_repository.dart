import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/food_product.dart';
import '../models/meal_log.dart';

final foodRepositoryProvider = Provider(
  (ref) => FoodRepository(FirebaseFirestore.instance),
);

class FoodRepository {
  final FirebaseFirestore _firestore;

  FoodRepository(this._firestore);

  Future<FoodProduct?> getFoodByBarcode(String barcode) async {
    // 1. Try Firebase Cache
    try {
      final docName = barcode;
      final docSnap = await _firestore.collection('food_products').doc(docName).get();

      if (docSnap.exists) {
        return FoodProduct.fromJson(docSnap.data()!);
      }
    } catch (e) {
      // Log error or ignore to fallthrough
      print('Firebase cache miss error: $e');
    }

    // 2. Try OpenFoodFacts
    return await _fetchFromOpenFoodFacts(barcode);
  }

  Future<FoodProduct?> _fetchFromOpenFoodFacts(String barcode) async {
    final url = Uri.parse(
      'https://world.openfoodfacts.org/api/v0/product/$barcode.json',
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 1) {
          final product = data['product'];
          final foodProduct = FoodProduct(
            barcode: barcode,
            productName: product['product_name'] ?? 'Unknown Product',
            brand: product['brands'],
            servingSize: product['serving_size'],
            calories: _parseNutrient(product['nutriments'], 'energy-kcal_100g'),
            proteins100g: _parseNutrient(
              product['nutriments'],
              'proteins_100g',
            ),
            carbs100g: _parseNutrient(
              product['nutriments'],
              'carbohydrates_100g',
            ),
            fats100g: _parseNutrient(product['nutriments'], 'fat_100g'),
            imageUrl: product['image_front_url'],
          );

          // 3. Cache to Firebase
          await _cacheProduct(foodProduct);
          return foodProduct;
        }
      }
    } catch (e) {
      print('OFF Error: $e');
    }
    return null;
  }

  double? _parseNutrient(Map<String, dynamic>? nutriments, String key) {
    if (nutriments == null) return null;
    final val = nutriments[key];
    if (val is num) return val.toDouble();
    if (val is String) return double.tryParse(val);
    return null;
  }

  Future<void> _cacheProduct(FoodProduct product) async {
    try {
      await _firestore.collection('food_products').doc(product.barcode).set(product.toJson(), SetOptions(merge: true));
    } catch (e) {
      print('Cache error: $e');
    }
  }

  Future<List<FoodProduct>> searchFood(String query) async {
    // Basic implementation: search Firebase first, then maybe OFF search API
    // Note: Firebase doesn't do native partial text search easily like SQL 'ilike'.
    // We'll simulate a simple prefix search or equality fetch for demo.
    final response = await _firestore
        .collection('food_products')
        .where('product_name', isGreaterThanOrEqualTo: query)
        .where('product_name', isLessThanOrEqualTo: '$query\uf8ff')
        .limit(10)
        .get();

    return response.docs.map((e) => FoodProduct.fromJson(e.data())).toList();
  }

  Future<void> logMeal(MealLog log) async {
    await _firestore.collection('meal_logs').add(log.toJson());
  }

  Future<List<MealLog>> getDailyLogs(DateTime date) async {
    final dateStr = date.toIso8601String().split('T')[0];
    // This requires simple setup of storing date as 'YYYY-MM-DD' or using Timestamp.
    final response = await _firestore
        .collection('meal_logs')
        .where('date', isGreaterThanOrEqualTo: dateStr) // A simple string match if 'date' is stored as string '2023-10-10' might fail if it's stored as full ISO string. Let's assume it's stored as full ISO or timestamp.
        // the original code used eq('date', dateStr). Since logMeal saves DateTime as ISO string we should perhaps check prefix.
        // To be safe and identical to the old logic where date is stored as ISO8601 string, we can do a prefix search.
        .where('date', isGreaterThanOrEqualTo: dateStr)
        .where('date', isLessThan: '${dateStr}T23:59:59')
        .get();

    return response.docs.map((e) => MealLog.fromJson(e.data())).toList();
  }
}
