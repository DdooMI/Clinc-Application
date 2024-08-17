import 'package:clinic_application/widgets/drawer_Pages.dart/medicalrecord/add_record.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

class MedicalRecordPage extends StatelessWidget {
  const MedicalRecordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 30,
                          color: Color(0xff471AA0),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Medical Records",
                      style: TextStyle(
                          color: Color(0xff471AA0),
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      color: const Color(0xFFD0B1EA),
                      borderRadius: BorderRadius.circular(400)),
                  child: Image.asset(
                    "images/medicalRecord.png",
                  )),
              const Column(
                children: [
                  Text(
                    "Add a medical record",
                    style: TextStyle(
                        color: Color(0xff471AA0),
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "A detailed health history helps a doctor diagnose you better.",
                    style: TextStyle(
                        color: Color(0xff471AA0),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              AddRecordShowWedget(),
              const SizedBox(
                height: 20,
              ),
            ]));
  }
}
