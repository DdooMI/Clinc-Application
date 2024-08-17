import 'package:clinic_application/Screens/patient/bottom_navigator_bar_patient.dart';
import 'package:clinic_application/widgets/drawer_Pages.dart/helpCenter_container_widget.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: ListView(children: [
          SizedBox(
              height: 810,
              child: Stack(alignment: Alignment.topLeft, children: [
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
                Positioned(
                  left: 5,
                  top: 10,
                  child: Builder(builder: (context) {
                    return IconButton(
                        onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const BottomNavigatorBarPatient())),
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 30,
                          color: Color(0xff471AA0),
                        ));
                  }),
                ),
                const Positioned(
                  left: 70,
                  top: 20,
                  child: Text(
                    "Help Center",
                    style: TextStyle(
                        color: Color(0xff471AA0),
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Positioned(
                  top: 70,
                  child: Container(
                    height: 710,
                    width: 410,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "I have an issue with",
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff471AA0)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HelpCenterContainerWidget(
                            text: "Booking a new appointment",
                            onClicked: () {}),
                        const SizedBox(
                          height: 5,
                        ),
                        HelpCenterContainerWidget(
                            text: "Existing Appointment", onClicked: () {}),
                        const SizedBox(
                          height: 5,
                        ),
                        HelpCenterContainerWidget(
                            text: "Online consultations", onClicked: () {}),
                        const SizedBox(
                          height: 5,
                        ),
                        HelpCenterContainerWidget(
                            text: "Feedbacks", onClicked: () {}),
                        const SizedBox(
                          height: 5,
                        ),
                        HelpCenterContainerWidget(
                            text: "Medicine orders", onClicked: () {}),
                        const SizedBox(
                          height: 5,
                        ),
                        HelpCenterContainerWidget(
                            text: "Diagnostic Tests", onClicked: () {}),
                        const SizedBox(
                          height: 5,
                        ),
                        HelpCenterContainerWidget(
                            text: "Health plans", onClicked: () {}),
                        const SizedBox(
                          height: 5,
                        ),
                        HelpCenterContainerWidget(
                            text: "My account", onClicked: () {}),
                        const SizedBox(
                          height: 5,
                        ),
                        HelpCenterContainerWidget(
                            text: "Have a feature in mind", onClicked: () {}),
                        const SizedBox(
                          height: 5,
                        ),
                        HelpCenterContainerWidget(
                            text: "Other issues", onClicked: () {}),
                      ],
                    ),
                  ),
                ),
              ]))
        ]));
  }
}
