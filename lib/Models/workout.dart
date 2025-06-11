import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Categories for Workout
enum WorkoutCategory { cardio, strength, yoga, other }

final formatter = DateFormat().add_yMd();

class Workout {
  final String title;
  final int duration;
  final WorkoutCategory workoutCategory;
  final DateTime date;

  Workout({
    required this.date,
    required this.duration,
    required this.title,
    required this.workoutCategory,
  });

  String getFormattedDate() {
    return formatter.format(date);
  }

  //using icons based on the category
  getCategoryIcon() {
    if (workoutCategory == WorkoutCategory.cardio) {
      return Icons.directions_run;
    } else if (workoutCategory == WorkoutCategory.strength) {
      return Icons.fitness_center;
    } else if (workoutCategory == WorkoutCategory.yoga) {
      return Icons.self_improvement;
    } else {
      return Icons.report;
    }
  }

  getCategoryName() {
    if (workoutCategory == WorkoutCategory.cardio) {
      return "Cardio";
    } else if (workoutCategory == WorkoutCategory.strength) {
      return "Strength";
    } else if (workoutCategory == WorkoutCategory.yoga) {
      return "Yoga";
    } else {
      return "Other";
    }
  }
}
