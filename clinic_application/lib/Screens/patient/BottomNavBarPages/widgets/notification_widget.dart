import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final String date;
  final String content;
  final VoidCallback onClicked;
  final String time;

  const NotificationWidget(
      {Key? key,
      required this.date,
      required this.content,
      required this.onClicked,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onClicked,
      child: Container(
        height: 65,
        width: 400,
        decoration: const BoxDecoration(
            color: Color(0xffDAAAFF),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.notifications_active_outlined,
              size: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              width: 280,
              height: 60,
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        date,
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        time,
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        content,
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
