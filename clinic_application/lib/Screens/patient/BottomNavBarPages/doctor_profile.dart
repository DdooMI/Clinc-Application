// ignore_for_file: must_be_immutable

import 'package:clinic_application/Screens/patient/BottomNavBarPages/widgets/doctor_profile_text_widget.dart';
import 'package:clinic_application/Screens/patient/bottom_navigator_bar_patient.dart';
import 'package:clinic_application/widgets/button_widget.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart';

class DoctorProfile extends StatefulWidget {
  String? name;
  String? specialty;
  String? location;
  String? price;
  String? email;
  String? phone;
  String? image;
  DoctorProfile(
      {Key? key,
      this.name,
      this.specialty,
      this.location,
      this.price,
      this.email,
      this.phone,
      this.image})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  void onListen() => setState(() {});
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
          "Profile",
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
          SizedBox(
            height: 600,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextWidget(
                  name: widget.name,
                  icon: Icons.person,
                ),
                SizedBox(
                  height: 20,
                ),
                TextWidget(
                  name: widget.specialty,
                  icon: Icons.school,
                ),
                SizedBox(
                  height: 20,
                ),
                TextWidget(
                  name: widget.location,
                  icon: Icons.location_on,
                ),
                SizedBox(
                  height: 20,
                ),
                TextWidget(
                  name: widget.phone,
                  icon: Icons.phone_android,
                ),
                SizedBox(
                  height: 20,
                ),
                TextWidget(
                  name: widget.email,
                  icon: Icons.email,
                ),
                SizedBox(
                  height: 20,
                ),
                TextWidget(
                  name: widget.price,
                  icon: Icons.attach_money,
                ),
                SizedBox(
                  height: 30,
                ),
                ButtonWidget(text: "Book Now", onClicked: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
