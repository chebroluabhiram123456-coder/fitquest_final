import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app_shell.dart'; // We will create this next

void main() async {
  // Ensure that Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitQuest',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF6A1B9A), // A deep purple
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF8E44AD),
          secondary: Color(0xFF9B59B6),
          background: Color(0xFF1E1E1E),
          surface: Color(0xFF1E1E1E),
        ),
        fontFamily: 'Inter', // A clean, modern font
      ),
      home: const AppShell(),
    );
  }
}
