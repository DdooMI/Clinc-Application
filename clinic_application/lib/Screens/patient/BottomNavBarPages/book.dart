import 'package:clinic_application/Controllers/Patient/search_patient_controller.dart';
import 'package:clinic_application/Screens/patient/BottomNavBarPages/widgets/book_widget.dart';
import 'package:clinic_application/widgets/drawer_Pages.dart/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookPatient extends StatefulWidget {
  const BookPatient({super.key});
  @override
  State<BookPatient> createState() => _BookPatientState();
}

class _BookPatientState extends State<BookPatient> {
  final formKey = GlobalKey<FormState>();
  SearchApiController searchApiController = Get.put(SearchApiController());

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
              backgroundColor: const Color(0xffFFFFFF),
              title: const Text(
                "Booking Appointment",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff471AA0)),
              ),
              leading: Builder(builder: (context) {
                return IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(
                      Icons.menu,
                      size: 30,
                      color: Color(0xff471AA0),
                    ));
              }),
            ),
          ),
        ),
        backgroundColor: const Color(0xFFD0B1EA),
        drawer: const DrawerWidget(),
        body: SizedBox(
          height: 650,
          child: ListView.builder(
              itemCount: searchApiController.listLength ?? 0,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    BookWidget(
                        image: "images/messagedoctor.jpeg",
                        doctorName: searchApiController.json?[index]['name'],
                        doctorSpec: searchApiController.json?[index]
                            ['spicialty'],
                        yearExperience: 6,
                        timeDay: "tomorrow",
                        timeHour: "10:00 AM"),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              }),
        ));
  }
}
