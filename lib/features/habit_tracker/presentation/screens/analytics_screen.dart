import 'package:flutter/material.dart';
import 'package:smart_habit_tracker/core/constants.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(StringConstant.progressAnalytics)),
      body: Center(child: Text(StringConstant.progressAnalyticsPlaceholder)),
    );
  }
}
