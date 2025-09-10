import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get a stream of all exercises
  Stream<QuerySnapshot> getExercises() {
    return _db.collection('exercises').snapshots();
  }

  // Add a new exercise
  Future<void> addExercise(String name, String category) {
    return _db.collection('exercises').add({
      'name': name,
      'category': category,
    });
  }

  // Update an existing exercise
  Future<void> updateExercise(String id, String name, String category) {
    return _db.collection('exercises').doc(id).update({
      'name': name,
      'category': category,
    });
  }

  // Delete an exercise
  Future<void> deleteExercise(String id) {
    return _db.collection('exercises').doc(id).delete();
  }
}
