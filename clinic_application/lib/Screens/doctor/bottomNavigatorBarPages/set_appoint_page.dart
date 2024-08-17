import 'package:clinic_application/Controllers/Doctor/add_appointment_controller.dart';
import 'package:clinic_application/Controllers/Patient/login_controller.dart';
import 'package:clinic_application/Screens/doctor/bottomNavigatorBarPages/widget/TextForm_setAppoint_widget.dart';
import 'package:clinic_application/Screens/doctor/bottomNavigatorBarPages/widget/button_setAppoint_widget.dart';
import 'package:clinic_application/Screens/doctor/bottom_navigator_bar_doctor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SetAppointmentPage extends StatefulWidget {
  const SetAppointmentPage({
    Key? key,
  }) : super(key: key);
  @override
  State<SetAppointmentPage> createState() => _SetAppointmentPageState();
}

class _SetAppointmentPageState extends State<SetAppointmentPage> {
  AddAppointmentController addAppointmentController =
      Get.put(AddAppointmentController());
  LogInController logInController = Get.put(LogInController());
  final formKey = GlobalKey<FormState>();
  TextEditingController dayController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  DateTime dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2024),
            lastDate: DateTime(2030))
        .then((value) {
      setState(() {
        dateTime = value!;
        dayController.text = dateTime.day.toString();
        hourController.text = dateTime.hour.toString();
        timeController.text = dateTime.toString();
        addAppointmentController.dateController.text = timeController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
          child: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BottomNavigatorBarDoctor()));
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(0xffFFFFFF),
                  size: 30,
                )),
            title: const Text(
              "Set Appointments",
              style: TextStyle(
                  color: Color(0xffFAFAFA),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            backgroundColor: const Color(0xff3A71D7),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 150,
          ),
          Center(
            child: Container(
              height: 400,
              width: 400,
              decoration: const BoxDecoration(
                  color: Color(0xff3A71D7),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Set your appointments",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Day",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 60,
                              width: 200,
                              child: TextformSetappointWidget(
                                controller: dayController,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Hour",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: SizedBox(
                                height: 60,
                                width: 200,
                                child: TextformSetappointWidget(
                                  controller: hourController,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: 150,
                          child: ButtonSetappointWidget(
                            onClicked: () {
                              addAppointmentController.nationalNumberController
                                  .text = logInController.nationlId!;
                              addAppointmentController.addApoint();
                            },
                            text: "Add",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: _showDatePicker,
                          icon: const Icon(
                            Icons.date_range,
                            size: 50,
                            color: Colors.white,
                          ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
