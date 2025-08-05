import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_habit_tracker/core/constants.dart';

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
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'edit') {
                        Navigator.pushNamed(
                          context,
                          RouteConstant.addEditScreen,
                          arguments: habit,
                        );
                      } else if (value == 'delete') {
                        ref
                            .read(habitListProvider.notifier)
                            .deleteHabit(habit.id);
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(value: 'edit', child: Text('Edit')),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
