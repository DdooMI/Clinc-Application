// ignore_for_file: file_names

import 'package:clinic_application/Controllers/Patient/signup_asdoctor_controller.dart';
import 'package:clinic_application/Screens/login.dart';
import 'package:clinic_application/widgets/button_widget.dart';
import 'package:clinic_application/widgets/textFormFieldWidget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart';

class SignupAsDoctor extends StatefulWidget {
  const SignupAsDoctor({super.key});
  @override
  State<SignupAsDoctor> createState() => _SignupAsDoctorState();
}

class _SignupAsDoctorState extends State<SignupAsDoctor> {
  SignupAsDoctorController signupAsDoctorController =
      Get.put(SignupAsDoctorController());
  final formKey = GlobalKey<FormState>();
  String? genderValueChoose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Sign Up",
            style: TextStyle(
                color: Color(0xff5682D3),
                fontSize: 30,
                fontWeight: FontWeight.w700),
          ),
          toolbarHeight: 90,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xff5682D3),
              size: 30,
            ),
          ),
          actions: [
            Stack(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: const BoxDecoration(
                      color: Color(0xff5682D3),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  transform: Matrix4.translation(Vector3(0, -50, 0)),
                ),
                Container(
                  width: 90,
                  height: 90,
                  decoration: const BoxDecoration(
                      color: Color(0xffBB84E8),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  transform: Matrix4.translation(Vector3(60, 0, 0)),
                ),
              ],
            )
          ],
        ),
        body: ListView(children: [
          Container(
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                      color: Color(0xFFD0B1EA),
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFD0B1EA),
                            blurStyle: BlurStyle.normal,
                            blurRadius: 50,
                            spreadRadius: 70)
                      ]),
                  transform: Matrix4.translation(Vector3(-100, 150, 0)),
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                      color: Color(0xFFD0B1EA),
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFD0B1EA),
                            blurStyle: BlurStyle.normal,
                            blurRadius: 50,
                            spreadRadius: 70)
                      ]),
                  transform: Matrix4.translation(Vector3(250, 600, 0)),
                ),
                Form(
                  key: formKey,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormFieldWidget(
                          controller: signupAsDoctorController.nameController,
                          hint: "Full Name",
                          prefixIcon: const Icon(
                            Icons.person_outline_sharp,
                            size: 40,
                            color: Color(0xff5682D3),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormFieldWidget(
                          controller:
                              signupAsDoctorController.nationalNumberController,
                          hint: "National number",
                          prefixIcon: const Icon(
                            Icons.numbers_outlined,
                            size: 40,
                            color: Color(0xff5682D3),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormFieldWidget(
                          controller:
                              signupAsDoctorController.phoneNumberController,
                          hint: "Mobile number",
                          prefixIcon: const Icon(
                            Icons.phone_android,
                            size: 40,
                            color: Color(0xff5682D3),
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
                                          width: 3, color: Color(0xff5682D3)),
                                      bottom: BorderSide(
                                          width: 3, color: Color(0xff5682D3)),
                                      left: BorderSide(
                                          width: 3, color: Color(0xff5682D3)),
                                      right: BorderSide(
                                          width: 3, color: Color(0xff5682D3))),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.male,
                                    color: Color(0xff5682D3),
                                    size: 40,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  DropdownButton(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      dropdownColor: const Color(0xff5682D3),
                                      iconSize: 30,
                                      focusColor: const Color(0xff5682D3),
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
                                                    fontWeight:
                                                        FontWeight.w400)))
                                      ],
                                      onChanged: (val) {
                                        setState(() {
                                          genderValueChoose = val;
                                          signupAsDoctorController
                                              .genderController
                                              .text = genderValueChoose!;
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
                              child: TextFormFieldWidget(
                                controller:
                                    signupAsDoctorController.ageController,
                                hint: "Age",
                                prefixIcon: const Icon(
                                  Icons.app_registration_outlined,
                                  size: 40,
                                  color: Color(0xff5682D3),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormFieldWidget(
                          controller: signupAsDoctorController.emailController,
                          hint: "Email",
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            size: 40,
                            color: Color(0xff5682D3),
                          ),
                          suffixIcon: signupAsDoctorController
                                  .emailController.text.isEmpty
                              ? Container(width: 0)
                              : IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () => signupAsDoctorController
                                      .emailController
                                      .clear(),
                                ),
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormFieldWidget(
                          controller:
                              signupAsDoctorController.specialityController,
                          hint: "Speciality",
                          prefixIcon: const Icon(
                            Icons.phone_android,
                            size: 40,
                            color: Color(0xff5682D3),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormFieldWidget(
                          controller:
                              signupAsDoctorController.addressController,
                          hint: "Address",
                          prefixIcon: const Icon(
                            Icons.phone_android,
                            size: 40,
                            color: Color(0xff5682D3),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ButtonWidget(
                          text: 'Sign Up',
                          onClicked: () {
                            final form = formKey.currentState!;
                            if (form.validate()) {
                              showDialog(
                                  context: Get.context!,
                                  builder: (context) {
                                    return const SimpleDialog(
                                      title: Text("success"),
                                      contentPadding: EdgeInsets.all(20),
                                      children: [Text("We will contact you")],
                                    );
                                  });

                              signupAsDoctorController.signUp();
                              signupAsDoctorController.nameController.clear();
                              signupAsDoctorController.nationalNumberController
                                  .clear();
                              signupAsDoctorController.phoneNumberController
                                  .clear();
                              signupAsDoctorController.ageController.clear();
                              signupAsDoctorController.genderController.clear();
                              signupAsDoctorController.emailController.clear();
                              signupAsDoctorController.specialityController
                                  .clear();
                              signupAsDoctorController.addressController
                                  .clear();

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Login()));
                            }
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account ? ",
                                style: TextStyle(
                                    color: Color(0xff5682D3),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                              MaterialButton(
                                onPressed: () => Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => const Login())),
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: Color(0xff5682D3),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
