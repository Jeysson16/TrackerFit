import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/food_product.dart';
import '../../models/meal_log.dart';
import '../../repositories/food_repository.dart';
import '../providers/nutrition_provider.dart';

class FoodLoggerScreen extends ConsumerStatefulWidget {
  const FoodLoggerScreen({super.key});

  @override
  ConsumerState<FoodLoggerScreen> createState() => _FoodLoggerScreenState();
}

class _FoodLoggerScreenState extends ConsumerState<FoodLoggerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  List<FoodProduct> _searchResults = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.index = 1; // Default to 'Search'
  }

  Future<void> _search() async {
    if (_searchController.text.isEmpty) return;

    setState(() => _isLoading = true);
    final query = _searchController.text;
    final repo = ref.read(foodRepositoryProvider);

    try {
      if (int.tryParse(query) != null && query.length > 8) {
        final product = await repo.getFoodByBarcode(query);
        if (product != null) {
          _searchResults = [product];
        } else {
          _searchResults = [];
        }
      } else {
        _searchResults = await repo.searchFood(query);
      }
    } catch (e) {
      // Handle error gracefully
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error searching: $e')));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showFoodDetail(FoodProduct product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FoodDetailSheet(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: null,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: const [
            Tab(text: 'Scan', icon: Icon(Icons.qr_code_scanner, size: 20)),
            Tab(text: 'Search', icon: Icon(Icons.search, size: 20)),
            Tab(text: 'AI', icon: Icon(Icons.auto_awesome, size: 20)),
            Tab(text: 'Quick', icon: Icon(Icons.flash_on, size: 20)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildScannerPlaceholder(),
          _buildSearchTab(),
          _buildAIPlaceholder(),
          _buildQuickAddPlaceholder(),
        ],
      ),
    );
  }

  Widget _buildSearchTab() {
    return Column(
      children: [
        // Search Results Area
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _searchResults.isEmpty
              ? _buildEmptyState()
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: _searchResults.length,
                  separatorBuilder: (ctx, i) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final product = _searchResults[index];
                    return _buildFoodItem(product);
                  },
                ),
        ),
        // Bottom Search Bar
        Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).padding.bottom + 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search for food (e.g. "Apple")',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  onSubmitted: (_) => _search(),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: _search,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.black,
                ),
                child: const Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFoodItem(FoodProduct product) {
    return InkWell(
      onTap: () => _showFoodDetail(product),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                image: product.imageUrl != null
                    ? DecorationImage(
                        image: NetworkImage(product.imageUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: product.imageUrl == null
                  ? const Icon(
                      FontAwesomeIcons.utensils,
                      color: Colors.grey,
                      size: 20,
                    )
                  : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${product.calories?.round() ?? 0} kcal • ${product.servingSize ?? "100g"}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline, color: Colors.grey),
              onPressed: () => _showFoodDetail(product),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 64, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'Search for food',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScannerPlaceholder() =>
      const Center(child: Text('Scanner Camera View Here'));
  Widget _buildAIPlaceholder() =>
      const Center(child: Text('Gemini AI Input Here'));
  final TextEditingController _quickNameController = TextEditingController();
  final TextEditingController _quickCaloriesController =
      TextEditingController();
  final TextEditingController _quickProteinController = TextEditingController();

  Widget _buildQuickAddPlaceholder() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _quickNameController,
            decoration: const InputDecoration(
              labelText: 'Food Name',
              hintText: 'e.g., Banana',
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _quickCaloriesController,
                  decoration: const InputDecoration(labelText: 'Calories'),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: _quickProteinController,
                  decoration: const InputDecoration(labelText: 'Protein (g)'),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                final name = _quickNameController.text.trim();
                final cals =
                    double.tryParse(_quickCaloriesController.text) ?? 0;
                final protein =
                    double.tryParse(_quickProteinController.text) ?? 0;

                if (name.isNotEmpty) {
                  final log = MealLog(
                    userId: 'CURRENT_USER_ID',
                    date: DateTime.now(),
                    mealType: MealType.snack,
                    customName: name,
                    quantityConsumed: 1,
                    unit: 'serving',
                    totalCalories: cals,
                    totalProtein: protein,
                    totalCarbs: 0.0,
                    totalFat: 0.0,
                  );

                  await ref.read(foodRepositoryProvider).logMeal(log);

                  if (mounted) {
                    ref.invalidate(dailyLogsProvider); // Refresh dashboard
                    Navigator.pop(context);
                  }
                }
              },
              child: const Text('Quick Add'),
            ),
          ),
        ],
      ),
    );
  }
}

class FoodDetailSheet extends ConsumerStatefulWidget {
  final FoodProduct product;

  const FoodDetailSheet({super.key, required this.product});

  @override
  ConsumerState<FoodDetailSheet> createState() => _FoodDetailSheetState();
}

class _FoodDetailSheetState extends ConsumerState<FoodDetailSheet> {
  final TextEditingController _quantityController = TextEditingController(
    text: '100',
  );
  double _quantity = 100;

  @override
  void initState() {
    super.initState();
    _quantityController.addListener(() {
      setState(() {
        _quantity = double.tryParse(_quantityController.text) ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    final factor = _quantity / 100;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        top: 24,
        left: 24,
        right: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  p.productName,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${(p.calories ?? 0 * factor).round()} kcal',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _nutrientCard(
                'Protein',
                '${((p.proteins100g ?? 0) * factor).round()}g',
                Colors.redAccent,
              ),
              _nutrientCard(
                'Carbs',
                '${((p.carbs100g ?? 0) * factor).round()}g',
                Colors.green,
              ),
              _nutrientCard(
                'Fat',
                '${((p.fats100g ?? 0) * factor).round()}g',
                Colors.amber,
              ),
            ],
          ),
          const SizedBox(height: 30),
          TextField(
            controller: _quantityController,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              labelText: 'Quantity (g)',
              alignLabelWithHint: true,
              floatingLabelAlignment: FloatingLabelAlignment.center,
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                final log = MealLog(
                  userId: 'CURRENT_USER_ID',
                  date: DateTime.now(),
                  mealType: MealType.snack,
                  foodProductBarcode: p.barcode,
                  quantityConsumed: _quantity,
                  unit: 'g',
                  totalCalories: (p.calories ?? 0) * factor,
                  totalProtein: (p.proteins100g ?? 0) * factor,
                  totalCarbs: (p.carbs100g ?? 0) * factor,
                  totalFat: (p.fats100g ?? 0) * factor,
                );

                ref.read(foodRepositoryProvider).logMeal(log);
                Navigator.pop(context);
                Navigator.pop(context); // Close screen
              },
              child: const Text('Add Food', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _nutrientCard(String label, String value, Color color) {
    return Container(
      width: 90,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(color: color, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
