import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/workout_template_model.dart';
import '../../models/workout_day_model.dart';
import '../../models/exercise_model.dart';
import '../../models/muscle_group_model.dart';
import '../../repositories/training_repository.dart';
import 'workout_player_screen.dart';

class WorkoutProgramDetailScreen extends ConsumerStatefulWidget {
  final WorkoutTemplateModel template;

  const WorkoutProgramDetailScreen({super.key, required this.template});

  @override
  ConsumerState<WorkoutProgramDetailScreen> createState() => _WorkoutProgramDetailScreenState();
}

class _WorkoutProgramDetailScreenState extends ConsumerState<WorkoutProgramDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final length = widget.template.days.isEmpty ? 1 : widget.template.days.length;
    _tabController = TabController(length: length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.template.days.isEmpty) {
      return Scaffold(
        backgroundColor: const Color(0xFF1C1C1E),
        appBar: AppBar(
           backgroundColor: const Color(0xFF1C1C1E),
           elevation: 0,
           leading: IconButton(
             icon: const Icon(Icons.arrow_back, color: Colors.white),
             onPressed: () => Navigator.pop(context),
           ),
           title: Text(widget.template.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
           centerTitle: true,
        ),
        body: const Center(child: Text('Esta rutina no tiene días configurados.', style: TextStyle(color: Colors.white))),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E), // Dark theme from mockup
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.template.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.white),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          isScrollable: true,
          tabs: widget.template.days.map((day) => Tab(text: day.name)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: widget.template.days.map((day) => _buildWorkoutDayView(day)).toList(),
      ),
    );
  }

  Widget _buildWorkoutDayView(WorkoutDayModel day) {
    final repo = ref.watch(trainingRepositoryProvider);
    final allExercises = repo.getExercises();
    final allMuscles = repo.getMuscleGroups();

    // Map the configs to actual exercises
    final dayExercises = day.exercises.map((conf) {
       return allExercises.firstWhere((e) => e.id == conf.exerciseId, orElse: () => _placeholderExercise(conf.exerciseId));
    }).toList();

    // Muscle target summary
    final Map<String, int> muscleExerciseCounts = {};
    for (var ex in dayExercises) {
       for (var muscleId in ex.primaryMuscles) {
           final m = allMuscles.firstWhere((m) => m.id == muscleId, orElse: () => _placeholderMuscle(muscleId));
           muscleExerciseCounts[m.name] = (muscleExerciseCounts[m.name] ?? 0) + 1;
       }
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               Expanded(
                 child: ElevatedButton.icon(
                   onPressed: () {
                     // Start Workout Player
                     Navigator.push(context, MaterialPageRoute(builder: (_) => WorkoutPlayerScreen(
                         routineId: widget.template.id,
                         routineName: '${widget.template.name} - ${day.name}',
                         day: day,
                         exercisesDetails: dayExercises,
                     )));
                   },
                   icon: const Icon(Icons.play_arrow),
                   label: const Text('Comenzar Rutina'),
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.blue,
                     foregroundColor: Colors.white,
                     padding: const EdgeInsets.symmetric(vertical: 12),
                   ),
                 ),
               ),
            ],
          ),
          const SizedBox(height: 24),
          const Text('Músculos Objetivo', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          if (muscleExerciseCounts.isEmpty)
             const Text('No hay información de músculos.', style: TextStyle(color: Colors.grey)),
          if (muscleExerciseCounts.isNotEmpty)
             SizedBox(
               height: 80,
               child: ListView(
                 scrollDirection: Axis.horizontal,
                 children: muscleExerciseCounts.entries.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: _buildMuscleSummaryCard(e.key, e.value),
                    );
                 }).toList(),
               ),
             ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${day.exercises.length} Ejercicios', style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: const Text('Editar', style: TextStyle(color: Colors.grey, decoration: TextDecoration.underline))),
            ],
          ),
          const SizedBox(height: 16),
          if (day.exercises.isEmpty)
             const Text('No has agregado ejercicios a este día.', style: TextStyle(color: Colors.grey)),
          ...day.exercises.asMap().entries.map((entry) {
             final idx = entry.key;
             final conf = entry.value;
             final ex = dayExercises[idx];
             
             final muscleNames = ex.primaryMuscles.map((id) {
                 return allMuscles.firstWhere((m) => m.id == id, orElse: () => _placeholderMuscle(id)).name;
             }).toList();

             return Padding(
               padding: const EdgeInsets.only(bottom: 16.0),
               child: _buildExerciseCard(ex.name, muscleNames, conf.sets),
             );
          }).toList(),
        ],
      ),
    );
  }

  ExerciseModel _placeholderExercise(String id) => ExerciseModel(id: id, name: 'Desconocido', sportId: '', primaryMuscles: [], secondaryMuscles: [], trainingTypes: []);
  MuscleGroupModel _placeholderMuscle(String id) => MuscleGroupModel(id: id, name: id, isFront: true);

  Widget _buildMuscleSummaryCard(String name, int exercisesConfigured) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: Row(
        children: [
           Container(width: 50, color: Colors.grey.shade800, child: const Icon(Icons.accessibility, color: Colors.grey)), 
           const SizedBox(width: 12),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis),
                 const SizedBox(height: 2),
                 Text('$exercisesConfigured ejercicios', style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
               ],
             ),
           ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(String name, List<String> muscleTags, List sets) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
           children: [
             Container(
               width: 50,
               height: 50,
               decoration: BoxDecoration(color: Colors.grey.shade800, borderRadius: BorderRadius.circular(8)),
               child: const Icon(Icons.fitness_center, color: Colors.grey),
             ),
             const SizedBox(width: 12),
             Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(name, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                   const SizedBox(height: 8),
                   Wrap(
                     spacing: 6,
                     children: muscleTags.map((tag) => _buildMuscleTag(tag)).toList(),
                   ),
                 ],
               ),
             ),
             IconButton(icon: const Icon(Icons.more_vert, color: Colors.grey), onPressed: () {}),
           ],
         ),
         const SizedBox(height: 12),
         Container(
           padding: const EdgeInsets.all(12),
           decoration: BoxDecoration(
             color: Colors.grey.shade900,
             borderRadius: BorderRadius.circular(12),
             border: Border.all(color: Colors.grey.shade800),
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               const Text('Configuración de series', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
               const SizedBox(height: 8),
               ...sets.asMap().entries.map((e) {
                 final i = e.key;
                 final s = e.value;
                 return Padding(
                   padding: const EdgeInsets.only(bottom: 4.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('Set ${i+1}', style: TextStyle(color: Colors.grey.shade300, fontSize: 13)),
                       Text('${s.targetReps} reps', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                       Container(
                         padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                         decoration: BoxDecoration(
                           color: Colors.amber,
                           borderRadius: BorderRadius.circular(12),
                         ),
                         child: Text('RIR ${s.targetRir}', style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold)),
                       )
                     ],
                   ),
                 );
               }).toList(),
             ],
           ),
         ),
      ],
    );
  }

  Widget _buildMuscleTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label, style: const TextStyle(fontSize: 11, color: Colors.white)),
    );
  }
}
