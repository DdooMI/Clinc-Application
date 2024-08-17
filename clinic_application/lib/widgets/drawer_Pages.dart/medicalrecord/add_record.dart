// ignore_for_file: file_names
import 'package:clinic_application/widgets/button_widget.dart';
import 'package:clinic_application/widgets/drawer_Pages.dart/medicalrecord/add_Record_widget.dart';
import 'package:clinic_application/widgets/drawer_Pages.dart/medicalrecord/typeofRecord.dart';
import 'package:clinic_application/widgets/textFormFieldWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddRecordShowWedget extends StatefulWidget {
  const AddRecordShowWedget({super.key});
  @override
  State<AddRecordShowWedget> createState() => _AddRecordShowWedgetState();
}

class _AddRecordShowWedgetState extends State<AddRecordShowWedget> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  final controller1 = TextEditingController();
  @override
  void initState() {
    super.initState();

    controller.addListener(onListen);
    controller1.addListener(onListen);
  }

  @override
  void dispose() {
    controller.removeListener(onListen);
    controller1.removeListener(onListen);
    super.dispose();
  }

  void onListen() => setState(() {});
  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
        text: "Add a record",
        onClicked: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: 760,
                    width: 500,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 700,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "New Record",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff471AA0)),
                              ),
                              Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    TextFormFieldWidget(
                                      controller: controller,
                                      label: "Record for",
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        size: 40,
                                        color: Color(0xff9747FF),
                                      ),
                                      suffixIcon: controller.text.isEmpty
                                          ? Container(width: 0)
                                          : IconButton(
                                              icon: const Icon(Icons.close),
                                              onPressed: () =>
                                                  controller.clear(),
                                            ),
                                      validator: (name) => name != null &&
                                              controller.text.isEmpty
                                          ? 'Enter a name for a record'
                                          : null,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const TypeOfRecordWedget(),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormFieldWidget(
                                      controller: controller1,
                                      label: "Record created on",
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        size: 40,
                                        color: Color(0xff9747FF),
                                      ),
                                      suffixIcon: controller1.text.isEmpty
                                          ? Container(width: 0)
                                          : IconButton(
                                              icon: const Icon(Icons.close),
                                              onPressed: () =>
                                                  controller1.clear(),
                                            ),
                                      validator: (name) => name != null &&
                                              controller1.text.isEmpty
                                          ? 'choose record date'
                                          : null,
                                    ),
                                  ],
                                ),
                              ),
                              ButtonWidget(
                                  text: "Upload record",
                                  onClicked: () {
                                    final form = formKey.currentState!;
                                    if (form.validate()) {
                                      final name = controller.text;
                                      final name1 = controller1.text;
                                      if (kDebugMode) {
                                        print(name);
                                        print(name1);
                                      }
                                      showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom),
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  height: 250,
                                                  width: 500,
                                                  child: const Column(
                                                    children: [
                                                      Text(
                                                        "Add Record",
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xff471AA0)),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      AddRecord2Wedget()
                                                    ],
                                                  )),
                                            );
                                          });
                                    }
                                  })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
