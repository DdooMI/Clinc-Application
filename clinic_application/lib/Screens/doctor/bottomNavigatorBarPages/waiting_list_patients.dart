import 'package:clinic_application/Controllers/Doctor/viewAppointment_controller.dart';
import 'package:clinic_application/Screens/doctor/bottomNavigatorBarPages/widget/waiting_list_widget.dart';
import 'package:clinic_application/widgets/drawer_pages_doctor/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaitingListDoctor extends StatefulWidget {
  const WaitingListDoctor({super.key});
  @override
  State<WaitingListDoctor> createState() => _WaitingListDoctorState();
}

class _WaitingListDoctorState extends State<WaitingListDoctor> {
  final formKey = GlobalKey<FormState>();
  ViewappointmentController viewappointmentController =
      Get.put(ViewappointmentController());

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
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(
                      Icons.menu,
                      size: 30,
                      color: Color(0xffFFFFFF),
                    ));
              }),
              title: const Text(
                "Waiting Patients",
                style: TextStyle(
                    color: Color(0xffFAFAFA),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              backgroundColor: const Color(0xff3A71D7),
            ),
          ),
        ),
        drawer: const DrawerDoctorWidget(),
        body: SizedBox(
          height: 800,
          width: 440,
          child: ListView.builder(
              itemCount: viewappointmentController.listLength ?? 0,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    WaitingListDoctorWidget(
                      patientName: viewappointmentController.json![index]
                          ['patient']['name'],
                      patientAge: viewappointmentController.json![index]
                          ['patient']['age'],
                      patientGender: viewappointmentController.json![index]
                          ['patient']['gender'],
                      patientImage: "images/topDoctorone.png",
                      patientNumber: viewappointmentController.json![index]
                          ['patient']['phoneNumber'],
                      appointmentDate: viewappointmentController.json![index]
                          ['appointmentDate'],
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
