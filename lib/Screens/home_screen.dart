import 'package:fitness_tracker/Models/workout.dart';
import 'package:fitness_tracker/Screens/bmi_screen.dart';
import 'package:fitness_tracker/Screens/summary_screen.dart';
import 'package:fitness_tracker/Widgets/add_workout_dialog.dart';
import 'package:fitness_tracker/Widgets/workout_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Workout> registeredWorkouts = [
    // Workout(
    //   date: DateTime.now(),
    //   duration: 20,
    //   title: "Jumping jacks",
    //   workoutCategory: WorkoutCategory.cardio,
    // ),
  ];

  //Adding workout in the list of workouts
  void addWorkout(Workout workout) {
    setState(() {
      registeredWorkouts.add(workout);
    });
  }

  Map<String, int> getWorkoutSummary() {
    Map<String, int> summary = {
      'Cardio': 0,
      'Strength': 0,
      'Yoga': 0,
      'Other': 0,
    };

    for (var workout in registeredWorkouts) {
      if (summary.containsKey(workout.getCategoryName())) {
        summary[workout.getCategoryName()] =
            summary[workout.getCategoryName()]! + 1;
      }
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fitness Tracker',
          style: TextStyle(
            color: Color.fromARGB(255, 226, 66, 17),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            tooltip: "Summary Report",
            icon: const Icon(
              Icons.show_chart,
              color: Color.fromARGB(255, 226, 66, 17),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => SummaryScreen(summary: getWorkoutSummary(), registeredWorkouts: registeredWorkouts,),
                ),
              );
            },
          ),
          IconButton(
            tooltip: "BMI Calculator",
            icon: const Icon(
              Icons.calculate,
              color: Color.fromARGB(255, 226, 66, 17),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BmiScreen()),
              );
            },
          ),
        ],
      ),
      body:Container(color: Colors.white ,
      
      child:
          //if there are no workouts to show then use image
          registeredWorkouts.isEmpty
              ? Center(
                child: Image.asset(
                  "assets/images/norecord.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
              //if there are workouts to appear then use list to show the workouts
              : ListView.builder(
                itemCount: registeredWorkouts.length,
                itemBuilder: (context, index) {
                  return WorkoutCard(workout: registeredWorkouts[index]);
                },
              )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 2, 95, 171),
        foregroundColor: Colors.white,
        elevation: 10,
        tooltip: "Add a new Workout",
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (context) => AddWorkoutDialog(
                  onAddNewWorkout: (newWorkout) {
                    addWorkout(newWorkout);
                  },
                ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
