import 'package:clinic_application/Screens/patient/bottom_navigator_bar_patient.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class BookingPagePatient extends StatefulWidget {
  const BookingPagePatient({super.key});
  @override
  State<BookingPagePatient> createState() => _BookingPagePatientState();
}

class _BookingPagePatientState extends State<BookingPagePatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const BottomNavigatorBarPatient())),
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Color(0xffFFFFFF),
              ));
        }),
        title: const Text(
          "Name",
          style: TextStyle(
              color: Color(0xffFAFAFA),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color(0xff8E42CA),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                      color: Color(0xFFD0B1EA),
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFD0B1EA),
                            blurStyle: BlurStyle.normal,
                            blurRadius: 50,
                            spreadRadius: 100)
                      ]),
                  transform: Matrix4.translation(Vector3(-100, 50, 0)),
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                      color: Color(0xFFD0B1EA),
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFD0B1EA),
                            blurStyle: BlurStyle.normal,
                            blurRadius: 50,
                            spreadRadius: 100)
                      ]),
                  transform: Matrix4.translation(Vector3(200, 500, 0)),
                ),
                Container(
                  height: 250,
                  width: 500,
                  decoration: const BoxDecoration(
                      color: Color(0xff8E42CA),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 240,
                          width: 240,
                          decoration: const BoxDecoration(
                              color: Color(0xFFD0B1EA),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(400))),
                          child: const Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: 0,
                                child: SizedBox(
                                  height: 230,
                                  width: 230,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage("images/messagedoctor.jpeg"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
