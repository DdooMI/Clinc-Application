// ignore_for_file: must_be_immutable

import 'package:clinic_application/Screens/patient/BottomNavBarPages/search_page.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  String? text;
  final Color? color;
  final Icon? icon;
  static String? specialty;
  CategoryWidget({
    Key? key,
    this.text,
    this.color,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SearchPagePatient()));
        specialty = text;
      },
      child: Container(
        height: 120,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: icon),
            Text(
              text ?? "",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff25282B)),
            )
          ],
        ),
      ),
    );
  }
}
