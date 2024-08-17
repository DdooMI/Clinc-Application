import 'package:clinic_application/Controllers/Patient/login_controller.dart';
import 'package:clinic_application/Screens/doctor/bottomNavigatorBarPages/set_appoint_page.dart';
import 'package:clinic_application/Screens/login.dart';
import 'package:clinic_application/widgets/drawer_Pages.dart/drawer_container_widget.dart';
import 'package:clinic_application/widgets/drawer_pages_doctor/privacy.dart';
import 'package:clinic_application/widgets/drawer_pages_doctor/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_page.dart';
import 'helpCenter_page.dart';

class DrawerDoctorWidget extends StatefulWidget {
  const DrawerDoctorWidget({
    Key? key,
  }) : super(key: key);
  @override
  State<DrawerDoctorWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerDoctorWidget> {
  LogInController logInController = Get.put(LogInController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          height: 760,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.deepPurple, Color(0xff3A71D7)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 60,
                width: 300,
                child: Row(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 250,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditDoctorPage()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: ExactAssetImage(
                                          "images/doctor1.png")),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(200))),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  logInController.name ?? "",
                                  style: const TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "View profile",
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Builder(builder: (context) {
                      return IconButton(
                          onPressed: () => Scaffold.of(context).closeDrawer(),
                          icon: const Icon(
                            Icons.cancel,
                            size: 30,
                            color: Color(0xffFFFFFF),
                          ));
                    }),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 540,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DrawerContainerWidget(
                      onClicked: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SetAppointmentPage())),
                      text: "Set appointments",
                      icon: Icons.quiz_outlined,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DrawerContainerWidget(
                      onClicked: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const PrivacyDoctorPage())),
                      text: "Privacy & Policy",
                      icon: Icons.privacy_tip,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DrawerContainerWidget(
                      onClicked: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const HelpCenterDoctorPage())),
                      text: "Help Center",
                      icon: Icons.help,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DrawerContainerWidget(
                      onClicked: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SettingsDoctorPage())),
                      text: "Settings",
                      icon: Icons.settings,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: 170,
                      child: MaterialButton(
                        onPressed: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const Login())),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.logout_rounded,
                              color: Color(0xffFFFFFF),
                            ),
                            Text(
                              "Log Out",
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
