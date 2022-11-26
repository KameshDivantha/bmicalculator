import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Icon(Icons.male, size: 120),
                        Text(
                          "Male",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.female,
                            size: 120,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ))
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Height",
                          style: TextStyle(fontSize: 15),
                        ),
                        const Text(
                          "180",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange),
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                                onPressed: null,
                                child: Icon(
                                  Icons.remove,
                                  size: 40,
                                )),
                            const SizedBox(width: 20),
                            FloatingActionButton(
                              onPressed: null,
                              child: Icon(Icons.add),
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
                            style: TextStyle(fontSize: 15),
                          ),
                          const Text(
                            "65",
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange),
                          ),
                          Row(
                            children: [
                              FloatingActionButton(
                                  onPressed: null,
                                  child: Icon(
                                    Icons.remove,
                                    size: 40,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              FloatingActionButton(
                                  onPressed: null,
                                  child: Icon(
                                    Icons.add,
                                    size: 40,
                                  ))
                            ],
                          )
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
