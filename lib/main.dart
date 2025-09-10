import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'auth_wrapper.dart';
import 'providers/workout_provider.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provides the workout plan data
        ChangeNotifierProvider(
          create: (context) => WorkoutProvider(),
        ),
        // Provides the user's authentication state
        StreamProvider<User?>.value(
          value: AuthService().user,
          initialData: null,
        ),
      ],
      child: MaterialApp(
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
        // The AuthWrapper is now the entry point
        home: const AuthWrapper(),
      ),
    );
  }
}
