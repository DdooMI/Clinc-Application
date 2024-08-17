// ignore_for_file: file_names

import 'package:clinic_application/Controllers/Patient/signup_controller.dart';
import 'package:clinic_application/Screens/login.dart';
import 'package:clinic_application/Screens/patient/signup_as_doctor.dart';
import 'package:clinic_application/widgets/button_widget.dart';
import 'package:clinic_application/widgets/textFormFieldWidget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart';

class SignupPatient extends StatefulWidget {
  const SignupPatient({super.key});
  @override
  State<SignupPatient> createState() => _SignupPatientState();
}

class _SignupPatientState extends State<SignupPatient> {
  SignupController signupController = Get.put(SignupController());
  final formKey = GlobalKey<FormState>();
  final confirmpassController = TextEditingController();
  String? genderValueChoose;
  bool passwordSeen = true;
  bool confirmPasswordSeen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Sign Up",
            style: TextStyle(
                color: Color(0xff471AA0),
                fontSize: 30,
                fontWeight: FontWeight.w700),
          ),
          toolbarHeight: 90,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xff471AA0),
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
                      color: Color(0xff471AA0),
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
                          controller: signupController.nameController,
                          hint: "Full Name",
                          prefixIcon: const Icon(
                            Icons.person_outline_sharp,
                            size: 40,
                            color: Color(0xff9747FF),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormFieldWidget(
                          controller: signupController.nationalNumberController,
                          hint: "National number",
                          prefixIcon: const Icon(
                            Icons.numbers_outlined,
                            size: 40,
                            color: Color(0xff9747FF),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormFieldWidget(
                          controller: signupController.phoneNumberController,
                          hint: "Mobile number",
                          prefixIcon: const Icon(
                            Icons.phone_android,
                            size: 40,
                            color: Color(0xff9747FF),
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
                                          width: 3, color: Color(0xff9747FF)),
                                      bottom: BorderSide(
                                          width: 3, color: Color(0xff9747FF)),
                                      left: BorderSide(
                                          width: 3, color: Color(0xff9747FF)),
                                      right: BorderSide(
                                          width: 3, color: Color(0xff9747FF))),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.male,
                                    color: Color(0xff9747FF),
                                    size: 40,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  DropdownButton(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      dropdownColor: const Color(0xffBB84E8),
                                      iconSize: 30,
                                      focusColor: const Color(0xff9747FF),
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
                                          signupController.genderController
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
                                controller: signupController.ageController,
                                hint: "Age",
                                prefixIcon: const Icon(
                                  Icons.app_registration_outlined,
                                  size: 40,
                                  color: Color(0xff9747FF),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormFieldWidget(
                          controller: signupController.emailController,
                          hint: "Email",
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            size: 40,
                            color: Color(0xff9747FF),
                          ),
                          suffixIcon: signupController
                                  .emailController.text.isEmpty
                              ? Container(width: 0)
                              : IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () =>
                                      signupController.emailController.clear(),
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
                          controller: signupController.passwordController,
                          obscureText: passwordSeen,
                          hint: "Password",
                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 40,
                            color: Color(0xff9747FF),
                          ),
                          suffix: InkWell(
                            onTap: () {
                              setState(() {
                                passwordSeen = !passwordSeen;
                              });
                            },
                            child: Icon(passwordSeen
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Password";
                            } else if (value.length < 6) {
                              return "Password should be greater than 6 characters";
                            } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                                .hasMatch(value)) {
                              return "Passwords must have at least one non-alphanumeric character.";
                            } else if (!RegExp(r'\d').hasMatch(value)) {
                              return "Passwords must have at least one digit ('0'-'9').";
                            } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                              return "Passwords must have at least one uppercase letter ('A'-'Z').";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormFieldWidget(
                          controller: confirmpassController,
                          obscureText: confirmPasswordSeen,
                          hint: "Confirm Password",
                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 40,
                            color: Color(0xff9747FF),
                          ),
                          suffix: InkWell(
                            onTap: () {
                              setState(() {
                                confirmPasswordSeen = !confirmPasswordSeen;
                              });
                            },
                            child: Icon(confirmPasswordSeen
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          validator: (value) {
                            if (signupController
                                .passwordController.text.isEmpty) {
                              confirmpassController.clear();
                            }
                            if (value!.isEmpty) {
                              return "Enter Password";
                            } else if (confirmpassController.text !=
                                signupController.passwordController.text) {
                              return "Wrong Password";
                            } else if (confirmpassController.text.length < 6) {
                              return "Password should be greater than 6 characters";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ButtonWidget(
                          text: 'Sign Up',
                          onClicked: () {
                            final form = formKey.currentState!;
                            if (form.validate()) {
                              signupController.signUp();
                              final email =
                                  signupController.emailController.text;
                              final password =
                                  signupController.passwordController.text;
                              final national = signupController
                                  .nationalNumberController.text;
                              final phone =
                                  signupController.phoneNumberController.text;
                              if (kDebugMode) {
                                print(email);
                                print(password);
                                print(national);
                                print(phone);
                              }
                            }
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Already have an account ? ",
                                    style: TextStyle(
                                        color: Color(0xff471AA0),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  MaterialButton(
                                    onPressed: () => Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) => Login())),
                                    child: const Text(
                                      "Sign In",
                                      style: TextStyle(
                                          color: Color(0xff471AA0),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Sign Up as a Doctor",
                                    style: TextStyle(
                                        color: Color(0xff471AA0),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignupAsDoctor()));
                                    },
                                    child: const Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Color(0xff471AA0),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],
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
