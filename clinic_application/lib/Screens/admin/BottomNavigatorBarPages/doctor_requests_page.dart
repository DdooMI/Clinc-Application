import 'package:clinic_application/Controllers/Admin/view_request_doctors_controller.dart';
import 'package:clinic_application/Screens/admin/BottomNavigatorBarPages/widget/doctor_request_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorRequestsPage extends StatefulWidget {
  const DoctorRequestsPage({super.key});
  @override
  State<DoctorRequestsPage> createState() => _DoctorRequestsPageState();
}

class _DoctorRequestsPageState extends State<DoctorRequestsPage> {
  final formKey = GlobalKey<FormState>();
  ViewRequestDoctorsController viewRequestDoctorsController =
      Get.put(ViewRequestDoctorsController());
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
                "Doctors Requests",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffFFFFFF)),
              ),
            ),
          ),
        ),
        body: SizedBox(
          height: 650,
          width: 450,
          child: ListView.builder(
              itemCount: viewRequestDoctorsController.listLength ?? 0,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    DoctorRequestWidget(
                      doctorName: viewRequestDoctorsController.json![index]
                          ['name'],
                      doctorSpec: viewRequestDoctorsController.json![index]
                          ['spicialty'],
                      doctoraddress: viewRequestDoctorsController.json![index]
                          ['address'],
                      doctorphoneNumber: viewRequestDoctorsController
                          .json![index]['phoneNumber'],
                      doctorNationalId: viewRequestDoctorsController
                          .json![index]['nationalID'],
                      doctorage: viewRequestDoctorsController.json![index]
                          ['age'],
                      doctoremail: viewRequestDoctorsController.json![index]
                          ['email'],
                      doctorgender: viewRequestDoctorsController.json![index]
                          ['gender'],
                      doctorAccept: viewRequestDoctorsController.json![index]
                          ['viewed'],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              }),
        ));
  }
}
