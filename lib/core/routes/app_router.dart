import 'package:flutter/material.dart';
import 'package:smart_habit_tracker/core/constants.dart';
import 'package:smart_habit_tracker/features/habit_tracker/data/models/habit_model.dart';
import 'package:smart_habit_tracker/features/habit_tracker/presentation/screens/add_edit_habit_screen.dart';
import 'package:smart_habit_tracker/features/habit_tracker/presentation/screens/analytics_screen.dart';
import 'package:smart_habit_tracker/features/habit_tracker/presentation/screens/calendar_screen.dart';
import 'package:smart_habit_tracker/features/habit_tracker/presentation/screens/habit_list_screen.dart';
import 'package:smart_habit_tracker/features/habit_tracker/presentation/screens/home_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteConstant.habitListScreen:
        return MaterialPageRoute(builder: (_) => const HabitListScreen());
      case RouteConstant.addEditScreen:
        final habit = settings.arguments as HabitModel?;
        return MaterialPageRoute(
          builder: (_) => AddEditHabitScreen(habit: habit),
        );
      case RouteConstant.calendarScreen:
        return MaterialPageRoute(builder: (_) => const CalendarScreen());
      case RouteConstant.analyticsScreen:
        return MaterialPageRoute(builder: (_) => const AnalyticsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
