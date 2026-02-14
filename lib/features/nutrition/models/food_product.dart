class FoodProduct {
  final String barcode;
  final String productName;
  final String? brand;
  final String? servingSize;
  final double? calories;
  final double? proteins100g;
  final double? carbs100g;
  final double? fats100g;
  final String? imageUrl;

  FoodProduct({
    required this.barcode,
    required this.productName,
    this.brand,
    this.servingSize,
    this.calories,
    this.proteins100g,
    this.carbs100g,
    this.fats100g,
    this.imageUrl,
  });

  factory FoodProduct.fromJson(Map<String, dynamic> json) {
    return FoodProduct(
      barcode: json['barcode'] as String,
      productName: json['product_name'] as String,
      brand: json['brand'] as String?,
      servingSize: json['serving_size'] as String?,
      calories: (json['calories'] as num?)?.toDouble(),
      proteins100g: (json['proteins_100g'] as num?)?.toDouble(),
      carbs100g: (json['carbs_100g'] as num?)?.toDouble(),
      fats100g: (json['fats_100g'] as num?)?.toDouble(),
      imageUrl: json['image_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'barcode': barcode,
      'product_name': productName,
      'brand': brand,
      'serving_size': servingSize,
      'calories': calories,
      'proteins_100g': proteins100g,
      'carbs_100g': carbs100g,
      'fats_100g': fats100g,
      'image_url': imageUrl,
    };
  }
}
