import 'package:flutter/material.dart';

class SummaryChart extends StatelessWidget {
  final Map<String, int> summary;

  const SummaryChart({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final maxValue = summary.values.reduce((a, b) => a > b ? a : b).toDouble();
    
    return SizedBox(
      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: summary.entries.map((entry) {
          final height = (entry.value / maxValue) * 180;
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: height,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: getCategoryColor(entry.key),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                
                Text(entry.key, style: TextStyle(color: getCategoryColor(entry.key),fontWeight: FontWeight.bold),),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Color getCategoryColor(String category) {
    switch (category) {
      case 'Cardio':
        return Colors.red;
      case 'Strength':
        return Colors.blue;
      case 'Yoga':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}