import 'package:clinic_application/Controllers/Admin/delete_doctor_controller.dart';
import 'package:clinic_application/Controllers/Admin/search_admin_controller.dart';
import 'package:clinic_application/Screens/admin/bottom_Navigator_bar_admin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorListWidget extends StatefulWidget {
  final String? doctorName;
  final String? doctorSpec;
  final String? doctorImage;
  final String? doctoraddress;
  final String? doctorphoneNumber;
  final String? doctoremail;
  final int? doctorage;
  final String? doctorgender;
  final String? doctorNationalId;

  const DoctorListWidget(
      {Key? key,
      this.doctorName,
      this.doctorSpec,
      this.doctorNationalId,
      this.doctorphoneNumber,
      this.doctoraddress,
      this.doctoremail,
      this.doctorage,
      this.doctorgender,
      this.doctorImage,
      this.doctorId})
      : super(key: key);

  final String? doctorId;

  @override
  State<DoctorListWidget> createState() => _DoctorListWidgetState();
}

class _DoctorListWidgetState extends State<DoctorListWidget> {
  @override
  Widget build(BuildContext context) {
    DeleteDoctorController deleteDoctorController =
        Get.put(DeleteDoctorController());
    SearchAllDoctorController searchApiController =
        Get.put(SearchAllDoctorController());

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
          Image.asset(widget.doctorImage ?? ""),
          SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(
                    widget.doctorName ?? "",
                    maxLines: 1,
                    style: const TextStyle(
                        color: Color(0xff000000),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.doctorSpec ?? "",
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
                          Get.off(const BottomNavigatorBarAdmin());
                          setState(() {
                            showDialog(
                                context: Get.context!,
                                builder: (context) {
                                  return SimpleDialog(
                                    title: const Text("Delete Doctor",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Color(0xff720404))),
                                    contentPadding: const EdgeInsets.all(20),
                                    children: [
                                      Text("Delete ${widget.doctorName}",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Color(0xff000000))),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          MaterialButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: const Text(
                                              "cancel",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xff000000)),
                                            ),
                                          ),
                                          MaterialButton(
                                            onPressed: () {
                                              deleteDoctorController
                                                  .nationalNumberController
                                                  .text = widget.doctorId!;

                                              deleteDoctorController
                                                  .deleteDoctor();

                                              searchApiController.searchAdmin();

                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("Delete",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xff720404))),
                                          )
                                        ],
                                      )
                                    ],
                                  );
                                });
                          });
                        },
                        child: const Text("Delete",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff720404))),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
