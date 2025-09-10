import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get a stream of exercises for a specific user
  Stream<QuerySnapshot> getExercises(String userId) {
    return _db.collection('users').doc(userId).collection('exercises').snapshots();
  }

  // Add a new exercise for a specific user
  Future<void> addExercise(String userId, String name, String category) {
    return _db.collection('users').doc(userId).collection('exercises').add({
      'name': name,
      'category': category,
    });
  }

  // Update an existing exercise for a specific user
  Future<void> updateExercise(String userId, String exerciseId, String name, String category) {
    return _db.collection('users').doc(userId).collection('exercises').doc(exerciseId).update({
      'name': name,
      'category': category,
    });
  }

  // Delete an exercise for a specific user
  Future<void> deleteExercise(String userId, String exerciseId) {
    return _db.collection('users').doc(userId).collection('exercises').doc(exerciseId).delete();
  }
}
