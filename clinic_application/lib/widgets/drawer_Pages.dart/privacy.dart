import 'package:clinic_application/Screens/patient/bottom_navigator_bar_patient.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});
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
                    "Privacy Policy",
                    style: TextStyle(
                        color: Color(0xff471AA0),
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Positioned(
                  top: 70,
                  child: Container(
                    height: 670,
                    width: 410,
                    padding: const EdgeInsets.all(10),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Healthcare Application Privacy Policy",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff471AA0)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Information Collection",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff471AA0)),
                        ),
                        Text(
                          "We collect personal information such as your name, contact details, and medical history when you register as a patient on our platform. Additional information, including appointment preferences and inquiries, may be collected as needed to facilitate your interactions with healthcare providers.",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff471AA0)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Data Usage",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff471AA0)),
                        ),
                        Text(
                          "Your personal information is used to create and manage your account, schedule appointments, and communicate with healthcare providers.",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff471AA0)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Data Protection",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff471AA0)),
                        ),
                        Text(
                          " We implement robust security measures to protect your data from unauthorized access, disclosure, alteration, or destruction. Our platform utilizes encryption, access controls, and regular security assessments to safeguard your information.",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff471AA0)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Information Sharing",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff471AA0)),
                        ),
                        Text(
                          "We do not share your personal or medical information with third parties without your explicit consent, except as required by law or to fulfill the purposes outlined in this privacy policy.",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff471AA0)),
                        ),
                      ],
                    ),
                  ),
                ),
              ]))
        ]));
  }
}
