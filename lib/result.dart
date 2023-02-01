import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({required this.age, required this.isMale, required this.result});

  final bool isMale;
  final int age;
  final double result;

  String get bmi {
    String bmiTxt = '';
    if (result >= 30) {
      bmiTxt = 'Obese';
    } else if (result < 30 && result >= 25) {
      bmiTxt = 'Overweight';
    } else if (result < 25 && result >= 18.5) {
      bmiTxt = 'Normal';
    } else {
      bmiTxt = 'Underweight';
    }
    return bmiTxt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Age: $age',
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              'Result: ${result.toStringAsFixed(1)}',
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              'Gander ${isMale ? 'Male' : 'Female'}',
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              'Condition: $bmi',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
