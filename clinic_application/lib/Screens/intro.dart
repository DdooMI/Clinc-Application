import 'dart:async';

import 'package:clinic_application/Controllers/Patient/login_controller.dart';
import 'package:clinic_application/Screens/start_one.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});
  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  LogInController logInController = Get.put(LogInController());
  void initState() {
    super.initState();
    // Start the timer as soon as the screen is initialized
    Timer(const Duration(seconds: 20), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const StartOne()));
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            height: 250,
            width: 360,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      color: Color(0xff471AA0),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: Image.asset(
                    "images/Logo.png",
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: 320,
                    child: const Text(
                      "Health care",
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff471AA0)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
