import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../data/models/habit_model.dart';

final habitBoxProvider = Provider<Box<HabitModel>>((ref) {
  return Hive.box<HabitModel>('habitsBox');
});

final habitListProvider =
    StateNotifierProvider<HabitNotifier, List<HabitModel>>((ref) {
      final box = ref.watch(habitBoxProvider);
      return HabitNotifier(box);
    });

class HabitNotifier extends StateNotifier<List<HabitModel>> {
  final Box<HabitModel> box;

  HabitNotifier(this.box) : super(box.values.toList());

  void addHabit(HabitModel habit) {
    box.put(habit.id, habit);
    state = box.values.toList(); // refresh
  }

  void deleteHabit(String id) {
    box.delete(id);
    state = box.values.toList();
  }
}
