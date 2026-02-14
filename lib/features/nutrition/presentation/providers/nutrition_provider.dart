import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart'; // Explicit import

import '../../models/meal_log.dart';
import '../../repositories/food_repository.dart';

final selectedDateProvider = StateProvider.autoDispose<DateTime>(
  (ref) => DateTime.now(),
);

final dailyLogsProvider = FutureProvider.autoDispose<List<MealLog>>((
  ref,
) async {
  final repository = ref.watch(foodRepositoryProvider);
  final date = ref.watch(selectedDateProvider);
  return repository.getDailyLogs(date);
});

final nutritionSummaryProvider = Provider.autoDispose<Map<String, double>>((
  ref,
) {
  final logsAsync = ref.watch(dailyLogsProvider);

  return logsAsync.when(
    data: (logs) {
      double calories = 0;
      double protein = 0;
      double carbs = 0;
      double fat = 0;

      for (var log in logs) {
        calories += log.totalCalories ?? 0;
        protein += log.totalProtein ?? 0;
        carbs += log.totalCarbs ?? 0;
        fat += log.totalFat ?? 0;
      }

      return {
        'calories': calories,
        'protein': protein,
        'carbs': carbs,
        'fat': fat,
      };
    },
    loading: () => {'calories': 0, 'protein': 0, 'carbs': 0, 'fat': 0},
    error: (_, __) => {'calories': 0, 'protein': 0, 'carbs': 0, 'fat': 0},
  );
});
