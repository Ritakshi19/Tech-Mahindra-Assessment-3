import 'package:fitness_tracker/Models/workout.dart';
import 'package:flutter/material.dart';
import 'package:fitness_tracker/widgets/summary_chart.dart';

class SummaryScreen extends StatelessWidget {
  final Map<String, int> summary;
  List<Workout> registeredWorkouts;

  SummaryScreen({
    super.key,
    required this.summary,
    required this.registeredWorkouts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Workout Summary',
          style: TextStyle(
            color: Color.fromARGB(255, 226, 66, 17),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child:
            registeredWorkouts.isEmpty
                ? Center(
                  child: Image.asset(
                    "assets/images/norecord.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
                : Container(
                  child: Column(
                    children: [
                      SummaryChart(summary: summary),
                      const SizedBox(height: 30),
                      ...summary.entries.map((entry) {
                        return Card(
                          shape: Border.all(
                            color: Color.fromARGB(255, 236, 83, 12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Row(
                              children: [
                                Text(
                                  entry.key,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 236, 83, 12),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  entry.value.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 236, 83, 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
      ),
    );
  }
}
