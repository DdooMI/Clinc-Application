import 'package:clinic_application/Screens/doctor/bottomNavigatorBarPages/widget/help_center_doctor_widget.dart';
import 'package:clinic_application/Screens/doctor/bottom_navigator_bar_doctor.dart';
import 'package:flutter/material.dart';

class HelpCenterDoctorPage extends StatelessWidget {
  const HelpCenterDoctorPage({super.key});
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
                "Help Center",
                style: TextStyle(
                    color: Color(0xffFAFAFA),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              backgroundColor: const Color(0xff3A71D7),
            ),
          ),
        ),
        body: Container(
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
                    color: Color(0xff000000)),
              ),
              const SizedBox(
                height: 10,
              ),
              HelpCenterDoctorWidget(
                  text: "Booking a new appointment", onClicked: () {}),
              const SizedBox(
                height: 5,
              ),
              HelpCenterDoctorWidget(
                  text: "Existing Appointment", onClicked: () {}),
              const SizedBox(
                height: 5,
              ),
              HelpCenterDoctorWidget(
                  text: "Online consultations", onClicked: () {}),
              const SizedBox(
                height: 5,
              ),
              HelpCenterDoctorWidget(text: "Feedbacks", onClicked: () {}),
              const SizedBox(
                height: 5,
              ),
              HelpCenterDoctorWidget(text: "Medicine orders", onClicked: () {}),
              const SizedBox(
                height: 5,
              ),
              HelpCenterDoctorWidget(
                  text: "Diagnostic Tests", onClicked: () {}),
              const SizedBox(
                height: 5,
              ),
              HelpCenterDoctorWidget(text: "Health plans", onClicked: () {}),
              const SizedBox(
                height: 5,
              ),
              HelpCenterDoctorWidget(text: "My account", onClicked: () {}),
              const SizedBox(
                height: 5,
              ),
              HelpCenterDoctorWidget(
                  text: "Have a feature in mind", onClicked: () {}),
              const SizedBox(
                height: 5,
              ),
              HelpCenterDoctorWidget(text: "Other issues", onClicked: () {}),
            ],
          ),
        ));
  }
}
