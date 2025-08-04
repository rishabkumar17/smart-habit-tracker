import 'package:flutter/material.dart';
import 'package:smart_habit_tracker/core/constants.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(StringConstant.dailyTracker)),
      body: Center(child: Text(StringConstant.calendarScreenPlaceHolder)),
    );
  }
}
