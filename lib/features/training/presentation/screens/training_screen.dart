import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../../repositories/training_repository.dart';
import 'maintainers/sport_maintainer_screen.dart';
import 'maintainers/training_type_maintainer_screen.dart';
import 'maintainers/muscle_group_maintainer_screen.dart';
import 'maintainers/exercise_maintainer_screen.dart';
import 'maintainers/template_maintainer_screen.dart';
import 'workout_program_detail_screen.dart';
import '../../models/workout_template_model.dart';

class TrainingScreen extends ConsumerStatefulWidget {
  const TrainingScreen({super.key});

  @override
  ConsumerState<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends ConsumerState<TrainingScreen> {
  DateTime _selectedDate = DateTime.now();
  late List<DateTime> _weekDays;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es', null);
    _calculateWeekDays();
  }

  void _calculateWeekDays() {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    _weekDays = List.generate(7, (index) => monday.add(Duration(days: index)));
  }

  void _showAddMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Administrar Datos (Mantenedores)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ),
              ListTile(
                leading: const Icon(Icons.sports),
                title: const Text('Deportes'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SportMaintainerScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.fitness_center),
                title: const Text('Tipos de Entrenamiento'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const TrainingTypeMaintainerScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.accessibility_new),
                title: const Text('Grupos Musculares'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const MuscleGroupMaintainerScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.list_alt),
                title: const Text('Ejercicios'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ExerciseMaintainerScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text('Plantillas de Rutinas'),
                onTap: () {
                  Navigator.pop(context);
                  // Push and refresh when back
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const TemplateMaintainerScreen())).then((_) {
                    setState(() {});
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Escuchar el repositorio para obtener plantillas reales locales
    final repo = ref.watch(trainingRepositoryProvider);
    final templates = repo.getTemplates();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Entrenamiento', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.calendar_today, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: _showAddMenu, // Menú real para navegar a los mantenedores
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWeeklyStrip(),
            const SizedBox(height: 16),
            if (templates.isNotEmpty) _buildActiveProgramSection(templates.first),
            const SizedBox(height: 16),
            _buildWorkoutLibrarySection(templates),
            const SizedBox(height: 24),
            _buildMoreSection(),
            const SizedBox(height: 48), 
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyStrip() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _weekDays.map((date) {
          final isSelected = date.day == _selectedDate.day && date.month == _selectedDate.month;
          final isToday = date.day == DateTime.now().day && date.month == DateTime.now().month;
          final dayName = DateFormat.E('es').format(date).substring(0, 1).toUpperCase();

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = date;
              });
            },
            child: Column(
              children: [
                Text(
                  dayName,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: isSelected ? Border.all(color: Colors.black, width: 2) : Border.all(color: Colors.grey.shade300),
                  ),
                  child: Center(
                    child: Text(
                      '${date.day}',
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.grey.shade800,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                if (isToday)
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  )
                else
                  const SizedBox(height: 4),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildActiveProgramSection(WorkoutTemplateModel activeTemplate) {
    final daysCount = activeTemplate.days.length;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Programa Activo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Semana 1', style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => WorkoutProgramDetailScreen(template: activeTemplate)));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))
                ],
              ),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.star, color: Colors.red),
                ),
                title: Text(activeTemplate.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('$daysCount días de entrenamiento', style: TextStyle(color: Colors.grey.shade600)),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutLibrarySection(List<WorkoutTemplateModel> templates) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Biblioteca de Rutinas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          if (templates.isEmpty)
             const Padding(
               padding: EdgeInsets.symmetric(vertical: 16.0),
               child: Text('No has creado ninguna rutina aún. Toca el botón "+" arriba para crear una.'),
             ),
          ...templates.map((template) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => WorkoutProgramDetailScreen(template: template)));
                },
                child: Container(
                   padding: const EdgeInsets.all(16),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(12),
                     boxShadow: [
                       BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))
                     ],
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(template.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                           const Icon(Icons.chevron_right, color: Colors.grey),
                         ],
                       ),
                       const SizedBox(height: 4),
                       Text(
                         (template.description?.isNotEmpty ?? false) ? template.description! : 'Sin descripción',
                         style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                       ),
                       const SizedBox(height: 12),
                       Wrap(
                         spacing: 6,
                         children: template.days.map<Widget>((day) => _buildDayTag(day.name)).toList(),
                       ),
                     ],
                   ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildDayTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.grey.shade800)),
    );
  }

  Widget _buildMoreSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Más', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                 BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))
              ],
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.history, color: Colors.black54),
                  title: const Text('Historial de Entrenamientos', style: TextStyle(fontWeight: FontWeight.w500)),
                  trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                  onTap: () {
                    // Navigate to stats or history
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
