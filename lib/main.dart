import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'home.dart';

ThemeMode mode = ThemeMode.light;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        canvasColor: Colors.black38,
      ),
      themeMode: mode,
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 252, 252, 1.0),
        textTheme: const TextTheme(
          headline2: TextStyle(
              fontSize: 40, fontWeight: FontWeight.w900, color: Colors.black),
          headline3: TextStyle(
              fontSize: 40, fontWeight: FontWeight.w900, color: Colors.white),
          headline4: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          headline5: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: mode == ThemeMode.dark ? Colors.black : Colors.white,
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
