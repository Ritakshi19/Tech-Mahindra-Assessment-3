import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  TextEditingController weightEditingController = TextEditingController();
  TextEditingController heightEditingController = TextEditingController();
  double bmi = 0;
  String bmiStatus = "";

//Function for calculating BMI
  calculateBMIButton() {
    final weight = double.tryParse(weightEditingController.text) ?? 0;
    final height = double.tryParse(heightEditingController.text) ?? 1;

    if (weight > 0 && height > 0) {
      setState(() {
        bmi = weight / ((height / 100) * (height / 100));
        updateBMIStatus();
      });
    }
  }

//Function for updating the BMI Status according to the BMI value calculated
  updateBMIStatus() {
    if (bmi < 18.5) {
      bmiStatus = 'Underweight';
    } else if (bmi < 25) {
      bmiStatus = 'Normal';
    } else if (bmi < 30) {
      bmiStatus = 'Overweight';
    } else {
      bmiStatus = 'Obese';
    }
  }

  Color getStatusColor() {
    switch (bmiStatus) {
      case 'Underweight':
        return Colors.blue;
      case 'Normal':
        return Colors.green;
      case 'Overweight':
        return const Color.fromARGB(188, 237, 20, 172);
      case 'Obese':
        return const Color.fromARGB(255, 123, 9, 1);
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: Color.fromARGB(255, 226, 66, 17),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset("assets/images/bmi.png", height: 300, width: 300), //uploading image
            TextField(
              controller: weightEditingController,
              decoration: InputDecoration(
                labelText: "Weight (kg)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: heightEditingController,
              decoration: InputDecoration(
                labelText: "Height (cm)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 2, 95, 171),
                foregroundColor: Colors.white,
              ),
              onPressed: calculateBMIButton,
              child: Text("Calculate"),
            ),
            SizedBox(height: 20),
            if (bmi > 0)
              Column(
                children: [
                  Text(
                    "BMI: ${bmi.toString()}",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 226, 66, 17),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    bmiStatus,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: getStatusColor(),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
