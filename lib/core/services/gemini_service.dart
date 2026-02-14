import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../features/nutrition/models/meal_log.dart';
import '../utils/nutrition_calculator.dart';

// NOTE: You should provide the API KEY via environment variables or a secure config
final geminiServiceProvider = Provider(
  (ref) => GeminiNutritionService('YOUR_GEMINI_API_KEY'),
);

class GeminiNutritionService {
  final String apiKey;
  late final GenerativeModel _model;

  GeminiNutritionService(this.apiKey) {
    _model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  }

  Future<String> generateDailyFeedback({
    required List<MealLog> meals,
    required MacroTargets targets,
    required String userNote,
  }) async {
    final mealSummary = meals
        .map(
          (m) => {
            'name': m.customName ?? m.foodProductBarcode ?? 'Unknown',
            'type': m.mealType.name,
            'calories': m.totalCalories,
            'protein': m.totalProtein,
            'carbs': m.totalCarbs,
            'fat': m.totalFat,
          },
        )
        .toList();

    final goals = {
      'calories': targets.calories,
      'protein': targets.proteinGrams,
      'carbs': targets.carbGrams,
      'fat': targets.fatGrams,
    };

    final prompt =
        '''
Actúa como un nutricionista deportivo experto. 
El usuario consumió: ${jsonEncode(mealSummary)}. 
Sus metas son: ${jsonEncode(goals)}. 
El usuario dejó esta nota sobre su día: '$userNote'. 

Analiza: 
1. Si cumplió sus macros. 
2. Calidad de alimentos. 
3. Su sensación subjetiva. 

Dame un feedback corto, empático y accionable de max 30 palabras.
''';

    try {
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      return response.text ?? 'No se pudo generar feedback.';
    } catch (e) {
      print('Gemini Error: $e');
      return 'Error conectando con el nutricionista IA.';
    }
  }
}
