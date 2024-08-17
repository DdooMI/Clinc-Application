import 'package:clinic_application/Screens/doctor/bottomNavigatorBarPages/widget/setting_doctor_widget.dart';
import 'package:clinic_application/Screens/doctor/bottom_navigator_bar_doctor.dart';
import 'package:flutter/material.dart';

class SettingsDoctorPage extends StatefulWidget {
  const SettingsDoctorPage({super.key});

  @override
  State<SettingsDoctorPage> createState() => _SettingsDoctorPageState();
}

class _SettingsDoctorPageState extends State<SettingsDoctorPage> {
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(20)),
            child: AppBar(
              leading: Builder(builder: (context) {
                return IconButton(
                    onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) =>
                                const BottomNavigatorBarDoctor())),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 30,
                      color: Color(0xffFFFFFF),
                    ));
              }),
              title: const Text(
                "Settings",
                style: TextStyle(
                    color: Color(0xffFAFAFA),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              backgroundColor: const Color(0xff3A71D7),
            ),
          ),
        ),
        body: SizedBox(
            height: 810,
            child: Column(children: [
              Container(
                height: 710,
                width: 410,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SettingsDoctorWidget(
                        text: "Change Password", onClicked: () {}),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SettingsDoctorWidget(text: "About us", onClicked: () {}),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      height: 60,
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Dark Mode",
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Switch(
                            value: darkMode,
                            onChanged: (val) {
                              setState(() {
                                darkMode = val;
                              });
                            },
                            activeColor: const Color(0xff3A71D7),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SettingsDoctorWidget(text: "Languages", onClicked: () {}),
                  ],
                ),
              ),
            ])));
  }
}
