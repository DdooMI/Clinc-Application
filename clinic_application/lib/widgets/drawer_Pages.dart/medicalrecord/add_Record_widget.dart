// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AddRecord2Wedget extends StatefulWidget {
  const AddRecord2Wedget({super.key});
  @override
  State<AddRecord2Wedget> createState() => _AddRecordWedgetState();
}

class _AddRecordWedgetState extends State<AddRecord2Wedget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaterialButton(
          onPressed: () {},
          child: const Row(
            children: [
              Icon(
                Icons.camera_alt,
                size: 40,
                color: Color(0xff677294),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Take a photo",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff677294)),
              )
            ],
          ),
        ),
        MaterialButton(
          onPressed: () {},
          child: const Row(
            children: [
              Icon(
                Icons.photo_size_select_actual_rounded,
                size: 40,
                color: Color(0xff677294),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Upload from gallery",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff677294)),
              )
            ],
          ),
        ),
        MaterialButton(
          onPressed: () {},
          child: const Row(
            children: [
              Icon(
                Icons.file_present_rounded,
                size: 40,
                color: Color(0xff677294),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Upload files",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff677294)),
              )
            ],
          ),
        )
      ],
    );
  }
}
