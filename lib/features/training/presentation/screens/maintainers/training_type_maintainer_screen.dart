import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../models/training_type_model.dart';
import '../../../models/sport_model.dart';
import '../../../repositories/training_repository.dart';

class TrainingTypeMaintainerScreen extends ConsumerStatefulWidget {
  const TrainingTypeMaintainerScreen({super.key});

  @override
  ConsumerState<TrainingTypeMaintainerScreen> createState() => _TrainingTypeMaintainerScreenState();
}

class _TrainingTypeMaintainerScreenState extends ConsumerState<TrainingTypeMaintainerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  String? _selectedSportId;
  
  List<TrainingTypeModel> _types = [];
  List<SportModel> _sports = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    final repo = ref.read(trainingRepositoryProvider);
    setState(() {
      _types = repo.getTrainingTypes();
      _sports = repo.getSports();
      if (_sports.isNotEmpty && _selectedSportId == null) {
        _selectedSportId = _sports.first.id;
      }
    });
  }

  Future<void> _saveType() async {
    if (_formKey.currentState!.validate() && _selectedSportId != null) {
      final repo = ref.read(trainingRepositoryProvider);
      final type = TrainingTypeModel(
        id: const Uuid().v4(),
        sportId: _selectedSportId!,
        name: _nameController.text,
        description: _descController.text,
      );
      await repo.saveTrainingType(type);
      _nameController.clear();
      _descController.clear();
      _loadData();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tipo de entrenamiento guardado')),
        );
      }
    }
  }

  Future<void> _deleteType(String id) async {
    final repo = ref.read(trainingRepositoryProvider);
    await repo.deleteTrainingType(id);
    _loadData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos de Entrenamiento'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                   if (_sports.isEmpty)
                    const Text('Por favor crea un Deporte primero', style: TextStyle(color: Colors.red))
                  else
                    DropdownButtonFormField<String>(
                      value: _selectedSportId,
                      decoration: const InputDecoration(
                        labelText: 'Deporte',
                        border: OutlineInputBorder(),
                      ),
                      items: _sports.map((s) {
                        return DropdownMenuItem(
                          value: s.id,
                          child: Text(s.name),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedSportId = val;
                        });
                      },
                      validator: (v) => v == null ? 'Requerido' : null,
                    ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nombre (Ej. Upper, Push, Piernas)',
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) => v!.isEmpty ? 'Requerido' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descController,
                    decoration: const InputDecoration(
                      labelText: 'Descripción (Opcional)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _sports.isEmpty ? null : _saveType,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text('Guardar'),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: _types.length,
              itemBuilder: (context, index) {
                final type = _types[index];
                final sportName = _sports.firstWhere((s) => s.id == type.sportId, orElse: () => const SportModel(id: '', name: 'Desconocido')).name;
                return ListTile(
                  title: Text(type.name),
                  subtitle: Text('Deporte: $sportName'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteType(type.id),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
