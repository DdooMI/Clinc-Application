import 'package:clinic_application/Screens/doctor/bottom_navigator_bar_doctor.dart';
import 'package:flutter/material.dart';

class PrivacyDoctorPage extends StatelessWidget {
  const PrivacyDoctorPage({super.key});
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
                "Privacy Policy",
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
                      color: Color(0xff000000)),
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
                    color: Color(0xff000000)),
              ),
              Text(
                "We collect personal information such as your name, contact details, and medical history when you register as a patient on our platform. Additional information, including appointment preferences and inquiries, may be collected as needed to facilitate your interactions with healthcare providers.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Data Usage",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000)),
              ),
              Text(
                "Your personal information is used to create and manage your account, schedule appointments, and communicate with healthcare providers.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Data Protection",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000)),
              ),
              Text(
                " We implement robust security measures to protect your data from unauthorized access, disclosure, alteration, or destruction. Our platform utilizes encryption, access controls, and regular security assessments to safeguard your information.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Information Sharing",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000)),
              ),
              Text(
                "We do not share your personal or medical information with third parties without your explicit consent, except as required by law or to fulfill the purposes outlined in this privacy policy.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000)),
              ),
            ],
          ),
        ));
  }
}
