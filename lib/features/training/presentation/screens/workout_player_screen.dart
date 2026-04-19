import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/workout_day_model.dart';
import '../../models/exercise_model.dart';
import '../../providers/workout_session_provider.dart';
import '../../models/workout_session_model.dart';

class WorkoutPlayerScreen extends ConsumerStatefulWidget {
  final String routineId;
  final String routineName;
  final WorkoutDayModel day;
  final List<ExerciseModel> exercisesDetails;

  const WorkoutPlayerScreen({
    super.key,
    required this.routineId,
    required this.routineName,
    required this.day,
    required this.exercisesDetails,
  });

  @override
  ConsumerState<WorkoutPlayerScreen> createState() => _WorkoutPlayerScreenState();
}

class _WorkoutPlayerScreenState extends ConsumerState<WorkoutPlayerScreen> {
  int? _activeSetIndex;
  String _activeField = ''; // 'lb' or 'reps'
  int _currentExerciseIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(workoutSessionProvider.notifier).startWorkout(
        widget.routineId,
        widget.day.id,
        widget.routineName,
        'local_user', // Assuming local user for now
        widget.day.exercises,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(workoutSessionProvider);
    if (session == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    
    // Safety check in case exercises are empty or mismatched
    if (session.exercises.isEmpty || _currentExerciseIndex >= session.exercises.length) {
      return const Scaffold(body: Center(child: Text('No hay ejercicios configurados.')));
    }
    
    final currentExerciseLog = session.exercises[_currentExerciseIndex];
    final currentExerciseDetail = widget.exercisesDetails.firstWhere(
      (e) => e.id == currentExerciseLog.exerciseId,
      orElse: () => ExerciseModel(id: '', name: 'Desconocido', sportId: '', primaryMuscles: [], secondaryMuscles: [], trainingTypes: []),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.menu, color: Colors.black), onPressed: () {}),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.timer_outlined, color: Colors.black, size: 20),
                SizedBox(width: 4),
                Text('0:04:28', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.av_timer, color: Colors.black, size: 20),
                const SizedBox(width: 4),
                const Text('1:00', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                Container(
                  width: 40,
                  height: 12,
                  decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(6)),
                )
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          _buildExerciseStrip(session),
          const Divider(height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(currentExerciseDetail.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Ejercicio ${_currentExerciseIndex + 1} de ${session.exercises.length}', style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildActionButton(Icons.info_outline, 'Info'),
                      const SizedBox(width: 8),
                      // "Warm up" function will add a warm up set
                      GestureDetector(
                         onTap: () {
                            ref.read(workoutSessionProvider.notifier).addSetToExercise(currentExerciseLog.id!, isWarmup: true);
                         },
                         child: _buildActionButton(Icons.fireplace, 'Warm Up')
                      ),
                      const SizedBox(width: 8),
                      _buildActionButton(Icons.swap_horiz, 'Swap'),
                      const SizedBox(width: 8),
                      _buildActionButton(Icons.note_add_outlined, 'Note'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _buildSetsTable(currentExerciseLog),
                  const SizedBox(height: 300), // Space for keyboard
                ],
              ),
            ),
          ),
          if (_activeSetIndex != null) _buildCustomKeyboard(currentExerciseLog),
        ],
      ),
    );
  }

  Widget _buildExerciseStrip(WorkoutSessionModel session) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: session.exercises.length + 1,
        itemBuilder: (context, index) {
          if (index == session.exercises.length) {
            return Container(
              width: 60,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.add, color: Colors.grey),
            );
          }
          final isCurrent = index == _currentExerciseIndex;
          return GestureDetector(
            onTap: () {
               setState(() {
                  _currentExerciseIndex = index;
                  _activeSetIndex = null;
               });
            },
            child: Container(
              width: 60,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: isCurrent ? Colors.blue.shade50 : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
                border: isCurrent ? Border.all(color: Colors.blue, width: 2) : null,
              ),
              child: Icon(Icons.videocam_off_outlined, color: Colors.grey.shade500),
            )
          );
        },
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.black87),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildSetsTable(ExerciseLogModel currentExerciseLog) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 30, child: Text('Set', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
            const Expanded(child: Text('Previous ↔', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
            const SizedBox(width: 60, child: Text('Lb', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
            const SizedBox(width: 60, child: Text('Reps', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
            const SizedBox(width: 40, child: Icon(Icons.check_box_outline_blank, size: 20, color: Colors.transparent)),
          ],
        ),
        const SizedBox(height: 16),
        ...currentExerciseLog.sets.asMap().entries.map((e) {
          final index = e.key;
          final setInfo = e.value;
          final isLbcActive = _activeSetIndex == index && _activeField == 'lb';
          final isRepActive = _activeSetIndex == index && _activeField == 'reps';

          String setLabel = '${setInfo.setOrder}';
          if (setInfo.isWarmup) setLabel = 'W';
          if (setInfo.isDropSet) setLabel = 'D';

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: setInfo.isWarmup || setInfo.isDropSet
                        ? BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle)
                        : null,
                    child: Text(
                      setLabel,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade800),
                    ),
                  ),
                ),
                Expanded(
                  child: Text('-', style: TextStyle(color: Colors.grey.shade500)), // Previous data placeholder
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _activeSetIndex = index;
                      _activeField = 'lb';
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 36,
                    decoration: BoxDecoration(
                      color: isLbcActive ? Colors.white : Colors.grey.shade200,
                      border: isLbcActive ? Border.all(color: Colors.black, width: 2) : null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text(setInfo.weightKg?.toString() ?? '-', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: setInfo.weightKg == null ? Colors.grey : Colors.black))),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _activeSetIndex = index;
                      _activeField = 'reps';
                    });
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 60,
                        height: 36,
                        decoration: BoxDecoration(
                          color: isRepActive ? Colors.white : Colors.grey.shade200,
                          border: isRepActive ? Border.all(color: Colors.black, width: 2) : null,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(child: Text(setInfo.reps?.toString() ?? '-', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: setInfo.reps == null ? Colors.grey : Colors.black))),
                      ),
                      if (setInfo.rir != null)
                        Positioned(
                          right: -6,
                          bottom: -6,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.amber,
                            child: Text('${setInfo.rir}', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                          ),
                        )
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    final newValue = !setInfo.isCompleted;
                    ref.read(workoutSessionProvider.notifier).updateSetLog(
                      currentExerciseLog.id!,
                      index,
                      setInfo.copyWith(isCompleted: newValue),
                    );
                    if (newValue && setInfo.rir == null) {
                      setState(() {
                        _activeSetIndex = index;
                        _activeField = 'reps'; // Show keyboard to pick RIR when completed
                      });
                    }
                  },
                  child: SizedBox(
                    width: 32,
                    child: Icon(
                      setInfo.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
                      color: setInfo.isCompleted ? Colors.green : Colors.grey.shade400,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        const SizedBox(height: 16),
        TextButton.icon(
           onPressed: () {
              ref.read(workoutSessionProvider.notifier).addSetToExercise(currentExerciseLog.id!);
           },
           icon: const Icon(Icons.add),
           label: const Text('Add Set'),
           style: TextButton.styleFrom(foregroundColor: Colors.blue),
        )
      ],
    );
  }

  Widget _buildCustomKeyboard(ExerciseLogModel currentExerciseLog) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.only(bottom: 24, top: 12),
      child: Column(
        children: [
          // RIR Row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRirCircle(0, Colors.red, currentExerciseLog),
                _buildRirCircle(1, Colors.redAccent, currentExerciseLog),
                _buildRirCircle(2, Colors.orange, currentExerciseLog),
                _buildRirCircle(3, Colors.amber, currentExerciseLog),
                _buildRirCircle(4, Colors.green, currentExerciseLog),
                _buildRirCircle(5, Colors.green.shade600, currentExerciseLog),
                _buildRirCircle(6, Colors.blue, currentExerciseLog),
                _buildRirCircle('+', Colors.blue.shade700, currentExerciseLog),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Numpad Row 1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildKey('1', currentExerciseLog), _buildKey('2', currentExerciseLog), _buildKey('3', currentExerciseLog),
              _buildActionKey(Icons.keyboard_arrow_down, () {
                setState(() {
                  _activeSetIndex = null;
                });
              }),
            ],
          ),
          const SizedBox(height: 8),
          // Numpad Row 2
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildKey('4', currentExerciseLog), _buildKey('5', currentExerciseLog), _buildKey('6', currentExerciseLog),
              _buildActionKey(Icons.backspace_outlined, () {
                 if (_activeSetIndex != null) {
                    final setLog = currentExerciseLog.sets[_activeSetIndex!];
                    if (_activeField == 'lb') {
                        String current = setLog.weightKg?.toString() ?? '';
                        if (current.isNotEmpty && current != '-') {
                            String updatedStr = current.substring(0, current.length - 1);
                            double? newLb = updatedStr.isEmpty ? null : double.tryParse(updatedStr);
                            ref.read(workoutSessionProvider.notifier).updateSetLog(currentExerciseLog.id!, _activeSetIndex!, setLog.copyWith(weightKg: newLb));
                        }
                    } else if (_activeField == 'reps') {
                        String current = setLog.reps?.toString() ?? '';
                        if (current.isNotEmpty && current != '-') {
                            String updatedStr = current.substring(0, current.length - 1);
                            int? newReps = updatedStr.isEmpty ? null : int.tryParse(updatedStr);
                            ref.read(workoutSessionProvider.notifier).updateSetLog(currentExerciseLog.id!, _activeSetIndex!, setLog.copyWith(reps: newReps));
                        }
                    }
                 }
              }),
            ],
          ),
          const SizedBox(height: 8),
          // Numpad Row 3
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildKey('7', currentExerciseLog), _buildKey('8', currentExerciseLog), _buildKey('9', currentExerciseLog),
              Container(
                width: 60, height: 48,
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('F', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Text('P', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Numpad Row 4
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildKey('.', currentExerciseLog), _buildKey('0', currentExerciseLog), 
              _buildActionKey(Icons.cancel_presentation, () {}),
              GestureDetector(
                onTap: () {
                   if (_activeSetIndex != null) {
                      final setLog = currentExerciseLog.sets[_activeSetIndex!];
                      ref.read(workoutSessionProvider.notifier).updateSetLog(currentExerciseLog.id!, _activeSetIndex!, setLog.copyWith(isCompleted: true));
                      setState(() {
                        if (_activeSetIndex! < currentExerciseLog.sets.length - 1) {
                           _activeSetIndex = _activeSetIndex! + 1;
                        } else {
                           _activeSetIndex = null;
                        }
                      });
                   }
                },
                child: Container(
                  width: 60, height: 48,
                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.check, color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKey(String label, ExerciseLogModel currentExerciseLog) {
    return GestureDetector(
      onTap: () {
         if (_activeSetIndex != null) {
            final setLog = currentExerciseLog.sets[_activeSetIndex!];
            if (_activeField == 'lb') {
                String current = setLog.weightKg?.toString() ?? '';
                if (current.endsWith('.0')) {
                   current = current.replaceAll('.0', ''); // clean trailing .0
                }
                current += label;
                ref.read(workoutSessionProvider.notifier).updateSetLog(
                   currentExerciseLog.id!, 
                   _activeSetIndex!, 
                   setLog.copyWith(weightKg: double.tryParse(current))
                );
            } else if (_activeField == 'reps') {
                String current = setLog.reps?.toString() ?? '';
                current += label;
                ref.read(workoutSessionProvider.notifier).updateSetLog(
                   currentExerciseLog.id!, 
                   _activeSetIndex!, 
                   setLog.copyWith(reps: int.tryParse(current))
                );
            }
         }
      },
      child: Container(
        width: 60, height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 2, offset: const Offset(0, 1))]
        ),
        child: Center(child: Text(label, style: const TextStyle(fontSize: 24))),
      ),
    );
  }

  Widget _buildActionKey(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60, height: 48,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: Icon(icon, color: Colors.black87)),
      ),
    );
  }

  Widget _buildRirCircle(dynamic value, Color color, ExerciseLogModel currentExerciseLog) {
    return GestureDetector(
      onTap: () {
         if (_activeSetIndex != null) {
            final setLog = currentExerciseLog.sets[_activeSetIndex!];
            int? parsedRir = (value is int) ? value : null; // simplified handling for '+'
            ref.read(workoutSessionProvider.notifier).updateSetLog(
               currentExerciseLog.id!, 
               _activeSetIndex!, 
               setLog.copyWith(rir: parsedRir)
            );
         }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        width: 24, height: 24,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Center(child: Text('$value', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
      ),
    );
  }
}
