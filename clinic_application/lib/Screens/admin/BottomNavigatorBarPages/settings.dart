import 'package:clinic_application/Screens/admin/BottomNavigatorBarPages/widget/settings_admin_widget.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart';

class SettingsAdminPage extends StatefulWidget {
  const SettingsAdminPage({super.key});

  @override
  State<SettingsAdminPage> createState() => _SettingsAdminPageState();
}

class _SettingsAdminPageState extends State<SettingsAdminPage> {
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(20)),
            child: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              backgroundColor: const Color(0xff720404),
              title: const Text(
                "Settings",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffFFFFFF)),
              ),
            ),
          ),
        ),
        body: ListView(children: [
          SizedBox(
              height: 400,
              child: Stack(alignment: Alignment.topLeft, children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                      color: Color(0xffCD5F5F),
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffCD5F5F),
                            blurStyle: BlurStyle.normal,
                            blurRadius: 50,
                            spreadRadius: 100)
                      ]),
                  transform: Matrix4.translation(Vector3(-100, 150, 0)),
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                      color: Color(0xffCD5F5F),
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffCD5F5F),
                            blurStyle: BlurStyle.normal,
                            blurRadius: 50,
                            spreadRadius: 100)
                      ]),
                  transform: Matrix4.translation(Vector3(300, 400, 0)),
                ),
                Container(
                  height: 710,
                  width: 410,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SettingsAdminWidget(text: "Account", onClicked: () {}),
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
                              activeColor: const Color(0xff720404),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SettingsAdminWidget(text: "Languages", onClicked: () {}),
                    ],
                  ),
                ),
              ]))
        ]));
  }
}
