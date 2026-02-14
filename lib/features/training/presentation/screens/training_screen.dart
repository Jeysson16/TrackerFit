import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/training_calendar.dart';
import '../widgets/routine_card.dart';

import '../../../gamification/presentation/widgets/streak_flame.dart';
import '../../../gamification/presentation/widgets/celebration_overlay.dart';
import '../../../gamification/services/gamification_service.dart';

class TrainingScreen extends ConsumerStatefulWidget {
  const TrainingScreen({super.key});

  @override
  ConsumerState<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends ConsumerState<TrainingScreen> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _simulateWorkoutComplete() async {
    // 1. Simulate saving workout
    // 2. Check for PR (mock)
    final isPR = await ref.read(gamificationServiceProvider).checkPersonalRecord('mock_exercise', 100, 5);
    
    // 3. Update Streak
    await ref.read(gamificationServiceProvider).updateStreak();
    ref.refresh(streakProvider); // Refresh UI

    if (mounted) {
       // Trigger confetti
       CelebrationOverlay.of(context)?.celebrate();
       
       ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
           content: Text('Workout Finished! 🏆 New PR detected!'),
           backgroundColor: Colors.green,
           behavior: SnackBarBehavior.floating,
         )
       );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Mock data - In real app, fetch from SyncController/LocalStorage
    final hasRoutine = _selectedDate.weekday == 1 || _selectedDate.weekday == 3 || _selectedDate.weekday == 5;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Schedule'),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: StreakFlame(),
          ),
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {
              // Trigger sync manually
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrainingCalendar(
              events: {
                DateTime.now(): ['Workout'],
              },
              onDaySelected: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Scheduled for ${_selectedDate.day}/${_selectedDate.month}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 8),
            if (hasRoutine)
              RoutineCard(
                routineName: _getRoutineName(_selectedDate.weekday),
                sportName: 'Gym',
                templateColor: Colors.blueAccent,
                exercises: const ['Bench Press', 'Incline DB Press', 'Tricep Pushdown'],
                onTap: () {
                   // In real app, navigate to player. 
                   // Here simulating completion for gamification demo.
                   _simulateWorkoutComplete();
                },
              )
            else
              _buildRestDayCard(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _simulateWorkoutComplete,
        icon: const Icon(Icons.add),
        label: const Text('Simulate Workout Complete'),
      ),
    );
  }

  String _getRoutineName(int weekday) {
    switch (weekday) {
      case 1: return 'Push Day';
      case 3: return 'Pull Day';
      case 5: return 'Legs Day';
      default: return 'Custom';
    }
  }

  Widget _buildRestDayCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      color: Colors.grey[100],
      child: const ListTile(
        leading: Icon(FontAwesomeIcons.bed, color: Colors.grey),
        title: Text('Rest Day'),
        subtitle: Text('Recover and eat well!'),
      ),
    );
  }
}
