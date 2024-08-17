// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TypeOfRecordWedget extends StatefulWidget {
  const TypeOfRecordWedget({super.key});
  @override
  State<TypeOfRecordWedget> createState() => _TypeOfRecordWedgetState();
}

class _TypeOfRecordWedgetState extends State<TypeOfRecordWedget> {
  String? typeofRecord;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Type of record",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000)),
          ),
          SizedBox(
            width: 190,
            child: RadioListTile(
                title: const Column(
                  children: [
                    Icon(
                      Icons.description_outlined,
                      size: 40,
                      color: Color(0xff677294),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Report",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff677294)),
                    )
                  ],
                ),
                value: "report",
                groupValue: typeofRecord,
                onChanged: (val) {
                  setState(() {
                    typeofRecord = val;
                  });
                }),
          ),
          SizedBox(
            width: 190,
            child: RadioListTile(
                title: Column(
                  children: [
                    Icon(
                      MdiIcons.prescription,
                      size: 40,
                      color: Color(0xff677294),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Prescription",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff677294)),
                    )
                  ],
                ),
                value: "prescription",
                groupValue: typeofRecord,
                onChanged: (val) {
                  setState(() {
                    typeofRecord = val;
                  });
                }),
          ),
          SizedBox(
            width: 190,
            child: RadioListTile(
                title: Column(
                  children: [
                    Icon(
                      MdiIcons.textBoxOutline,
                      size: 40,
                      color: Color(0xff677294),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Invoice",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff677294)),
                    )
                  ],
                ),
                value: "invoice",
                groupValue: typeofRecord,
                onChanged: (val) {
                  setState(() {
                    typeofRecord = val;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
