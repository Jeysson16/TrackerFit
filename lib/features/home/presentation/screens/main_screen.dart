import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../nutrition/presentation/screens/nutrition_dashboard.dart';
import '../../../training/presentation/screens/training_screen.dart';
import '../../../gamification/presentation/widgets/celebration_overlay.dart';
import '../../../profile/presentation/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const NutritionDashboard(),
    const TrainingScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CelebrationOverlay(
      child: Scaffold(
        // Optional: Global AppBar if you want streak always visible,
        // but typically it's inside each tab's AppBar.
        // We will inject it into specific screens or use a global one here if design permits.
        // For now, let's keep screens independent but wrapped in Celebration.
        body: IndexedStack(index: _currentIndex, children: _screens),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.restaurant_menu),
              label: 'Nutrition',
            ),
            NavigationDestination(
              icon: Icon(FontAwesomeIcons.dumbbell),
              label: 'Training',
            ),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
