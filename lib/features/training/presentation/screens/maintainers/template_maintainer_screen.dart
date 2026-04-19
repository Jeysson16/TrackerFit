import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../models/workout_template_model.dart';
import '../../../models/workout_day_model.dart';
import '../../../models/sport_model.dart';
import '../../../repositories/training_repository.dart';

class TemplateMaintainerScreen extends ConsumerStatefulWidget {
  const TemplateMaintainerScreen({super.key});

  @override
  ConsumerState<TemplateMaintainerScreen> createState() => _TemplateMaintainerScreenState();
}

class _TemplateMaintainerScreenState extends ConsumerState<TemplateMaintainerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  String? _selectedSportId;
  
  List<WorkoutTemplateModel> _templates = [];
  List<SportModel> _sports = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    final repo = ref.read(trainingRepositoryProvider);
    setState(() {
      _templates = repo.getTemplates();
      _sports = repo.getSports();
      if (_sports.isNotEmpty && _selectedSportId == null) {
        _selectedSportId = _sports.first.id;
      }
    });
  }

  Future<void> _saveTemplate() async {
    if (_formKey.currentState!.validate() && _selectedSportId != null) {
      final repo = ref.read(trainingRepositoryProvider);
      
      // Default basic days structure for a new template
      final defaultDays = [
        WorkoutDayModel(id: const Uuid().v4(), name: 'Workout A'),
        WorkoutDayModel(id: const Uuid().v4(), name: 'Descanso', isRestDay: true),
        WorkoutDayModel(id: const Uuid().v4(), name: 'Workout B'),
      ];

      final template = WorkoutTemplateModel(
        id: const Uuid().v4(),
        sportId: _selectedSportId!,
        name: _nameController.text,
        description: _descController.text,
        days: defaultDays, 
      );
      
      await repo.saveTemplate(template);
      
      _nameController.clear();
      _descController.clear();
      _loadData();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Plantilla guardada')),
        );
      }
    }
  }

  Future<void> _deleteTemplate(String id) async {
    final repo = ref.read(trainingRepositoryProvider);
    await repo.deleteTemplate(id);
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plantillas de Rutina')),
      body: _sports.isEmpty ? const Center(child: Text('Crea un deporte primero')) 
      : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    value: _selectedSportId,
                    decoration: const InputDecoration(labelText: 'Deporte', border: OutlineInputBorder()),
                    items: _sports.map((s) => DropdownMenuItem(value: s.id, child: Text(s.name))).toList(),
                    onChanged: (val) {
                      setState(() {
                        _selectedSportId = val;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Nombre (Ej. Push/Pull/Legs)', border: OutlineInputBorder()),
                    validator: (v) => v!.isEmpty ? 'Requerido' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descController,
                    decoration: const InputDecoration(labelText: 'Descripción (Opcional)', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _saveTemplate,
                    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 48)),
                    child: const Text('Crear Plantilla Base'),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: _templates.length,
              itemBuilder: (context, index) {
                final temp = _templates[index];
                final sportName = _sports.firstWhere((s) => s.id == temp.sportId, orElse: () => const SportModel(id: '', name: 'Unk')).name;
                return ListTile(
                  title: Text(temp.name),
                  subtitle: Text('$sportName - ${temp.days.length} Días configurados'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTemplate(temp.id),
                  ),
                );
              },
            ),
          ),
        ],
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
