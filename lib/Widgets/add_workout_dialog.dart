import 'package:fitness_tracker/Models/workout.dart';
import 'package:flutter/material.dart';

class AddWorkoutDialog extends StatefulWidget {
  final void Function(Workout) onAddNewWorkout;
  AddWorkoutDialog({required this.onAddNewWorkout});

  @override
  State<AddWorkoutDialog> createState() => _AddWorkoutDialogState();
}

class _AddWorkoutDialogState extends State<AddWorkoutDialog> {
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController durationTextEditingController = TextEditingController();
  WorkoutCategory selectedCategory = WorkoutCategory.cardio;
  DateTime selectedDate = DateTime.now();

  presentDatePicker() async {
    DateTime firstDate = DateTime(2025, 1, 1);
    DateTime lastDate = DateTime(2025, 12, 31);

    final dateSelected = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      selectedDate = dateSelected!;
    });
  }

  saveNewWorkout() {
    Workout workout = Workout(
      title: titleTextEditingController.text,
      duration: int.parse(durationTextEditingController.text),
      workoutCategory: selectedCategory,
      date: selectedDate,
    );

    widget.onAddNewWorkout(workout);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: Colors.black,
      elevation: 15,
      child: Container(
        width: 350,
        height: 300,
        padding: EdgeInsets.all(20),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add New Workout",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(255, 226, 66, 17),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            TextField(
              maxLength: 50,
              controller: titleTextEditingController,
              decoration: InputDecoration(
                labelText: 'Workout Title',
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: durationTextEditingController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Duration (minutes)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(formatter.format(selectedDate).toString()),
                      IconButton(
                        onPressed: presentDatePicker,
                        icon: Icon(
                          Icons.calendar_month,
                          color: Color.fromARGB(255, 226, 66, 17),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButton(
                  value: selectedCategory,
                  items: [
                    DropdownMenuItem(
                      value: WorkoutCategory.cardio,
                      child: Text('Cardio'),
                    ),
                    DropdownMenuItem(
                      value: WorkoutCategory.strength,
                      child: Text('Strength'),
                    ),
                    DropdownMenuItem(
                      value: WorkoutCategory.yoga,
                      child: Text('Yoga'),
                    ),
                    DropdownMenuItem(
                      value: WorkoutCategory.other,
                      child: Text('Other'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 2, 95, 171),
                    foregroundColor: Colors.white,
                  ),

                  onPressed: saveNewWorkout,
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
