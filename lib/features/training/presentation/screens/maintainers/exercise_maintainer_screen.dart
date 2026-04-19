import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../models/exercise_model.dart';
import '../../../models/sport_model.dart';
import '../../../models/muscle_group_model.dart';
import '../../../models/training_type_model.dart';
import '../../../repositories/training_repository.dart';

class ExerciseMaintainerScreen extends ConsumerStatefulWidget {
  const ExerciseMaintainerScreen({super.key});

  @override
  ConsumerState<ExerciseMaintainerScreen> createState() => _ExerciseMaintainerScreenState();
}

class _ExerciseMaintainerScreenState extends ConsumerState<ExerciseMaintainerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  String? _selectedSportId;
  
  Set<String> _selectedPrimaryMuscles = {};
  Set<String> _selectedSecondaryMuscles = {};
  Set<String> _selectedTrainingTypes = {};

  List<ExerciseModel> _exercises = [];
  List<SportModel> _sports = [];
  List<MuscleGroupModel> _muscles = [];
  List<TrainingTypeModel> _trainingTypes = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    final repo = ref.read(trainingRepositoryProvider);
    setState(() {
      _exercises = repo.getExercises();
      _sports = repo.getSports();
      _muscles = repo.getMuscleGroups();
      _trainingTypes = repo.getTrainingTypes();
      
      if (_sports.isNotEmpty && _selectedSportId == null) {
        _selectedSportId = _sports.first.id;
      }
    });
  }

  Future<void> _saveExercise() async {
    if (_formKey.currentState!.validate() && _selectedSportId != null) {
      if (_selectedPrimaryMuscles.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Seleccione al menos un músculo principal')));
        return;
      }
      
      final repo = ref.read(trainingRepositoryProvider);
      final exercise = ExerciseModel(
        id: const Uuid().v4(),
        name: _nameController.text,
        sportId: _selectedSportId!,
        description: _descController.text,
        primaryMuscles: _selectedPrimaryMuscles.toList(),
        secondaryMuscles: _selectedSecondaryMuscles.toList(),
        trainingTypes: _selectedTrainingTypes.toList(),
      );
      await repo.saveExercise(exercise);
      
      _nameController.clear();
      _descController.clear();
      setState(() {
        _selectedPrimaryMuscles.clear();
        _selectedSecondaryMuscles.clear();
        _selectedTrainingTypes.clear();
      });
      _loadData();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ejercicio guardado')),
        );
      }
    }
  }

  Future<void> _deleteExercise(String id) async {
    final repo = ref.read(trainingRepositoryProvider);
    await repo.deleteExercise(id);
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    final currentSportTypes = _trainingTypes.where((t) => t.sportId == _selectedSportId).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicios')),
      body: _sports.isEmpty ? const Center(child: Text('Crea un deporte primero')) 
      : SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<String>(
                      value: _selectedSportId,
                      decoration: const InputDecoration(labelText: 'Deporte', border: OutlineInputBorder()),
                      items: _sports.map((s) => DropdownMenuItem(value: s.id, child: Text(s.name))).toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedSportId = val;
                          _selectedTrainingTypes.clear(); // Reset types when sport changes
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Nombre del Ejercicio', border: OutlineInputBorder()),
                      validator: (v) => v!.isEmpty ? 'Requerido' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descController,
                      decoration: const InputDecoration(labelText: 'Descripción (Opcional)', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 24),
                    
                    const Text('Tipos de Entrenamiento:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Wrap(
                      spacing: 8,
                      children: currentSportTypes.map((t) {
                        return FilterChip(
                          label: Text(t.name),
                          selected: _selectedTrainingTypes.contains(t.id),
                          onSelected: (bool selected) {
                            setState(() {
                              if (selected) _selectedTrainingTypes.add(t.id);
                              else _selectedTrainingTypes.remove(t.id);
                            });
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),

                    const Text('Músculos Principales:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Wrap(
                      spacing: 8,
                      children: _muscles.map((m) {
                        return FilterChip(
                          label: Text(m.name),
                          selectedColor: Colors.blue.shade200,
                          selected: _selectedPrimaryMuscles.contains(m.id),
                          onSelected: (bool selected) {
                            setState(() {
                              if (selected) {
                                _selectedPrimaryMuscles.add(m.id);
                                _selectedSecondaryMuscles.remove(m.id); // Cannot be both
                              } else {
                                _selectedPrimaryMuscles.remove(m.id);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),

                    const Text('Músculos Secundarios:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Wrap(
                      spacing: 8,
                      children: _muscles.map((m) {
                        return FilterChip(
                          label: Text(m.name),
                          selectedColor: Colors.purple.shade200,
                          selected: _selectedSecondaryMuscles.contains(m.id),
                          onSelected: (bool selected) {
                            setState(() {
                              if (selected) {
                                if (!_selectedPrimaryMuscles.contains(m.id)) {
                                  _selectedSecondaryMuscles.add(m.id);
                                }
                              } else {
                                _selectedSecondaryMuscles.remove(m.id);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                    
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _saveExercise,
                      style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 48)),
                      child: const Text('Guardar Ejercicio'),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _exercises.length,
              itemBuilder: (context, index) {
                final ex = _exercises[index];
                final sportName = _sports.firstWhere((s) => s.id == ex.sportId, orElse: () => const SportModel(id: '', name: 'Unk')).name;
                return ListTile(
                  title: Text(ex.name),
                  subtitle: Text(sportName),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteExercise(ex.id),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }
}
