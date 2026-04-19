import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../gamification/presentation/widgets/streak_flame.dart';
import '../../models/meal_log.dart';
import '../providers/nutrition_provider.dart';
import 'food_logger_screen.dart';

class NutritionDashboard extends ConsumerWidget {
  const NutritionDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(nutritionSummaryProvider);
    final logsAsync = ref.watch(dailyLogsProvider);
    final selectedDate = ref.watch(selectedDateProvider);

    // Mock targets
    const targetCalories = 2000.0;
    const targetProtein = 150.0;
    const targetCarbs = 200.0;
    const targetFat = 70.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutrition'),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: StreakFlame(),
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined),
            onPressed: () {
              // Date picker logic
            },
          ),
          IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Selector (Mock)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {},
                    ),
                    Text(
                      DateFormat('EEEE, MMM d').format(selectedDate),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              // Macro Grid
              const SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.5,
                children: [
                  _buildMacroCard(
                    'Calories',
                    '${summary['calories']?.round()} kcal',
                    'in plate',
                    summary['calories']! / targetCalories,
                    Colors.blueAccent,
                  ),
                  _buildMacroCard(
                    'Protein',
                    '${summary['protein']?.round()} g',
                    'in plate',
                    summary['protein']! / targetProtein,
                    const Color(0xFFFF5252), // Coral Red
                  ),
                  _buildMacroCard(
                    'Fat',
                    '${summary['fat']?.round()} g',
                    'in plate',
                    summary['fat']! / targetFat,
                    const Color(0xFFFFC107), // Amber
                  ),
                  _buildMacroCard(
                    'Carbs',
                    '${summary['carbs']?.round()} g',
                    'in plate',
                    summary['carbs']! / targetCarbs,
                    const Color(0xFF4CAF50), // Mint Green
                  ),
                ],
              ),

              const SizedBox(height: 24),
              Text(
                'Recommended Meals',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildRecommendedMealCard(
                      context,
                      'Oatmeal & Berries',
                      '350 kcal • 15g P • 50g C • 8g F',
                      Icons.breakfast_dining,
                      Colors.orangeAccent,
                    ),
                    const SizedBox(width: 12),
                    _buildRecommendedMealCard(
                      context,
                      'Grilled Chicken Salad',
                      '420 kcal • 45g P • 20g C • 15g F',
                      Icons.lunch_dining,
                      Colors.greenAccent,
                    ),
                    const SizedBox(width: 12),
                    _buildRecommendedMealCard(
                      context,
                      'Protein Shake',
                      '220 kcal • 30g P • 10g C • 5g F',
                      Icons.local_drink,
                      Colors.purpleAccent,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Plate',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_upward),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Timeline / Meal List
              logsAsync.when(
                data: (logs) => _buildMealList(context, logs),
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(),
                  ),
                ),
                error: (err, stack) => Text('Error: $err'),
              ),

              const SizedBox(height: 80), // Space for FAB
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 140,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FoodLoggerScreen()),
            );
          },
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          label: const Text('Log Foods'),
          icon: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildMacroCard(
    String title,
    String value,
    String subtitle,
    double progress,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            LinearPercentIndicator(
              lineHeight: 6.0,
              percent: progress.clamp(0.0, 1.0),
              backgroundColor: color.withOpacity(0.15),
              progressColor: color,
              padding: EdgeInsets.zero,
              barRadius: const Radius.circular(3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedMealCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 32),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  Widget _buildMealList(BuildContext context, List<MealLog> logs) {
    if (logs.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Icon(Icons.restaurant_menu, size: 48, color: Colors.grey[300]),
              const SizedBox(height: 10),
              Text(
                'Your plate is empty',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      );
    }

    // Grouping logic if needed, but for "Your Plate" style, a flat list works too
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: logs.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final log = logs[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // Icon Placeholder
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.breadSlice,
                    color: Colors.orange,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        log.customName ?? log.foodProductBarcode ?? 'Unknown',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          _microMacro(
                            Icons.local_fire_department,
                            '${log.totalCalories?.round()}',
                          ),
                          const SizedBox(width: 8),
                          _microMacro(
                            Icons.circle,
                            '${log.totalProtein?.round()}P',
                            color: Colors.red,
                          ),
                          const SizedBox(width: 8),
                          _microMacro(
                            Icons.circle,
                            '${log.totalFat?.round()}F',
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 8),
                          _microMacro(
                            Icons.circle,
                            '${log.totalCarbs?.round()}C',
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Quantity
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${log.quantityConsumed.round()}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        log.unit,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _microMacro(IconData icon, String text, {Color color = Colors.grey}) {
    return Row(
      children: [
        Icon(icon, size: 10, color: color),
        const SizedBox(width: 2),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
