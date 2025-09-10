import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../services/firestore_service.dart';
import '../widgets/frosted_glass_card.dart';

class ExerciseLibraryScreen extends StatefulWidget {
  const ExerciseLibraryScreen({super.key});

  @override
  State<ExerciseLibraryScreen> createState() => _ExerciseLibraryScreenState();
}

class _ExerciseLibraryScreenState extends State<ExerciseLibraryScreen> {
  final FirestoreService _firestoreService = FirestoreService();

  void _showExerciseDialog({DocumentSnapshot? exercise, required String userId}) {
    final nameController = TextEditingController(text: exercise?['name']);
    final categoryController = TextEditingController(text: exercise?['category']);
    final isEditing = exercise != null;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          title: Text(isEditing ? 'Edit Exercise' : 'Add Exercise', style: const TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(labelText: 'Exercise Name', labelStyle: TextStyle(color: Colors.white70)),
              ),
              TextField(
                controller: categoryController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(labelText: 'Category (e.g., Chest)', labelStyle: TextStyle(color: Colors.white70)),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (isEditing) {
                  _firestoreService.updateExercise(userId, exercise.id, nameController.text, categoryController.text);
                } else {
                  _firestoreService.addExercise(userId, nameController.text, categoryController.text);
                }
                Navigator.pop(context);
              },
              child: Text(isEditing ? 'Update' : 'Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the current user from the provider
    final user = Provider.of<User?>(context);

    // If for some reason there's no user, show an error message
    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('Please log in to see your exercises.')),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent, 
      appBar: AppBar(
        title: const Text('Exercise Library'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        // Use the user's ID to fetch their specific exercises
        stream: _firestoreService.getExercises(user.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No exercises found. Add one!', style: TextStyle(color: Colors.white70)),
            );
          }

          final exercises = snapshot.data!.docs;
          final groupedExercises = <String, List<DocumentSnapshot>>{};
          for (var exercise in exercises) {
            final category = exercise['category'] as String? ?? 'Uncategorized';
            (groupedExercises[category] ??= []).add(exercise);
          }
          
          final sortedCategories = groupedExercises.keys.toList()..sort();

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: sortedCategories.map((category) {
              final categoryExercises = groupedExercises[category]!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      category,
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...categoryExercises.map((doc) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: FrostedGlassCard(
                        child: ListTile(
                          leading: const Icon(Icons.fitness_center, color: Colors.white),
                          title: Text(doc['name'], style: const TextStyle(color: Colors.white)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.white70),
                                onPressed: () => _showExerciseDialog(exercise: doc, userId: user.uid),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.redAccent),
                                onPressed: () => _firestoreService.deleteExercise(user.uid, doc.id),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                   const SizedBox(height: 16),
                ],
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showExerciseDialog(userId: user.uid),
        child: const Icon(Icons.add),
      ),
    );
  }
}
