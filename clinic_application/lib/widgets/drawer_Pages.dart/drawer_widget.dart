import 'package:clinic_application/Controllers/Patient/login_controller.dart';
import 'package:clinic_application/Screens/login.dart';
import 'package:clinic_application/widgets/drawer_Pages.dart/drawer_container_widget.dart';
import 'package:clinic_application/widgets/drawer_Pages.dart/payment_Patient.dart';
import 'package:clinic_application/widgets/drawer_Pages.dart/privacy.dart';
import 'package:clinic_application/widgets/drawer_Pages.dart/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_page.dart';
import 'helpCenter_page.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
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
                  colors: [Color(0xff1F0541), Color(0xff5B7DC3)])),
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
                        onPressed: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const EditPage())),
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
                                  "${logInController.name}",
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
                      onClicked: () {},
                      text: "Consulting",
                      icon: Icons.quiz_outlined,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DrawerContainerWidget(
                      onClicked: () {},
                      text: "Medical Records",
                      icon: Icons.receipt_rounded,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DrawerContainerWidget(
                      onClicked: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const PaymentPatient())),
                      text: "Payments",
                      icon: Icons.payment,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DrawerContainerWidget(
                      onClicked: () {},
                      text: "Medicine Reminder",
                      icon: Icons.alarm,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DrawerContainerWidget(
                      onClicked: () {},
                      text: "Feedback",
                      icon: Icons.feedback,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DrawerContainerWidget(
                      onClicked: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const PrivacyPage())),
                      text: "Privacy & Policy",
                      icon: Icons.privacy_tip,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DrawerContainerWidget(
                      onClicked: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const HelpCenterPage())),
                      text: "Help Center",
                      icon: Icons.help,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DrawerContainerWidget(
                      onClicked: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage())),
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
