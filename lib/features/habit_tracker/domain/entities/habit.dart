import 'package:smart_habit_tracker/core/enums/habit_recurrence.dart';

class Habit {
  final String id;
  final String name;
  final String description;
  final HabitRecurrence recurrence;
  final bool isArchived;

  const Habit({
    required this.id,
    required this.name,
    required this.description,
    required this.recurrence,
    this.isArchived = false,
  });
}
