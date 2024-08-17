import 'package:clinic_application/Controllers/Doctor/rate_doctors_controller.dart';
import 'package:clinic_application/Screens/doctor/bottomNavigatorBarPages/widget/rate_page.dart';
import 'package:clinic_application/widgets/drawer_pages_doctor/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingDoctorPage extends StatefulWidget {
  const RatingDoctorPage({super.key});
  @override
  State<RatingDoctorPage> createState() => _RatingDoctorPageState();
}

class _RatingDoctorPageState extends State<RatingDoctorPage> {
  final formKey = GlobalKey<FormState>();
  RateController rateController = Get.put(RateController());

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
                "Patient's feedback",
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
              itemCount: rateController.listLength ?? 0,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    RatingPageWidget(
                      patientName: rateController.json![index]['patientName'],
                      numStars:
                          double.parse(rateController.json![index]['rating']),
                      comment: rateController.json![index]['comments'],
                      rateDate: rateController.json![index]['rateTime'],
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
