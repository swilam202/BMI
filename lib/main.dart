import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'home.dart';

ThemeMode mode = ThemeMode.dark;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: mode,
      // darkTheme: ThemeData(
      //     canvasColor: Colors.black38,
      //     textTheme: TextTheme(
      //       headline4: TextStyle(
      //           fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
      //     )),
      // theme: ThemeData(
      //   canvasColor: mode == ThemeMode.light
      //       ? Color.fromRGBO(255, 252, 252, 1.0)
      //       : Colors.black38,
      //   textTheme: const TextTheme(
      //     headline5: TextStyle(
      //         fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
      //   ),
      //   iconTheme: IconThemeData(
      //     color: mode == ThemeMode.dark ? Colors.black : Colors.white,
      //     size: 30,
      //   ),
      // ),
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (context) => Home(),
        'result': (context) => Result(age: 22, isMale: true, result: 19.54558),
      },
      initialRoute: 'home',
    );
  }
}
