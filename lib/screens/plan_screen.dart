import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/workout_provider.dart';
import '../widgets/frosted_glass_card.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  void _showEditDialog(BuildContext context, String day, WorkoutProvider provider) {
    final titleController = TextEditingController(text: provider.weeklyPlan[day]!.title);
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          title: Text('Edit Plan for $day', style: const TextStyle(color: Colors.white)),
          content: TextField(
            controller: titleController,
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(labelText: 'Workout Title', labelStyle: TextStyle(color: Colors.white70)),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () {
                provider.updateWorkoutTitle(day, titleController.text);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Access the provider
    final workoutProvider = Provider.of<WorkoutProvider>(context);
    final plan = workoutProvider.weeklyPlan;
    final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Weekly Plan'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: days.length,
        itemBuilder: (context, index) {
          final day = days[index];
          final workout = plan[day]!;
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: FrostedGlassCard(
              child: ListTile(
                title: Text(day, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: Text(workout.title, style: const TextStyle(color: Colors.white70)),
                trailing: const Icon(Icons.edit, color: Colors.white),
                onTap: () => _showEditDialog(context, day, workoutProvider),
              ),
            ),
          );
        },
      ),
    );
  }
}
