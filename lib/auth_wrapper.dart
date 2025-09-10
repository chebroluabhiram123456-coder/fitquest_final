import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'app_shell.dart';
import 'screens/auth_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    // If the user is logged in, show the main app.
    // Otherwise, show the authentication screen.
    if (user != null) {
      return const AppShell();
    } else {
      return const AuthScreen();
    }
  }
}
