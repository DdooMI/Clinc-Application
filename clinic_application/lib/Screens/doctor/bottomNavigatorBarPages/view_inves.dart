import 'package:clinic_application/Controllers/Doctor/view_investigates_controller.dart';
import 'package:clinic_application/Screens/doctor/bottomNavigatorBarPages/widget/view_invest_widget.dart';
import 'package:clinic_application/widgets/drawer_pages_doctor/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewInvestDoctor extends StatefulWidget {
  const ViewInvestDoctor({super.key});
  @override
  State<ViewInvestDoctor> createState() => _ViewInvestDoctorState();
}

class _ViewInvestDoctorState extends State<ViewInvestDoctor> {
  final formKey = GlobalKey<FormState>();
  ViewInvestigatesController viewInvestigatesController =
      Get.put(ViewInvestigatesController());
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
                "Investigates",
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
          height: 670,
          child: ListView.builder(
              itemCount: viewInvestigatesController.listLength ?? 0,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ViewInvestWidget(
                      id: viewInvestigatesController.json![index]['id'],
                      patientName: viewInvestigatesController.json![index]
                          ['patientNationalID'],
                      investImage: viewInvestigatesController.json![index]
                          ['medicalInves'],
                      date: viewInvestigatesController.json![index]['sendTime'],
                      comment: viewInvestigatesController.json![index]
                          ['comment'],
                      reply: viewInvestigatesController.json![index]['replay'],
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
