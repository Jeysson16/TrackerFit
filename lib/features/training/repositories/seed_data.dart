import 'package:uuid/uuid.dart';
import '../models/sport_model.dart';
import '../models/training_type_model.dart';
import '../models/muscle_group_model.dart';
import '../models/exercise_model.dart';
import '../models/workout_template_model.dart';
import '../models/workout_day_model.dart';
import 'training_repository.dart';

Future<void> seedKarateGymHybridPlan(TrainingRepository repo) async {
  // Check if data already exists
  if (repo.getSports().isNotEmpty) return;

  const uuid = Uuid();

  // 1. SPORTS
  final gymId = uuid.v4();
  final karateId = uuid.v4();
  final officeId = uuid.v4();

  final sports = [
    SportModel(id: gymId, name: 'Gimnasio', iconName: 'fitness_center', description: 'Potencia y fuerza funcional.'),
    SportModel(id: karateId, name: 'Karate', iconName: 'sports_martial_arts', description: 'Velocidad, Kime y desplamientos.'),
    SportModel(id: officeId, name: 'Oficina Invisible', iconName: 'work', description: 'Descompresión y movilidad.'),
  ];
  for (final s in sports) {
    await repo.saveSport(s);
  }

  // 2. TRAINING TYPES
  final gymTypeId = uuid.v4();
  final karateTypeId = uuid.v4();
  final officeTypeId = uuid.v4();

  await repo.saveTrainingType(TrainingTypeModel(id: gymTypeId, sportId: gymId, name: 'Hipertrofia Funcional', description: 'Potencia y metabolismo'));
  await repo.saveTrainingType(TrainingTypeModel(id: karateTypeId, sportId: karateId, name: 'Kihon & Kumite', description: 'Velocidad y técnica'));
  await repo.saveTrainingType(TrainingTypeModel(id: officeTypeId, sportId: officeId, name: 'Descompresión Funcional', description: 'Estiramiento de la columna'));

  // 3. MUSCLE GROUPS
  final muscles = ['Piernas', 'Pectorales', 'Espalda', 'Hombros', 'Core', 'Varios'];
  final muscleIds = <String, String>{};
  for (final m in muscles) {
    final id = uuid.v4();
    muscleIds[m] = id;
    await repo.saveMuscleGroup(MuscleGroupModel(id: id, name: m));
  }

  // 4. EXERCISES
  // Helper to create exercises
  ExerciseModel createEx(String id, String sportId, String name, String muscle) {
    return ExerciseModel(id: id, sportId: sportId, name: name, primaryMuscles: [muscleIds[muscle] ?? muscleIds['Varios']!]);
  }

  // GYM EXERCISES
  final eSentadilla = createEx(uuid.v4(), gymId, 'Sentadilla Pesada', 'Piernas');
  final eHipThrust = createEx(uuid.v4(), gymId, 'Hip Thrust', 'Piernas');
  final ePrensa = createEx(uuid.v4(), gymId, 'Prensa y Aductores', 'Piernas');
  final ePushups = createEx(uuid.v4(), gymId, 'Clapping Pushups', 'Pectorales');
  final ePressIncl = createEx(uuid.v4(), gymId, 'Press Inclinado', 'Pectorales');
  final eDominadas = createEx(uuid.v4(), gymId, 'Dominadas', 'Espalda');
  
  // KARATE EXERCISES
  final eKihon = createEx(uuid.v4(), karateId, 'Kihon de Potencia', 'Varios');
  final eDesplaza = createEx(uuid.v4(), karateId, 'Desplazamientos Rápidos', 'Piernas');
  final eKata = createEx(uuid.v4(), karateId, 'Kata / Kumite', 'Varios');

  // OFFICE EXERCISES
  final eDeadHang = createEx(uuid.v4(), officeId, 'Dead Hang', 'Espalda');
  final ePancake = createEx(uuid.v4(), officeId, 'Pancake en Silla', 'Piernas');
  final eWallSlides = createEx(uuid.v4(), officeId, 'Wall Slides', 'Espalda');

  final allExercises = [eSentadilla, eHipThrust, ePrensa, ePushups, ePressIncl, eDominadas, eKihon, eDesplaza, eKata, eDeadHang, ePancake, eWallSlides];
  for (final e in allExercises) {
    await repo.saveExercise(e);
  }

  // 5. WORKOUT TEMPLATES
  // Híbrido Elite Template
  final tHybridId = uuid.v4();
  final dGymA = WorkoutDayModel(
    id: uuid.v4(),
    name: 'Lunes: Lower Posterior',
    trainingTypeIds: [gymTypeId],
    exercises: [
      ExerciseConfigModel(exerciseId: eSentadilla.id, orderIndex: 0, sets: [
        const SetConfigModel(setOrder: 1, targetRepsMin: 5, targetRepsMax: 5, restSeconds: 180),
        const SetConfigModel(setOrder: 2, targetRepsMin: 5, targetRepsMax: 5, restSeconds: 180),
        const SetConfigModel(setOrder: 3, targetRepsMin: 5, targetRepsMax: 5, restSeconds: 180),
      ]),
      ExerciseConfigModel(exerciseId: eHipThrust.id, orderIndex: 1, sets: [
        const SetConfigModel(setOrder: 1, targetRepsMin: 8, targetRepsMax: 8, targetRir: 2),
        const SetConfigModel(setOrder: 2, targetRepsMin: 8, targetRepsMax: 8, targetRir: 2),
        const SetConfigModel(setOrder: 3, targetRepsMin: 8, targetRepsMax: 8, targetRir: 2),
      ]),
    ],
  );

  final dKarate = WorkoutDayModel(
    id: uuid.v4(),
    name: 'Karate Nocturno',
    trainingTypeIds: [karateTypeId],
    exercises: [
      ExerciseConfigModel(exerciseId: eKihon.id, orderIndex: 0, sets: [
        const SetConfigModel(setOrder: 1, durationSeconds: 1500, maxVelocity: 1.0), // 25 min
      ]),
      ExerciseConfigModel(exerciseId: eKata.id, orderIndex: 1, sets: [
        const SetConfigModel(setOrder: 1, durationSeconds: 2400), // 40 min
      ]),
    ],
  );

  final dOffice = WorkoutDayModel(
    id: uuid.v4(),
    name: 'Rutina Invisible',
    trainingTypeIds: [officeTypeId],
    exercises: [
      ExerciseConfigModel(exerciseId: eDeadHang.id, orderIndex: 0, sets: [
        const SetConfigModel(setOrder: 1, durationSeconds: 45),
        const SetConfigModel(setOrder: 2, durationSeconds: 45),
        const SetConfigModel(setOrder: 3, durationSeconds: 45),
      ]),
      ExerciseConfigModel(exerciseId: eWallSlides.id, orderIndex: 1, sets: [
        const SetConfigModel(setOrder: 1, targetRepsMin: 15, targetRepsMax: 15),
        const SetConfigModel(setOrder: 2, targetRepsMin: 15, targetRepsMax: 15),
      ]),
    ],
  );

  final tHybrid = WorkoutTemplateModel(
    id: tHybridId,
    name: 'Plan Híbrido: VBT + Karate',
    description: 'Rutina maestra del usuario. Diseñada para transferir fuerza a velocidad sin sacrificar hipertrofia.',
    sportId: gymId,
    days: [dGymA, dKarate, dOffice],
  );

  await repo.saveTemplate(tHybrid);
}
