enum MealType { breakfast, lunch, dinner, snack }

class MealLog {
  final String? id;
  final String userId;
  final DateTime date;
  final MealType mealType;
  final String? foodProductBarcode;
  final String? customName;
  final double quantityConsumed;
  final String unit;
  final double? totalCalories;
  final double? totalProtein;
  final double? totalCarbs;
  final double? totalFat;

  MealLog({
    this.id,
    required this.userId,
    required this.date,
    required this.mealType,
    this.foodProductBarcode,
    this.customName,
    required this.quantityConsumed,
    required this.unit,
    this.totalCalories,
    this.totalProtein,
    this.totalCarbs,
    this.totalFat,
  });

  factory MealLog.fromJson(Map<String, dynamic> json) {
    return MealLog(
      id: json['id'] as String?,
      userId: json['user_id'] as String,
      date: DateTime.parse(json['date'] as String),
      mealType: MealType.values.firstWhere(
        (e) => e.name == json['meal_type'],
        orElse: () => MealType.snack,
      ),
      foodProductBarcode: json['food_product_barcode'] as String?,
      customName: json['custom_name'] as String?,
      quantityConsumed: (json['quantity_consumed'] as num).toDouble(),
      unit: json['unit'] as String,
      totalCalories: (json['total_calories'] as num?)?.toDouble(),
      totalProtein: (json['total_protein'] as num?)?.toDouble(),
      totalCarbs: (json['total_carbs'] as num?)?.toDouble(),
      totalFat: (json['total_fat'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'user_id': userId,
      'date': date.toIso8601String().split('T')[0], // YYYY-MM-DD
      'meal_type': mealType.name,
      'food_product_barcode': foodProductBarcode,
      'custom_name': customName,
      'quantity_consumed': quantityConsumed,
      'unit': unit,
      'total_calories': totalCalories,
      'total_protein': totalProtein,
      'total_carbs': totalCarbs,
      'total_fat': totalFat,
    };
  }
}
