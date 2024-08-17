import 'dart:io';

import 'package:clinic_application/Controllers/Doctor/edit_profile_doctor.dart';
import 'package:clinic_application/Controllers/Patient/login_controller.dart';
import 'package:clinic_application/Screens/doctor/bottomNavigatorBarPages/widget/button_doctot_widget.dart';
import 'package:clinic_application/Screens/doctor/bottomNavigatorBarPages/widget/text_field_doctor_widget.dart';
import 'package:clinic_application/Screens/doctor/bottom_navigator_bar_doctor.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditDoctorPage extends StatefulWidget {
  const EditDoctorPage({super.key});

  @override
  State<StatefulWidget> createState() => _EditDoctorPageState();
}

class _EditDoctorPageState extends State<EditDoctorPage> {
  final formKey = GlobalKey<FormState>();
  LogInController logInController = Get.put(LogInController());
  EditProfileDoctor editController = Get.put(EditProfileDoctor());

  String? genderValueChoose;
  File? selectedImage;
  @override
  void initState() {
    super.initState();

    editController.emailController.addListener(onListen);
  }

  @override
  void dispose() {
    editController.emailController.removeListener(onListen);

    super.dispose();
  }

  void onListen() => setState(() {});
  @override
  Widget build(BuildContext context) {
    editController.nationalNumberController.text =
        logInController.nationlId ?? "";
    editController.nameController.text = logInController.name ?? "";
    editController.emailController.text = logInController.email ?? "";
    editController.phoneNumberController.text =
        logInController.phoneNumber ?? "";
    editController.ageController.text = logInController.age.toString();
    editController.genderController.text = logInController.gender ?? "";
    editController.addressController.text = logInController.address ?? "";
    editController.specialityController.text = logInController.speciality ?? "";
    editController.aboutController.text = logInController.aboutDoctor ?? "";
    editController.descriptionController.text =
        logInController.description ?? "";
    editController.appointmentPriceController.text =
        logInController.appointmentPrice ?? "";
    editController.specializeInController.text =
        logInController.specializeIn ?? "";
    genderValueChoose = editController.genderController.text;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const BottomNavigatorBarDoctor())),
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Color(0xffFFFFFF),
              ));
        }),
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Color(0xffFAFAFA),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color(0xff3A71D7),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                Container(
                  height: 300,
                  width: 500,
                  decoration: const BoxDecoration(
                      color: Color(0xff3A71D7),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      const Text(
                        "Set up your profile",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          height: 240,
                          width: 240,
                          decoration: const BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(400))),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: 0,
                                child: SizedBox(
                                  height: 230,
                                  width: 230,
                                  child: selectedImage != null
                                      ? CircleAvatar(
                                          backgroundImage:
                                              FileImage(selectedImage!))
                                      : CircleAvatar(),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                    onPressed: () {
                                      _pickImageFromGallery();
                                    },
                                    icon: const Icon(
                                      Icons.add_a_photo_rounded,
                                      color: Color(0xff000000),
                                      size: 40,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormFieldDoctorWidget(
                        controller: editController.nameController,
                        hint: "Full Name",
                        prefixIcon: const Icon(
                          Icons.person_outline_sharp,
                          size: 40,
                          color: Color(0xff3A71D7),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldDoctorWidget(
                        controller: editController.emailController,
                        hint: "Email",
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          size: 40,
                          color: Color(0xff3A71D7),
                        ),
                        suffixIcon: editController.emailController.text.isEmpty
                            ? Container(width: 0)
                            : IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () =>
                                    editController.emailController.clear(),
                              ),
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email'
                                : null,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldDoctorWidget(
                        controller: editController.phoneNumberController,
                        hint: "Mobile number",
                        prefixIcon: const Icon(
                          Icons.phone_android,
                          size: 40,
                          color: Color(0xff3A71D7),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 150,
                            height: 55,
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        width: 3, color: Color(0xff3A71D7)),
                                    bottom: BorderSide(
                                        width: 3, color: Color(0xff3A71D7)),
                                    left: BorderSide(
                                        width: 3, color: Color(0xff3A71D7)),
                                    right: BorderSide(
                                        width: 3, color: Color(0xff3A71D7))),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.male,
                                  color: Color(0xff3A71D7),
                                  size: 40,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                DropdownButton(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    dropdownColor: const Color(0xff3A71D7),
                                    iconSize: 30,
                                    focusColor: const Color(0xff3A71D7),
                                    hint: const Text(
                                      "Gender",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                    value: genderValueChoose,
                                    items: const [
                                      DropdownMenuItem(
                                          value: "Male",
                                          child: Text("Male",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.w400))),
                                      DropdownMenuItem(
                                          value: "Female",
                                          child: Text("Female",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400)))
                                    ],
                                    onChanged: (val) {
                                      setState(() {
                                        genderValueChoose = val;
                                        editController.genderController.text =
                                            genderValueChoose!;
                                        print(genderValueChoose);
                                      });
                                    })
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 220,
                            height: 55,
                            child: TextFormFieldDoctorWidget(
                              controller: editController.ageController,
                              hint: "Age",
                              prefixIcon: const Icon(
                                Icons.date_range,
                                size: 40,
                                color: Color(0xff3A71D7),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldDoctorWidget(
                        controller: editController.specialityController,
                        hint: "Speciality",
                        prefixIcon: const Icon(
                          Icons.school,
                          size: 40,
                          color: Color(0xff3A71D7),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldDoctorWidget(
                        controller: editController.addressController,
                        hint: "Location",
                        prefixIcon: const Icon(
                          Icons.location_city,
                          size: 40,
                          color: Color(0xff3A71D7),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldDoctorWidget(
                        controller: editController.aboutController,
                        hint: "About Doctor",
                        prefixIcon: const Icon(
                          Icons.account_box_outlined,
                          size: 40,
                          color: Color(0xff3A71D7),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldDoctorWidget(
                        controller: editController.descriptionController,
                        hint: "Description",
                        prefixIcon: const Icon(
                          Icons.receipt,
                          size: 40,
                          color: Color(0xff3A71D7),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldDoctorWidget(
                        controller: editController.specializeInController,
                        hint: "Specialization in",
                        prefixIcon: const Icon(
                          Icons.school,
                          size: 40,
                          color: Color(0xff3A71D7),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldDoctorWidget(
                        controller: editController.appointmentPriceController,
                        hint: "Appointment Price",
                        prefixIcon: const Icon(
                          Icons.attach_money,
                          size: 40,
                          color: Color(0xff3A71D7),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ButtonDoctorWidget(
                        text: 'Save',
                        onClicked: () {
                          final form = formKey.currentState!;
                          if (form.validate()) {
                            editController.edit();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = File(returnedImage!.path);
      //editController.images[0] = returnedImage.path;
    });
  }
}
