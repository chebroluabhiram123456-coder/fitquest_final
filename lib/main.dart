import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'app_shell.dart';
import 'providers/workout_provider.dart'; // Import the provider

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  // Wrap the app with the provider
  runApp(
    ChangeNotifierProvider(
      create: (context) => WorkoutProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitQuest',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF6A1B9A),
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF8E44AD),
          secondary: Color(0xFF9B59B6),
          background: Color(0xFF1E1E1E),
          surface: Color(0xFF1E1E1E),
        ),
        fontFamily: 'Inter',
      ),
      home: const AppShell(),
    );
  }
}
