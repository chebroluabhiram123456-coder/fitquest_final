import 'package:flutter/material.dart';

// A simple class to hold the data for one day's plan
class WorkoutPlan {
  String day;
  String title;
  int exerciseCount;

  WorkoutPlan({required this.day, required this.title, this.exerciseCount = 0});
}

// The central "brain" that will manage the weekly plan
class WorkoutProvider with ChangeNotifier {
  final Map<String, WorkoutPlan> _weeklyPlan = {
    'Monday': WorkoutPlan(day: 'Monday', title: 'Chest & Biceps', exerciseCount: 1),
    'Tuesday': WorkoutPlan(day: 'Tuesday', title: 'Back & Triceps'),
    'Wednesday': WorkoutPlan(day: 'Wednesday', title: 'Legs & Shoulders'),
    'Thursday': WorkoutPlan(day: 'Thursday', title: 'Rest'),
    'Friday': WorkoutPlan(day: 'Friday', title: 'Chest & Back'),
    'Saturday': WorkoutPlan(day: 'Saturday', title: 'Rest'),
    'Sunday': WorkoutPlan(day: 'Sunday', title: 'Rest'),
  };

  // Allows other parts of the app to read the plan
  Map<String, WorkoutPlan> get weeklyPlan => _weeklyPlan;

  // Allows updating a day's plan and notifies listeners of the change
  void updateWorkoutTitle(String day, String newTitle) {
    if (_weeklyPlan.containsKey(day)) {
      _weeklyPlan[day]!.title = newTitle;
      // This is the magic line that tells the UI to rebuild
      notifyListeners();
    }
  }

  // Get the plan for a specific day
  WorkoutPlan? getPlanForDay(String day) {
    return _weeklyPlan[day];
  }
}
