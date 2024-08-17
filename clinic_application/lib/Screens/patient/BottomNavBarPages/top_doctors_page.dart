import 'package:clinic_application/Controllers/Patient/search_patient_controller.dart';
import 'package:clinic_application/Screens/patient/BottomNavBarPages/widgets/home_top_doctor_widget.dart';
import 'package:clinic_application/Screens/patient/bottom_navigator_bar_patient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopDoctorsPagePatient extends StatefulWidget {
  const TopDoctorsPagePatient({super.key});
  @override
  State<TopDoctorsPagePatient> createState() => _TopDoctorsPagePatientState();
}

class _TopDoctorsPagePatientState extends State<TopDoctorsPagePatient> {
  final formKey = GlobalKey<FormState>();
  SearchApiController searchApiController = Get.put(SearchApiController());
  String? specValueChoose;
  String? governValueChoose;
  String? areaValueChoose;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
          child: AppBar(
            toolbarHeight: 80,
            leading: Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            const BottomNavigatorBarPatient()));
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Color(0xffFFFFFF),
                  ));
            }),
            title: const Text(
              "Top Doctors",
              style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
            backgroundColor: const Color(0xff8E42CA),
            centerTitle: true,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: searchApiController.listLength ?? 0,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                HomeTopDoctorWidget(
                  doctorName: searchApiController.json?[index]['name'],
                  doctorSpec: searchApiController.json?[index]['spicialty'],
                  doctorPlace: searchApiController.json?[index]['address'],
                  doctorImage: "images/topDoctorone.png",
                  doctorRate: "(122)",
                  doctoremail: searchApiController.json?[index]['email'],
                  doctorphone: searchApiController.json?[index]['phoneNumber'],
                ),
              ],
            );
          }),
    );
  }
}
