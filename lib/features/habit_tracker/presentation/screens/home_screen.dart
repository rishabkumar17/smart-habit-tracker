import 'package:flutter/material.dart';
import 'package:smart_habit_tracker/core/constants.dart';
import 'package:smart_habit_tracker/features/habit_tracker/presentation/screens/analytics_screen.dart';
import 'package:smart_habit_tracker/features/habit_tracker/presentation/screens/calendar_screen.dart';
import 'package:smart_habit_tracker/features/habit_tracker/presentation/screens/habit_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HabitListScreen(),
    CalendarScreen(),
    AnalyticsScreen(),
  ];

  final List<String> _titles = [
    StringConstant.habits,
    StringConstant.dailyTracker,
    StringConstant.progressAnalytics,
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        elevation: 2,
        centerTitle: true,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list_alt), label: 'Habits'),
          NavigationDestination(
            icon: Icon(Icons.calendar_today),
            label: 'Tracker',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart),
            label: 'Analytics',
          ),
        ],
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () =>
                  Navigator.pushNamed(context, RouteConstant.addEditScreen),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
