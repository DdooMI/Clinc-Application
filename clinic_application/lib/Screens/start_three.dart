import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vector_math/vector_math_64.dart';

import 'login.dart';

class StartThree extends StatelessWidget {
  const StartThree({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: ListView(
        children: [
          Container(
            height: 450,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  height: 340,
                  width: 340,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff471AA0), Color(0xffBB84E8)]),
                      borderRadius: BorderRadius.all(Radius.circular(200))),
                  transform: Matrix4.translation(Vector3(-100, -20, 0)),
                ),
                const Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 170,
                    backgroundImage: AssetImage(
                      "images/startthree.jpeg",
                    ),
                    backgroundColor: Color(0xff111111),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      color: Color(0xff471AA0),
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff471AA0),
                            blurStyle: BlurStyle.normal,
                            blurRadius: 250,
                            spreadRadius: 150)
                      ]),
                  transform: Matrix4.translation(Vector3(-100, 700, 0)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 75,
                  child: const Text(
                    "Easy Appointments",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff471AA0)),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 16,
                      width: 130,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 16,
                            width: 16,
                            decoration: const BoxDecoration(
                                color: Color(0xffB06FFF),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(200))),
                          ),
                          Container(
                            height: 16,
                            width: 16,
                            decoration: const BoxDecoration(
                                color: Color(0xff9747FF),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(200))),
                          ),
                          Container(
                            height: 16,
                            width: 16,
                            decoration: const BoxDecoration(
                                color: Color(0xff471AA0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(200))),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        final pres = await SharedPreferences.getInstance();
                        pres.setBool("onboarding", true);

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Login()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 55,
                        width: 267,
                        decoration: const BoxDecoration(
                            color: Color(0xffBB84E8),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
