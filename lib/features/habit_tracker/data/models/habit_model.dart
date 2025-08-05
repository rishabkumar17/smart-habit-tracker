import 'package:hive/hive.dart';

part 'habit_model.g.dart';

@HiveType(typeId: 0)
class HabitModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String description;

  @HiveField(3)
  String recurrence; // 'Daily', 'Weekly', 'Custom'

  @HiveField(4)
  bool isArchived;

  HabitModel({
    required this.id,
    required this.name,
    required this.description,
    required this.recurrence,
    this.isArchived = false,
  });
}
