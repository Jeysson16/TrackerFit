import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../models/sport_model.dart';
import '../../../repositories/training_repository.dart';

class SportMaintainerScreen extends ConsumerStatefulWidget {
  const SportMaintainerScreen({super.key});

  @override
  ConsumerState<SportMaintainerScreen> createState() => _SportMaintainerScreenState();
}

class _SportMaintainerScreenState extends ConsumerState<SportMaintainerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  
  List<SportModel> _sports = [];

  @override
  void initState() {
    super.initState();
    _loadSports();
  }

  void _loadSports() {
    final repo = ref.read(trainingRepositoryProvider);
    setState(() {
      _sports = repo.getSports();
    });
  }

  Future<void> _saveSport() async {
    if (_formKey.currentState!.validate()) {
      final repo = ref.read(trainingRepositoryProvider);
      final sport = SportModel(
        id: const Uuid().v4(),
        name: _nameController.text,
        description: _descController.text,
      );
      await repo.saveSport(sport);
      _nameController.clear();
      _descController.clear();
      _loadSports();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Deporte guardado con éxito')),
        );
      }
    }
  }

  Future<void> _deleteSport(String id) async {
    final repo = ref.read(trainingRepositoryProvider);
    await repo.deleteSport(id);
    _loadSports();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deportes'),
      ),
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
                      labelText: 'Nombre del Deporte',
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
                    onPressed: _saveSport,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text('Guardar Deporte'),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: _sports.length,
              itemBuilder: (context, index) {
                final sport = _sports[index];
                return ListTile(
                  title: Text(sport.name),
                  subtitle: sport.description != null ? Text(sport.description!) : null,
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteSport(sport.id),
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
