import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'main.dart';

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

  Color get condtionccolor {
    late Color condition;
    if (bmi == 'Obese')
      condition = Color.fromRGBO(122, 0, 0, 1.0);
    else if (bmi == 'Overweight')
      condition = Colors.red;
    else if (bmi == 'Normal')
      condition = Colors.green;
    else
      condition = Colors.yellow;
    return condition;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result',
          style: TextStyle(
              color: mode == ThemeMode.dark ? Colors.black : Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          color: mode == ThemeMode.light
              ? Color.fromRGBO(255, 252, 252, 1.0)
              : Color.fromRGBO(0, 4, 55, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularPercentIndicator(
                radius: 100,
                lineWidth: 20,
                percent: result / 100,
                center: Text(
                  result.toStringAsFixed(1),
                  style: TextStyle(
                      color: condtionccolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                animation: true,
                progressColor: condtionccolor,
                animationDuration: 2000,
                backgroundColor: Colors.orangeAccent,
              ),
              Column(
                children: [
                  Text(
                    'Condition',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: mode == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '$bmi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: condtionccolor,
                        fontSize: 40,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
