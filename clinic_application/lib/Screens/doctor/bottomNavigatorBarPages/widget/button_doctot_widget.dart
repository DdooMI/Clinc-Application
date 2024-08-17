import 'package:flutter/material.dart';

class ButtonDoctorWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonDoctorWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onClicked,
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: 267,
        decoration: const BoxDecoration(
            color: Color(0xff3A71D7),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xffFFFFFF),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
