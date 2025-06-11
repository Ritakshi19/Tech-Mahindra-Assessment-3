import 'package:flutter/material.dart';
import 'package:fitness_tracker/widgets/summary_chart.dart';

class SummaryScreen extends StatelessWidget {
  final Map<String, int> summary;

  const SummaryScreen({super.key, required this.summary});

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Workouts by Category',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 200, 2, 48),
              ),
            ),
            const SizedBox(height: 20),
            SummaryChart(summary: summary),
            const SizedBox(height: 30),
            ...summary.entries.map((entry) {
              return Card(
                shape: Border.all(color: Color.fromARGB(255, 226, 66, 17)),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      Text(
                        entry.key,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 226, 66, 17),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        entry.value.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 226, 66, 17),
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
    );
  }
}
