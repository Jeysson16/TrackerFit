import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TrainingCalendar extends StatefulWidget {
  final Map<DateTime, List<dynamic>> events; // Map of date to events (workouts)
  final Function(DateTime) onDaySelected;

  const TrainingCalendar({
    super.key,
    required this.events,
    required this.onDaySelected,
  });

  @override
  State<TrainingCalendar> createState() => _TrainingCalendarState();
}

class _TrainingCalendarState extends State<TrainingCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TableCalendar(
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            widget.onDaySelected(selectedDay);
          },
          calendarStyle: const CalendarStyle(
            markerDecoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: Colors.black26,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
          eventLoader: (day) {
            // Find events for this day (ignoring time)
            final normalizedDay = DateTime(day.year, day.month, day.day);
            return widget.events[normalizedDay] ?? [];
          },
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, day, events) {
              if (events.isEmpty) return null;

              // Custom logic for dot color based on completion
              // Assuming events is a list of WorkoutSession objects or statuses
              // For simplicity, we just check count
              Color dotColor = Colors.green; // Default completed

              // If we had more logic:
              // if (missed) dotColor = Colors.red;
              // if (rest) dotColor = Colors.yellow;

              return Positioned(
                bottom: 1,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
