import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/food_product.dart';
import '../models/meal_log.dart';

final foodRepositoryProvider = Provider(
  (ref) => FoodRepository(Supabase.instance.client),
);

class FoodRepository {
  final SupabaseClient _supabase;

  FoodRepository(this._supabase);

  Future<FoodProduct?> getFoodByBarcode(String barcode) async {
    // 1. Try Supabase Cache
    try {
      final response = await _supabase
          .from('food_products')
          .select()
          .eq('barcode', barcode)
          .maybeSingle();

      if (response != null) {
        return FoodProduct.fromJson(response);
      }
    } catch (e) {
      // Log error or ignore to fallthrough
      print('Supabase cache miss error: $e');
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

          // 3. Cache to Supabase
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
      await _supabase.from('food_products').upsert(product.toJson());
    } catch (e) {
      print('Cache error: $e');
    }
  }

  Future<List<FoodProduct>> searchFood(String query) async {
    // Basic implementation: search Supabase first, then maybe OFF search API
    // For now, let's just search Supabase text search if configured, or simple ilike
    final response = await _supabase
        .from('food_products')
        .select()
        .ilike('product_name', '%$query%')
        .limit(10);

    return (response as List).map((e) => FoodProduct.fromJson(e)).toList();
  }

  Future<void> logMeal(MealLog log) async {
    await _supabase.from('meal_logs').insert(log.toJson());
  }

  Future<List<MealLog>> getDailyLogs(DateTime date) async {
    final dateStr = date.toIso8601String().split('T')[0];
    final response = await _supabase
        .from('meal_logs')
        .select()
        .eq('date', dateStr)
        .order('created_at');

    return (response as List).map((e) => MealLog.fromJson(e)).toList();
  }
}
