import 'package:flutter/material.dart';

class WaitingListDoctorWidget extends StatelessWidget {
  final String? patientName;
  final String? patientNumber;
  final String? patientGender;
  final int? patientAge;
  final String? appointmentDate;

  final String? patientImage;

  const WaitingListDoctorWidget({
    Key? key,
    this.patientName,
    this.patientNumber,
    this.patientGender,
    this.patientAge,
    this.patientImage,
    this.appointmentDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 10),
        height: 100,
        width: 400,
        decoration: const BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 5)],
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: 100,
                child: Image.asset(
                  patientImage ?? "",
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 100,
              width: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Name: ${patientName ?? ""} ",
                    style: const TextStyle(
                        color: Color(0xff404345),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          "Age: ${patientAge ?? ""}",
                          style: const TextStyle(
                              color: Color(0xff404345),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          "Gender: ${patientGender ?? ""}",
                          style: const TextStyle(
                              color: Color(0xff404345),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Phone: ${patientNumber ?? ""}",
                    style: const TextStyle(
                        color: Color(0xff404345),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 280,
                        child: Text(
                          "Date: ${appointmentDate ?? ""}",
                          style: const TextStyle(
                              color: Color(0xff404345),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
