import 'package:flutter/material.dart';
import '../widgets/frosted_glass_card.dart';
import 'exercise_library_screen.dart';
import 'workout_history_screen.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Hi User!',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 40),
              FrostedGlassCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExerciseLibraryScreen()),
                  );
                },
                child: const ListTile(
                  leading: Icon(Icons.fitness_center, color: Colors.white),
                  title: Text('Exercise Library', style: TextStyle(color: Colors.white)),
                  subtitle: Text('View all your exercises', style: TextStyle(color: Colors.white70)),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              FrostedGlassCard(
                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WorkoutHistoryScreen()),
                  );
                },
                child: const ListTile(
                  leading: Icon(Icons.history, color: Colors.white),
                  title: Text('Workout Log', style: TextStyle(color: Colors.white)),
                  subtitle: Text('See your past workouts', style: TextStyle(color: Colors.white70)),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              FrostedGlassCard(
                 onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsScreen()),
                  );
                },
                child: const ListTile(
                  leading: Icon(Icons.settings, color: Colors.white),
                  title: Text('Settings', style: TextStyle(color: Colors.white)),
                  subtitle: Text('App preferences', style: TextStyle(color: Colors.white70)),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
