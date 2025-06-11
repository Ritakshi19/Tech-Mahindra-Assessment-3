import 'package:fitness_tracker/Models/workout.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget{
  final Workout workout;
  WorkoutCard({super.key,
    required this.workout
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color:  Color.fromARGB(255, 236, 83, 12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(workout.getCategoryIcon(),size: 30, color: Colors.white,),
                const SizedBox(width: 10),
                Text(
                  workout.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(children:[
            Text('Category: ${workout.getCategoryName()}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white)),
            Spacer(),
            Text('Duration: ${workout.duration} minutes',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white)),
            ]),
            Text(
              'Date: ${workout.date.day}/${workout.date.month}/${workout.date.year}',
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white)
            ),
          ],
        ),
      ),
    );
  }
}