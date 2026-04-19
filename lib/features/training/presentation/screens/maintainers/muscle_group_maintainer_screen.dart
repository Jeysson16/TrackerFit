import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../models/muscle_group_model.dart';
import '../../../repositories/training_repository.dart';

class MuscleGroupMaintainerScreen extends ConsumerStatefulWidget {
  const MuscleGroupMaintainerScreen({super.key});

  @override
  ConsumerState<MuscleGroupMaintainerScreen> createState() => _MuscleGroupMaintainerScreenState();
}

class _MuscleGroupMaintainerScreenState extends ConsumerState<MuscleGroupMaintainerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  bool _isFront = true;
  
  List<MuscleGroupModel> _groups = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    final repo = ref.read(trainingRepositoryProvider);
    setState(() {
      _groups = repo.getMuscleGroups();
    });
  }

  Future<void> _saveGroup() async {
    if (_formKey.currentState!.validate()) {
      final repo = ref.read(trainingRepositoryProvider);
      final group = MuscleGroupModel(
        id: const Uuid().v4(),
        name: _nameController.text,
        isFront: _isFront,
      );
      await repo.saveMuscleGroup(group);
      _nameController.clear();
      setState(() => _isFront = true);
      _loadData();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Grupo Muscular guardado')),
        );
      }
    }
  }

  Future<void> _deleteGroup(String id) async {
    final repo = ref.read(trainingRepositoryProvider);
    await repo.deleteMuscleGroup(id);
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grupos Musculares')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nombre del Músculo (Ej. Pectorales)',
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) => v!.isEmpty ? 'Requerido' : null,
                  ),
                  const SizedBox(height: 16),
                  SwitchListTile(
                    title: const Text('¿Está en la parte Frontal del cuerpo?'),
                    value: _isFront,
                    onChanged: (val) => setState(() => _isFront = val),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _saveGroup,
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
              itemCount: _groups.length,
              itemBuilder: (context, index) {
                final g = _groups[index];
                return ListTile(
                  title: Text(g.name),
                  subtitle: Text(g.isFront ? 'Frontal' : 'Trasero'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteGroup(g.id),
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
    super.dispose();
  }
}
