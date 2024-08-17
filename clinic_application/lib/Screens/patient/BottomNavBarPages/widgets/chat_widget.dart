import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final String image;
  final String doctorName;
  final String doctorSpec;
  final VoidCallback onClicked;
  final String timeHour;

  const ChatWidget(
      {Key? key,
      required this.image,
      required this.doctorName,
      required this.doctorSpec,
      required this.onClicked,
      required this.timeHour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onClicked,
      child: Container(
        height: 80,
        width: 400,
        decoration: const BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [BoxShadow(blurRadius: 5, spreadRadius: 0.01)]),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 80,
              width: 270,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        timeHour,
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Text(
                    doctorName,
                    style: const TextStyle(
                        color: Color(0xff000000),
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    doctorSpec,
                    style: const TextStyle(
                        color: Color(0xff858585),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
