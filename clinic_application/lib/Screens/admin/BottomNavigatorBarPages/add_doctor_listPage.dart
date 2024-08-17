import 'package:clinic_application/Controllers/Admin/Add_doctor_controller.dart';
import 'package:clinic_application/Controllers/Admin/search_admin_controller.dart';
import 'package:clinic_application/Controllers/Admin/view_request_doctors_controller.dart';
import 'package:clinic_application/Screens/admin/BottomNavigatorBarPages/widget/button_admin.dart';
import 'package:clinic_application/Screens/admin/BottomNavigatorBarPages/widget/text_form_field_admin.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDoctorListPage extends StatefulWidget {
  const AddDoctorListPage({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AddDoctorListPageState();
}

class _AddDoctorListPageState extends State<AddDoctorListPage> {
  final formKey = GlobalKey<FormState>();
  AddDoctorController addDoctorController = Get.put(AddDoctorController());
  SearchAllDoctorController searchAdminController =
      Get.put(SearchAllDoctorController());
  ViewRequestDoctorsController viewRequestDoctorsController =
      Get.put(ViewRequestDoctorsController());

  String? genderValueChoose;

  bool passwordSeen = true;
  bool confirmPasswordSeen = true;

  void onListen() => setState(() {});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffC6BDBD),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
          child: AppBar(
            leading: Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    searchAdminController.searchAdmin();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Color(0xffFFFFFF),
                  ));
            }),
            title: const Text(
              "Add Doctor",
              style: TextStyle(
                  color: Color(0xffFAFAFA),
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            backgroundColor: const Color(0xff720404),
            toolbarHeight: 80,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Form(
                key: formKey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormFieldAdminWidget(
                        controller: addDoctorController.nameController,
                        hint: "Full Name",
                        prefixIcon: const Icon(
                          Icons.person_outline_sharp,
                          size: 40,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldAdminWidget(
                        controller:
                            addDoctorController.nationalNumberController,
                        hint: "National number",
                        prefixIcon: const Icon(
                          Icons.numbers_sharp,
                          size: 40,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldAdminWidget(
                        controller: addDoctorController.phoneNumberController,
                        hint: "Mobile number",
                        prefixIcon: const Icon(
                          Icons.phone_android,
                          size: 40,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 160,
                            height: 55,
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        width: 3, color: Color(0xff000000)),
                                    bottom: BorderSide(
                                        width: 3, color: Color(0xff000000)),
                                    left: BorderSide(
                                        width: 3, color: Color(0xff000000)),
                                    right: BorderSide(
                                        width: 3, color: Color(0xff000000))),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.male,
                                  color: Color(0xff000000),
                                  size: 40,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                DropdownButton(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    dropdownColor: const Color(0xffCD5F5F),
                                    iconSize: 30,
                                    focusColor: const Color(0xffCD5F5F),
                                    hint: const Text(
                                      "Gender",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Color(0xff000000)),
                                    ),
                                    value: genderValueChoose,
                                    items: const [
                                      DropdownMenuItem(
                                          value: "Male",
                                          child: Text("Male",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff000000)))),
                                      DropdownMenuItem(
                                          value: "Female",
                                          child: Text("Female",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400)))
                                    ],
                                    onChanged: (val) {
                                      setState(() {
                                        genderValueChoose = val;
                                        addDoctorController.genderController
                                            .text = genderValueChoose!;
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
                            width: 210,
                            height: 55,
                            child: TextFormFieldAdminWidget(
                              controller: addDoctorController.ageController,
                              hint: "Age",
                              prefixIcon: const Icon(
                                Icons.date_range,
                                size: 40,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldAdminWidget(
                        controller: addDoctorController.specialityController,
                        hint: "Speciality",
                        prefixIcon: const Icon(
                          Icons.school,
                          size: 40,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldAdminWidget(
                        controller: addDoctorController.addressController,
                        hint: "Location",
                        prefixIcon: const Icon(
                          Icons.location_city_outlined,
                          size: 40,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldAdminWidget(
                        controller: addDoctorController.emailController,
                        hint: "Email",
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          size: 40,
                          color: Color(0xff000000),
                        ),
                        suffixIcon: addDoctorController
                                .emailController.text.isEmpty
                            ? Container(width: 0)
                            : IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () =>
                                    addDoctorController.emailController.clear(),
                              ),
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email'
                                : null,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldAdminWidget(
                        controller: addDoctorController.passwordController,
                        obscureText: passwordSeen,
                        hint: "Password",
                        prefixIcon: const Icon(
                          Icons.lock,
                          size: 40,
                          color: Color(0xff000000),
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
                        height: 30,
                      ),
                      ButtonAdminWidget(
                        text: 'Save',
                        onClicked: () async {
                          final form = formKey.currentState!;
                          if (form.validate()) {
                            viewRequestDoctorsController.viewRequestDoctor();
                            searchAdminController.searchAdmin();
                            addDoctorController.addDoctor();
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
