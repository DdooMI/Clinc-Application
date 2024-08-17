// ignore_for_file: file_names

import 'package:clinic_application/Controllers/Admin/search_admin_controller.dart';
import 'package:clinic_application/Controllers/Doctor/rate_doctors_controller.dart';
import 'package:clinic_application/Controllers/Doctor/viewAppointment_controller.dart';
import 'package:clinic_application/Controllers/Doctor/view_investigates_controller.dart';
import 'package:clinic_application/Controllers/Patient/login_controller.dart';
import 'package:clinic_application/Controllers/Patient/search_patient_controller.dart';
import 'package:clinic_application/Screens/admin_login.dart';
import 'package:clinic_application/Screens/patient/signup_as_doctor.dart';
import 'package:clinic_application/widgets/button_widget.dart';
import 'package:clinic_application/widgets/showBottomSheetWidget.dart';
import 'package:clinic_application/widgets/textFormFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vector_math/vector_math_64.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginPatientState();
}

class _LoginPatientState extends State<Login> {
  LogInController logInController = Get.put(LogInController());
  SearchApiController searchApiController = Get.put(SearchApiController());
  ViewappointmentController viewappointmentController =
      Get.put(ViewappointmentController());
  RateController rateController = Get.put(RateController());
  ViewInvestigatesController viewInvestigatesController =
      Get.put(ViewInvestigatesController());
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  SearchAllDoctorController searchAllDoctorController =
      Get.put(SearchAllDoctorController());

  final formKey = GlobalKey<FormState>();
  bool passwordSeen = true;

  @override
  void initState() {
    super.initState();

    logInController.nationalNumberController.addListener(onListen);
  }

  @override
  void dispose() {
    logInController.nationalNumberController.removeListener(onListen);

    super.dispose();
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3A71D7),
        toolbarHeight: 0,
      ),
      key: scaffoldKey,
      body: ListView(
        children: [
          Container(
            height: 300,
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                      color: Color(0xffB9D0FA),
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffB9D0FA),
                            blurStyle: BlurStyle.normal,
                            blurRadius: 50,
                            spreadRadius: 70)
                      ]),
                  transform: Matrix4.translation(Vector3(-100, 100, 0)),
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                      color: Color(0xffB9D0FA),
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffB9D0FA),
                            blurStyle: BlurStyle.normal,
                            blurRadius: 50,
                            spreadRadius: 70)
                      ]),
                  transform: Matrix4.translation(Vector3(200, 600, 0)),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xff3A71D7),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(54),
                          bottomRight: Radius.circular(54))),
                  alignment: Alignment.center,
                  height: 146,
                  child: const Text(
                    "Health care",
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 150,
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 47, left: 20, bottom: 20),
                    // alignment: Alignment.centerLeft,
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                          color: Color(0xff3A71D7),
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormFieldWidget(
                    controller: logInController.nationalNumberController,
                    label: "National ID",
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 40,
                      color: Color(0xff3A71D7),
                    ),
                    suffixIcon:
                        logInController.nationalNumberController.text.isEmpty
                            ? Container(width: 0)
                            : IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => logInController
                                    .nationalNumberController
                                    .clear(),
                              ),
                    validator: (nationId) =>
                        nationId != null && nationId.length != 14
                            ? 'Enter a valid account'
                            : null,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormFieldWidget(
                    controller: logInController.passwordController,
                    obscureText: passwordSeen,
                    label: "Password",
                    prefixIcon: const Icon(
                      Icons.lock,
                      size: 40,
                      color: Color(0xff3A71D7),
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
                  Container(
                    alignment: Alignment.topRight,
                    child: const ShowSheetWidget(),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ButtonWidget(
                    text: 'Sign In',
                    onClicked: () {
                      final form = formKey.currentState!;
                      if (form.validate()) {
                        viewappointmentController
                                .nationalNumberController.text =
                            logInController.nationalNumberController.text;
                        rateController.nationalNumberController.text =
                            logInController.nationalNumberController.text;
                        viewInvestigatesController
                                .nationalNumberController.text =
                            logInController.nationalNumberController.text;
                        logInController.logIn();
                        searchApiController.searchApi();
                        viewappointmentController.viewAppoint();
                        rateController.rate();
                        viewInvestigatesController.viewInvest();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have account ?",
                    style: TextStyle(
                        color: Color(0xff3A71D7),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignupAsDoctor()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Color(0xff3A71D7),
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
                    "Log In as an Admin.",
                    style: TextStyle(
                        color: Color(0xff3A71D7),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AdminLogin()));
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                          color: Color(0xff3A71D7),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
