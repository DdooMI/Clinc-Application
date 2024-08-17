import 'package:clinic_application/Screens/patient/BottomNavBarPages/widgets/notification_widget.dart';
import 'package:clinic_application/widgets/drawer_Pages.dart/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class NotificationPatient extends StatefulWidget {
  const NotificationPatient({super.key});
  @override
  State<NotificationPatient> createState() => _NotificationPatientState();
}

class _NotificationPatientState extends State<NotificationPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        drawer: const DrawerWidget(),
        body: ListView(
          children: [
            Container(
              height: 735,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        color: Color(0xffBE83EE),
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffBE83EE),
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
                        color: Color(0xffBE83EE),
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffBE83EE),
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
                          onPressed: () => Scaffold.of(context).openDrawer(),
                          icon: const Icon(
                            Icons.menu,
                            size: 30,
                            color: Color(0xffFFFFFF),
                          ));
                    }),
                  ),
                  const Positioned(
                    left: 70,
                    top: 20,
                    child: Text(
                      "Notification",
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
                      width: 430,
                      padding: EdgeInsets.all(10),
                      child: ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "New",
                                style: TextStyle(
                                    color: Color(0xff471AA0),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                child: const Text(
                                  "Mark All",
                                  style: TextStyle(
                                      color: Color(0xff471AA0),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          NotificationWidget(
                              date: "April 2023",
                              content:
                                  "Corem ipsum dolor sit amet,adipiscing elit.",
                              onClicked: () {},
                              time: "12 Min"),
                          const SizedBox(
                            height: 10,
                          ),
                          NotificationWidget(
                              date: "April 2023",
                              content:
                                  "Corem ipsum dolor sit amet,adipiscing elit.",
                              onClicked: () {},
                              time: "12 Min"),
                          const SizedBox(
                            height: 10,
                          ),
                          NotificationWidget(
                              date: "April 2023",
                              content:
                                  "Corem ipsum dolor sit amet,adipiscing elit.",
                              onClicked: () {},
                              time: "12 Min"),
                          const SizedBox(
                            height: 10,
                          ),
                          NotificationWidget(
                              date: "April 2023",
                              content:
                                  "Corem ipsum dolor sit amet,adipiscing elit.",
                              onClicked: () {},
                              time: "12 Min"),
                          const SizedBox(
                            height: 10,
                          ),
                          NotificationWidget(
                              date: "April 2023",
                              content:
                                  "Corem ipsum dolor sit amet,adipiscing elit.",
                              onClicked: () {},
                              time: "12 Min"),
                          const SizedBox(
                            height: 10,
                          ),
                          NotificationWidget(
                              date: "April 2023",
                              content:
                                  "Corem ipsum dolor sit amet,adipiscing elit.",
                              onClicked: () {},
                              time: "12 Min"),
                          const SizedBox(
                            height: 10,
                          ),
                          NotificationWidget(
                              date: "April 2023",
                              content:
                                  "Corem ipsum dolor sit amet,adipiscing elit.",
                              onClicked: () {},
                              time: "12 Min"),
                          const SizedBox(
                            height: 10,
                          ),
                          NotificationWidget(
                              date: "April 2023",
                              content:
                                  "Corem ipsum dolor sit amet,adipiscing elit.",
                              onClicked: () {},
                              time: "12 Min"),
                          const SizedBox(
                            height: 10,
                          ),
                          NotificationWidget(
                              date: "April 2023",
                              content:
                                  "Corem ipsum dolor sit amet,adipiscing elit.",
                              onClicked: () {},
                              time: "12 Min"),
                          const SizedBox(
                            height: 10,
                          ),
                          NotificationWidget(
                              date: "April 2023",
                              content:
                                  "Corem ipsum dolor sit amet,adipiscing elit.",
                              onClicked: () {},
                              time: "12 Min"),
                          const SizedBox(
                            height: 10,
                          ),
                          NotificationWidget(
                              date: "April 2023",
                              content:
                                  "Corem ipsum dolor sit amet,adipiscing elit.",
                              onClicked: () {},
                              time: "12 Min"),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
