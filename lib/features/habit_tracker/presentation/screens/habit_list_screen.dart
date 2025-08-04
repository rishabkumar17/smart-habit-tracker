import 'package:flutter/material.dart';
import 'package:smart_habit_tracker/core/constants.dart';

class HabitListScreen extends StatelessWidget {
  const HabitListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(StringConstant.habitList)),
      body: Center(child: Text(StringConstant.habitListPlaceholder)),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, RouteConstant.addEditScreen),
        child: const Icon(Icons.add),
      ),
    );
  }
}
