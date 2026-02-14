import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../../services/gamification_service.dart';

final streakProvider = FutureProvider((ref) async {
  return ref.watch(gamificationServiceProvider).getUserStreak();
});

class StreakFlame extends ConsumerWidget {
  const StreakFlame({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streakAsync = ref.watch(streakProvider);

    return streakAsync.when(
      data: (streak) {
        final count = streak.currentStreak;
        final isActive = count > 0;

        return Tooltip(
          message: 'Current Streak: $count days',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Lottie Animation or Static Icon
              // Using a colored Icon with a glow effect for simplicity if Lottie asset not present
              // In real app, replace with Lottie.asset('assets/flame.json')
              Stack(
                alignment: Alignment.center,
                children: [
                   if (isActive)
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.6),
                            blurRadius: 10,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                    ),
                  Icon(
                    Icons.local_fire_department,
                    color: isActive ? Colors.orangeAccent : Colors.grey,
                    size: 24,
                  ),
                ],
              ),
              const SizedBox(width: 4),
              Text(
                '$count',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isActive ? Colors.orange[800] : Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)),
      error: (_, __) => const Icon(Icons.error_outline, size: 20, color: Colors.grey),
    );
  }
}
