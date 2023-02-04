import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'main.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
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
            color:
                (isMale && gander == 'male') || (!isMale && gander == 'female')
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
                color: mode == ThemeMode.dark ? Colors.black : Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              Text((gander == 'male') ? 'Male' : 'Female',
                  style: mode == ThemeMode.light
                      ? Theme.of(context).textTheme.headline5
                      : Theme.of(context).textTheme.headline4),
            ],
          ),
        ),
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
                style: mode == ThemeMode.light
                    ? Theme.of(context).textTheme.headline5
                    : Theme.of(context).textTheme.headline4),
            Text(
                (ageWeight == 'age')
                    ? age.toStringAsFixed(0)
                    : weight.toStringAsFixed(1),
                style: mode == ThemeMode.light
                    ? Theme.of(context).textTheme.headline3
                    : Theme.of(context).textTheme.headline2),
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
              style: mode == ThemeMode.light
                  ? Theme.of(context).textTheme.headline5
                  : Theme.of(context).textTheme.headline4),
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
                  style: mode == ThemeMode.light
                      ? Theme.of(context).textTheme.headline5
                      : Theme.of(context).textTheme.headline4),
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
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ganderIcon('male'),
                const SizedBox(
                  width: 20,
                ),
                ganderIcon('female'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ageWeightIcon('age'),
                const SizedBox(
                  width: 20,
                ),
                ageWeightIcon('weight'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            slider(),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
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
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10), color: Colors.teal),
            //   margin: const EdgeInsets.all(15),
            //   alignment: Alignment.bottomCenter,
            //   height: MediaQuery.of(context).size.height / 15,
            //   width: double.infinity,
            //   child: TextButton(
            //     child: const Text('Calculate',
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //             color: Colors.black,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 30)),
            //     onPressed: () {
            //       double result = weight / pow(height / 100, 2);
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) =>
            //               Result(age: age, isMale: isMale, result: result),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
