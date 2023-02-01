import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.black,
        textTheme: const TextTheme(
          headline3: TextStyle(
              fontSize: 40, fontWeight: FontWeight.w900, color: Colors.white),
          headline4: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (context) => Home(),
        'result': (context) => Result(age: 22, isMale: true, result: 19.54558),
      },
      initialRoute: 'home',
    );
  }
}
