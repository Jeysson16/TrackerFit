enum Gender { male, female }
enum Goal { deficit, maintenance, surplus }
enum ActivityLevel {
  sedentary(1.2),
  lightlyActive(1.375),
  active(1.55),
  veryActive(1.725),
  athlete(1.9);

  final double value;
  const ActivityLevel(this.value);
}

class MacroTargets {
  final int calories;
  final int proteinGrams;
  final int fatGrams;
  final int carbGrams;

  MacroTargets({
    required this.calories,
    required this.proteinGrams,
    required this.fatGrams,
    required this.carbGrams,
  });

  @override
  String toString() {
    return 'Calories: $calories, P: ${proteinGrams}g, F: ${fatGrams}g, C: ${carbGrams}g';
  }
}

class NutritionCalculator {
  /// Calculates Basal Metabolic Rate (BMR) using Mifflin-St Jeor Equation
  static double calculateBMR({
    required double weightKg,
    required double heightCm,
    required int age,
    required Gender gender,
  }) {
    double bmr = (10 * weightKg) + (6.25 * heightCm) - (5 * age);
    
    if (gender == Gender.male) {
      bmr += 5;
    } else {
      bmr -= 161;
    }
    
    return bmr;
  }

  /// Calculates Total Daily Energy Expenditure (TDEE)
  static double calculateTDEE({
    required double bmr,
    required ActivityLevel activityLevel,
  }) {
    return bmr * activityLevel.value;
  }

  /// Calculates Daily Targets based on goal and macro preferences
  static MacroTargets calculateTargets({
    required double weightKg,
    required double heightCm,
    required int age,
    required Gender gender,
    required ActivityLevel activityLevel,
    required Goal goal,
    double proteinPerKg = 2.0,
    double fatPerKg = 1.0,
    int deficitCalories = 400,
    int surplusCalories = 300,
  }) {
    // 1. Calculate BMR
    final bmr = calculateBMR(
      weightKg: weightKg,
      heightCm: heightCm,
      age: age,
      gender: gender,
    );

    // 2. Calculate TDEE
    final tdee = calculateTDEE(bmr: bmr, activityLevel: activityLevel);

    // 3. Adjust for Goal
    double targetCalories = tdee;
    switch (goal) {
      case Goal.deficit:
        targetCalories -= deficitCalories;
        break;
      case Goal.surplus:
        targetCalories += surplusCalories;
        break;
      case Goal.maintenance:
        break;
    }

    // Ensure we don't go below a safe minimum (e.g., BMR or fixed 1200)
    // For simplicity, let's floor it at 1200 for now if it's too low, or just return the calc.
    if (targetCalories < 1200) targetCalories = 1200;

    // 4. Calculate Macros
    // Protein: 4 kcal/g
    double proteinGrams = weightKg * proteinPerKg;
    double proteinCalories = proteinGrams * 4;

    // Fat: 9 kcal/g
    double fatGrams = weightKg * fatPerKg;
    double fatCalories = fatGrams * 9;

    // Carbs: Remaining calories / 4
    double remainingCalories = targetCalories - proteinCalories - fatCalories;
    // Ensure remaining calories is not negative (edge case with very high macro settings)
    if (remainingCalories < 0) remainingCalories = 0;
    
    double carbGrams = remainingCalories / 4;

    return MacroTargets(
      calories: targetCalories.round(),
      proteinGrams: proteinGrams.round(),
      fatGrams: fatGrams.round(),
      carbGrams: carbGrams.round(),
    );
  }
}
