import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'main.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();

  Home();
}

class _HomeState extends State<Home> {
  bool isMale = true;
  int age = 20;
  double weight = 63.0;
  double height = 182;

  Widget ganderIcon(String gander) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (gander == 'male') ? true : false;
          });
        },
        child: Container(
            decoration: BoxDecoration(
              color: (isMale && gander == 'male') ||
                      (!isMale && gander == 'female')
                  ? Colors.teal
                  : Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Icon(
                  (gander == 'male') ? Icons.male : Icons.female,
                  size: 100,
                  color: mode == ThemeMode.light ? Colors.white : Colors.black,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text((gander == 'male') ? 'Male' : 'Female',
                    style: TextStyle(
                        color: mode == ThemeMode.light
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
              ],
            )),
      ),
    );
  }

  Widget ageWeightIcon(String ageWeight) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text((ageWeight == 'age') ? 'Age' : 'Weight',
                style: TextStyle(
                    color:
                        mode == ThemeMode.light ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
            Text(
                (ageWeight == 'age')
                    ? age.toStringAsFixed(0)
                    : weight.toStringAsFixed(1),
                style: TextStyle(
                    color:
                        mode == ThemeMode.light ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => setState(
                      () => (ageWeight == 'age') ? age-- : weight -= 0.5),
                  mini: true,
                  backgroundColor: Colors.teal,
                  heroTag: (ageWeight == 'age')
                      ? 'decrement age'
                      : 'decrement weight',
                  child: const Icon(
                    Icons.remove,
                    size: 20,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () => setState(
                      () => (ageWeight == 'age') ? age++ : weight += 0.5),
                  mini: true,
                  backgroundColor: Colors.teal,
                  heroTag: (ageWeight == 'age')
                      ? 'increment age'
                      : 'increment weight',
                  child: const Icon(
                    Icons.add,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget slider() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Height',
              style: TextStyle(
                  color: mode == ThemeMode.light ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${height.toInt()}',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color:
                        mode == ThemeMode.light ? Colors.white : Colors.black),
              ),
              const SizedBox(
                width: 8,
              ),
              Text('cm',
                  style: TextStyle(
                      color:
                          mode == ThemeMode.light ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30)),
            ],
          ),
          Slider(
            label: 'Height',
            value: height,
            onChanged: (double val) => setState(() => height = val),
            min: 100,
            max: 200,
            divisions: 200,
            activeColor: Colors.teal,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var app = AppBar(
      title: Text(
        'Body Mass Index',
        style: TextStyle(
            color: mode == ThemeMode.light ? Colors.white : Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.teal,
      shadowColor: Colors.white,
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                if (mode == ThemeMode.dark)
                  mode = ThemeMode.light;
                else
                  mode = ThemeMode.dark;
              });
            },
            icon: Icon(mode == ThemeMode.dark
                ? Icons.sunny
                : Icons.nightlight_round_sharp))
      ],
    );

    return Scaffold(
      appBar: app,
      body: LayoutBuilder(builder: (context, constrains) {
        return Container(
          width: double.infinity,
          color: mode == ThemeMode.light
              ? Color.fromRGBO(255, 252, 252, 1.0)
              : Color.fromRGBO(0, 4, 55, 1),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        app.preferredSize.height) *
                    0.25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ganderIcon('male'),
                    const SizedBox(
                      width: 20,
                    ),
                    ganderIcon('female'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        app.preferredSize.height) *
                    0.25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ageWeightIcon('age'),
                    const SizedBox(
                      width: 20,
                    ),
                    ageWeightIcon('weight'),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          app.preferredSize.height) *
                      0.25,
                  child: slider()),
              Container(
                margin: EdgeInsets.all(10),
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        app.preferredSize.height) *
                    0.07,
                child: ElevatedButton(
                  onPressed: () {
                    double result = weight / pow(height / 100, 2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Result(age: age, isMale: isMale, result: result),
                      ),
                    );
                  },
                  child: Text('Calculate'),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 3,
                        vertical: MediaQuery.of(context).size.height / 50,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.teal),
                    foregroundColor: MaterialStateProperty.all(
                        mode == ThemeMode.light ? Colors.white : Colors.black),
                    textStyle: MaterialStateProperty.all(
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
