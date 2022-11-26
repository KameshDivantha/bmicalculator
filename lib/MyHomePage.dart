import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 50;

  String gender = "";

  late double bmi = CalculateBmi(weight: weight, height: height);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 60, fontWeight: FontWeight.bold);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.grey[300],
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("male");
                      setState(() {
                        gender = "M";
                      });
                    },
                    child: Container(
                      width: 165,
                      decoration: BoxDecoration(
                        color: gender == "M"
                            ? Color.fromARGB(255, 65, 163, 243)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.male, size: 150),
                          Text(
                            "Male",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      print("famale");
                      setState(() {
                        gender = "F";
                      });
                    },
                    child: Container(
                        width: 165,
                        decoration: BoxDecoration(
                          color: gender == "F"
                              ? Color.fromARGB(255, 65, 163, 243)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const [
                            Icon(
                              Icons.female,
                              size: 150,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        )),
                  )
                ],
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Height",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$height",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange),
                        ),
                        Row(
                          children: [
                            // height minus and plus
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (height > 50) height--;
                                    bmi = CalculateBmi(
                                        weight: weight, height: height);
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  size: 40,
                                )),
                            const SizedBox(width: 20),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height < 250) height++;
                                  bmi = CalculateBmi(
                                      weight: weight, height: height);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$weight",
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange),
                          ),
                          Row(
                            children: [
                              // weight minus and plus
                              FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (weight > 20) weight--;
                                      bmi = CalculateBmi(
                                          weight: weight, height: height);
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: 40,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (weight < 250) weight++;
                                      bmi = CalculateBmi(
                                          weight: weight, height: height);
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 40,
                                  ))
                            ],
                          ),
                        ],
                      ))
                ],
              ),
              SizedBox(height: 90),
              Column(
                children: [
                  Text(
                    "Your BMI Value is:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(255, 198, 228, 244),
                    ),
                    width: 230,
                    height: 110,
                    child: Column(
                      children: [
                        Text(
                          "${bmi.toStringAsFixed(2)}",
                          style: Kcolor(),
                        ),
                        Text(
                          Result(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  double CalculateBmi({required int weight, required int height}) {
    return (weight / (height * height)) * 10000;
  }

  String Result() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  TextStyle Kcolor() {
    if (bmi >= 25) {
      return const TextStyle(
          fontSize: 60, fontWeight: FontWeight.bold, color: Colors.red);
    } else if (bmi > 18.5) {
      return const TextStyle(
          fontSize: 60, fontWeight: FontWeight.bold, color: Colors.green);
    } else {
      return const TextStyle(
          fontSize: 60, fontWeight: FontWeight.bold, color: Colors.yellow);
    }
  }
}
