import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:smart_habit_tracker/core/constants.dart';
import 'package:smart_habit_tracker/features/habit_tracker/data/models/habit_model.dart';

import 'core/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  /// Needs to go into DIs
  Hive.registerAdapter(HabitModelAdapter());
  await Hive.openBox<HabitModel>('habitsBox');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstant.appTitle,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: RouteConstant.homeScreen,
    );
  }
}
