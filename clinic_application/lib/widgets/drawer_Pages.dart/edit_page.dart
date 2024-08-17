import 'package:clinic_application/Controllers/Patient/edit_profile_controller.dart';
import 'package:clinic_application/Controllers/Patient/login_controller.dart';
import 'package:clinic_application/Screens/patient/bottom_navigator_bar_patient.dart';
import 'package:clinic_application/widgets/button_widget.dart';
import 'package:clinic_application/widgets/textFormFieldWidget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<StatefulWidget> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final formKey = GlobalKey<FormState>();

  String? genderValueChoose;
  String? bloodValueChoose;

  LogInController logInController = Get.put(LogInController());
  EditController editController = Get.put(EditController());

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
    editController.statusController.text = logInController.status ?? "";
    editController.genderController.text = logInController.gender ?? "";
    genderValueChoose = editController.genderController.text;
    bloodValueChoose = editController.bloodTypeController.text;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const BottomNavigatorBarPatient())),
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
        backgroundColor: const Color(0xff8E42CA),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 300,
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
                            spreadRadius: 100)
                      ]),
                  transform: Matrix4.translation(Vector3(-100, 50, 0)),
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
                            spreadRadius: 100)
                      ]),
                  transform: Matrix4.translation(Vector3(200, 500, 0)),
                ),
                Container(
                  height: 300,
                  width: 500,
                  decoration: const BoxDecoration(
                      color: Color(0xff8E42CA),
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
                              color: Color(0xFFD0B1EA),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(400))),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const Positioned(
                                top: 0,
                                child: SizedBox(
                                  height: 230,
                                  width: 230,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage("images/messagedoctor.jpeg"),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                    onPressed: () {},
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
                      TextFormFieldWidget(
                        controller: editController.nameController,
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
                        controller: editController.emailController,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          size: 40,
                          color: Color(0xff9747FF),
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
                      TextFormFieldWidget(
                        controller: editController.phoneNumberController,
                        prefixIcon: const Icon(
                          Icons.phone_android,
                          size: 40,
                          color: Color(0xff9747FF),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldWidget(
                        controller: editController.ageController,
                        prefixIcon: const Icon(
                          Icons.calendar_month_outlined,
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
                            height: 65,
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
                                                  fontWeight: FontWeight.w400)))
                                    ],
                                    onChanged: (val) {
                                      setState(() {
                                        genderValueChoose = val;
                                        editController.genderController.text =
                                            genderValueChoose!;
                                      });
                                    })
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 220,
                            height: 65,
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
                                  Icons.bloodtype,
                                  color: Color(0xff9747FF),
                                  size: 40,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                DropdownButton(
                                    menuMaxHeight: 200,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    dropdownColor: const Color(0xffBB84E8),
                                    iconSize: 30,
                                    focusColor: const Color(0xff9747FF),
                                    hint: const Text(
                                      "blood Type       ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                    value: bloodValueChoose,
                                    items: const [
                                      DropdownMenuItem(
                                          value: "A%2B",
                                          child: Text("A+",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.w400))),
                                      DropdownMenuItem(
                                          value: "A-",
                                          child: Text("A-",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.w400))),
                                      DropdownMenuItem(
                                          value: "B%2B",
                                          child: Text("B+",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.w400))),
                                      DropdownMenuItem(
                                          value: "B-",
                                          child: Text("B-",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.w400))),
                                      DropdownMenuItem(
                                          value: "AB%2B",
                                          child: Text("AB+",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.w400))),
                                      DropdownMenuItem(
                                          value: "AB-",
                                          child: Text("AB-",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.w400))),
                                      DropdownMenuItem(
                                          value: "O%2B",
                                          child: Text("O+",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.w400))),
                                      DropdownMenuItem(
                                          value: "O-",
                                          child: Text("O-",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400)))
                                    ],
                                    onChanged: (val) {
                                      setState(() {
                                        bloodValueChoose = val;
                                        editController.bloodTypeController
                                            .text = bloodValueChoose!;
                                        print(bloodValueChoose);
                                      });
                                    })
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldWidget(
                        controller: editController.statusController,
                        prefixIcon: const Icon(
                          Icons.person,
                          size: 40,
                          color: Color(0xff9747FF),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ButtonWidget(
                        text: 'Save',
                        onClicked: () {
                          final form = formKey.currentState!;
                          if (form.validate()) {
                            editController.edit();

                            logInController.nationalNumberController.text =
                                logInController.nationlId!;
                            logInController.passwordController.text =
                                logInController.password!;
                            logInController.logIn();
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
}
