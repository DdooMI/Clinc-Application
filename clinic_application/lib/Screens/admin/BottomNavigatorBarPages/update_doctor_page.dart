import 'package:clinic_application/Screens/admin/BottomNavigatorBarPages/widget/button_admin.dart';
import 'package:clinic_application/Screens/admin/BottomNavigatorBarPages/widget/text_form_field_admin.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class UpdateDoctorPage extends StatefulWidget {
  const UpdateDoctorPage({super.key});

  @override
  State<StatefulWidget> createState() => _UpdateDoctorPageState();
}

class _UpdateDoctorPageState extends State<UpdateDoctorPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmpassController = TextEditingController();
  String? genderValueChoose;
  String? bloodValueChoose;
  bool passwordSeen = true;
  bool confirmPasswordSeen = true;

  @override
  void initState() {
    super.initState();

    emailController.addListener(onListen);
  }

  @override
  void dispose() {
    emailController.removeListener(onListen);

    super.dispose();
  }

  void onListen() => setState(() {});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffC6BDBD),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () => Navigator.of(context).pop(),
              // pushReplacement(
              //     MaterialPageRoute(
              //         builder: (context) => const BottomNavigatorBarAdmin())),
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Color(0xffFFFFFF),
              ));
        }),
        title: const Text(
          "Update Doctor",
          style: TextStyle(
              color: Color(0xffFAFAFA),
              fontSize: 22,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color(0xff720404),
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
                        controller: emailController,
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
                        controller: emailController,
                        hint: "National number",
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
                        controller: emailController,
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
                                        emailController.text =
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
                            width: 210,
                            height: 55,
                            child: TextFormFieldAdminWidget(
                              controller: emailController,
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
                        controller: emailController,
                        hint: "Speciality",
                        prefixIcon: const Icon(
                          Icons.phone_android,
                          size: 40,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldAdminWidget(
                        controller: emailController,
                        hint: "Location",
                        prefixIcon: const Icon(
                          Icons.phone_android,
                          size: 40,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldAdminWidget(
                        controller: emailController,
                        hint: "Email",
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          size: 40,
                          color: Color(0xff000000),
                        ),
                        suffixIcon: emailController.text.isEmpty
                            ? Container(width: 0)
                            : IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => emailController.clear(),
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
                        controller: emailController,
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
                          if (value!.isEmpty) {
                            return "Enter Password";
                          } else if (emailController.text.length < 6) {
                            return "Password should be greater than 6 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ButtonAdminWidget(
                        text: 'Save',
                        onClicked: () {
                          final form = formKey.currentState!;
                          if (form.validate()) {}
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
