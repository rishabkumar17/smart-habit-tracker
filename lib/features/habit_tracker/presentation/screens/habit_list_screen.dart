import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/habit_provider.dart';

class HabitListScreen extends ConsumerWidget {
  const HabitListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitListProvider);

    return Scaffold(
      body: habits.isEmpty
          ? const Center(child: Text('No habits added yet'))
          : ListView.separated(
              itemCount: habits.length,
              separatorBuilder: (_, _) => const Divider(),
              itemBuilder: (context, index) {
                final habit = habits[index];
                return ListTile(
                  leading: const Icon(Icons.check_circle_outline),
                  title: Text(habit.name),
                  subtitle: Text(habit.recurrence),
                );
              },
            ),
    );
  }
}
