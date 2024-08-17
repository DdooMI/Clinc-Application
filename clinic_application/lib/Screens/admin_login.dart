// ignore_for_file: file_names

import 'package:clinic_application/Controllers/Admin/login_controller.dart';
import 'package:clinic_application/Controllers/Admin/search_admin_controller.dart';
import 'package:clinic_application/Controllers/Admin/view_request_doctors_controller.dart';
import 'package:clinic_application/Controllers/Patient/search_patient_controller.dart';
import 'package:clinic_application/widgets/button_widget.dart';
import 'package:clinic_application/widgets/textFormFieldWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vector_math/vector_math_64.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});
  @override
  State<AdminLogin> createState() => _LoginPatientState();
}

class _LoginPatientState extends State<AdminLogin> {
  AdminLogInController adminLogInController = Get.put(AdminLogInController());
  SearchApiController searchApiController = Get.put(SearchApiController());
  ViewRequestDoctorsController viewRequestDoctorsController =
      Get.put(ViewRequestDoctorsController());
  SearchAllDoctorController searchAllDoctorController =
      Get.put(SearchAllDoctorController());
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final formKey = GlobalKey<FormState>();
  bool passwordSeen = true;

  @override
  void initState() {
    super.initState();

    adminLogInController.userNameController.addListener(onListen);
  }

  @override
  void dispose() {
    adminLogInController.userNameController.removeListener(onListen);

    super.dispose();
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5682D3),
        toolbarHeight: 50,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 40,
              color: Color(0xffFFFFFF),
            )),
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
                      color: Color(0xff5682D3),
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
                          color: Color(0xff5682D3),
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
                    controller: adminLogInController.userNameController,
                    label: "User name ",
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 40,
                      color: Color(0xff5682D3),
                    ),
                    suffixIcon: adminLogInController
                            .userNameController.text.isEmpty
                        ? Container(width: 0)
                        : IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () =>
                                adminLogInController.userNameController.clear(),
                          ),
                    validator: (userName) =>
                        userName != null && userName.length <= 6
                            ? 'Enter a valid account'
                            : null,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormFieldWidget(
                    controller: adminLogInController.passwordController,
                    obscureText: passwordSeen,
                    label: "Password",
                    prefixIcon: const Icon(
                      Icons.lock,
                      size: 40,
                      color: Color(0xff5682D3),
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
                    height: 50,
                  ),
                  ButtonWidget(
                    text: 'Sign In',
                    onClicked: () {
                      final form = formKey.currentState!;
                      if (form.validate()) {
                        searchAllDoctorController.searchAdmin();
                        adminLogInController.logIn();
                        viewRequestDoctorsController.viewRequestDoctor();
                        final email =
                            adminLogInController.userNameController.text;
                        if (kDebugMode) {
                          print(email);
                          print(adminLogInController.passwordController.text);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
