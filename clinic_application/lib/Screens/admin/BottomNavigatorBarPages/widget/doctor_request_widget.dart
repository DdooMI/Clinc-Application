import 'package:clinic_application/Controllers/Admin/Add_doctor_controller.dart';
import 'package:clinic_application/Screens/admin/BottomNavigatorBarPages/Add_doctor_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorRequestWidget extends StatelessWidget {
  final String? doctorName;
  final String? doctorSpec;
  final String? doctoraddress;
  final String? doctorphoneNumber;
  final String? doctoremail;
  final int? doctorage;
  final String? doctorgender;
  final String? doctorNationalId;
  final bool? doctorAccept;
  const DoctorRequestWidget(
      {Key? key,
      this.doctorName,
      this.doctorSpec,
      this.doctorNationalId,
      this.doctorphoneNumber,
      this.doctoraddress,
      this.doctoremail,
      this.doctorage,
      this.doctorgender,
      this.doctorAccept})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddDoctorController addDoctorController = Get.put(AddDoctorController());
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        height: 80,
        width: 400,
        decoration: const BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 5)],
            color: Color(0xffC6BDBD),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(
                  doctorName ?? "",
                  maxLines: 1,
                  style: const TextStyle(
                      color: Color(0xff000000),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                width: 390,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        doctorSpec ?? "",
                        maxLines: 1,
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      height: 3,
                      width: 3,
                      decoration: const BoxDecoration(
                          color: Color(0xffAAAAAA),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    ),
                    Expanded(
                      child: Text(
                        doctoraddress ?? "",
                        maxLines: 1,
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 40,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddDoctorPage(
                                  doctorName: doctorName,
                                  doctorNationalId: doctorNationalId,
                                  doctorSpec: doctorSpec,
                                  doctoraddress: doctoraddress,
                                  doctorage: doctorage,
                                  doctoremail: doctoremail,
                                  doctorgender: doctorgender,
                                  doctorphoneNumber: doctorphoneNumber,
                                  doctorAccept: doctorAccept)));
                          addDoctorController.passwordController.clear();
                        },
                        child: const Text(
                          "Review",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff000000)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
