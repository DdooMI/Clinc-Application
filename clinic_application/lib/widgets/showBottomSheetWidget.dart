// ignore_for_file: file_names
import 'package:clinic_application/widgets/button_widget.dart';
import 'package:clinic_application/widgets/textFormFieldWidget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ShowSheetWidget extends StatefulWidget {
  const ShowSheetWidget({super.key});
  @override
  State<ShowSheetWidget> createState() => _ShowSheetWidgetState();
}

class _ShowSheetWidgetState extends State<ShowSheetWidget> {
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final codeController = TextEditingController();
  final passwordController1 = TextEditingController();
  final passwordController2 = TextEditingController();
  bool forgetpasswordSeen = true;
  bool forgetconfirmPasswordSeen = true;
  @override
  void initState() {
    super.initState();

    emailController.addListener(onListen);
    codeController.addListener(onListen);
    passwordController1.addListener(onListen);
    passwordController2.addListener(onListen);
  }

  @override
  void dispose() {
    emailController.removeListener(onListen);
    codeController.removeListener(onListen);
    passwordController1.removeListener(onListen);
    passwordController2.removeListener(onListen);
    super.dispose();
  }

  void onListen() => setState(() {});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 380,
                  width: 500,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 5,
                        width: 130,
                        decoration: const BoxDecoration(
                            color: Color(0xffC4C4C4),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 90,
                        width: 360,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Forget password",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff000000)),
                            ),
                            Text(
                              "Enter your National ID for the verification proccesss, we will send 4 digits code to your phone number.",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff677294)),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Form(
                        key: formKey1,
                        child: TextFormFieldWidget(
                          controller: emailController,
                          label: "National ID",
                          prefixIcon: const Icon(
                            Icons.person,
                            size: 40,
                            color: Color(0xff5682D3),
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonWidget(
                          text: "Continue",
                          onClicked: () {
                            final form1 = formKey1.currentState!;
                            if (form1.validate()) {
                              final email = emailController.text;
                              if (kDebugMode) {
                                print(email);
                              }
                              Navigator.pop(context);
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
                                        padding: const EdgeInsets.all(20),
                                        height: 380,
                                        width: 500,
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              height: 5,
                                              width: 130,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xffC4C4C4),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6))),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const SizedBox(
                                              height: 90,
                                              width: 360,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Enter 4 Digits Code",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xff000000)),
                                                  ),
                                                  Text(
                                                    "Enter the 4 digits code that you received onyour email.",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff677294)),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            Form(
                                                key: formKey2,
                                                child: TextFormFieldWidget(
                                                  textAlign: TextAlign.center,
                                                  controller: codeController,
                                                  hint: "Enter 4 digits",
                                                  validator: (code) => code !=
                                                              null &&
                                                          code.length != 4
                                                      ? 'Enter a valid email'
                                                      : null,
                                                )),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            ButtonWidget(
                                              text: "Continue",
                                              onClicked: () {
                                                final form2 =
                                                    formKey2.currentState!;
                                                if (form2.validate()) {
                                                  final code =
                                                      codeController.text;
                                                  if (kDebugMode) {
                                                    print(code);
                                                  }
                                                  Navigator.pop(context);
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return Padding(
                                                          padding: EdgeInsets.only(
                                                              bottom: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets
                                                                  .bottom),
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(20),
                                                            height: 500,
                                                            width: 500,
                                                            child: Column(
                                                              children: [
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Container(
                                                                  height: 5,
                                                                  width: 130,
                                                                  decoration: const BoxDecoration(
                                                                      color: Color(
                                                                          0xffC4C4C4),
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(6))),
                                                                ),
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                const SizedBox(
                                                                  height: 90,
                                                                  width: 360,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Reset Password",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                24,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color: Color(0xff000000)),
                                                                      ),
                                                                      Text(
                                                                        "Set the new password for your account so you can login and access all the features.",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Color(0xff677294)),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 40,
                                                                ),
                                                                Form(
                                                                  key: formKey3,
                                                                  child: Column(
                                                                    children: [
                                                                      TextFormFieldWidget(
                                                                        controller:
                                                                            passwordController1,
                                                                        obscureText:
                                                                            forgetpasswordSeen,
                                                                        label:
                                                                            "Password",
                                                                        prefixIcon:
                                                                            const Icon(
                                                                          Icons
                                                                              .lock,
                                                                          size:
                                                                              40,
                                                                          color:
                                                                              Color(0xff5682D3),
                                                                        ),
                                                                        suffix:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              forgetpasswordSeen = !forgetpasswordSeen;
                                                                            });
                                                                          },
                                                                          child: Icon(forgetpasswordSeen
                                                                              ? Icons.visibility
                                                                              : Icons.visibility_off),
                                                                        ),
                                                                        validator:
                                                                            (value) {
                                                                          if (value!
                                                                              .isEmpty) {
                                                                            return "Enter Password";
                                                                          } else if (passwordController1.text.length <
                                                                              6) {
                                                                            return "Password should be greater than 6 characters";
                                                                          }
                                                                          return null;
                                                                        },
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      TextFormFieldWidget(
                                                                        controller:
                                                                            passwordController2,
                                                                        obscureText:
                                                                            forgetconfirmPasswordSeen,
                                                                        label:
                                                                            "Confirm Password",
                                                                        prefixIcon:
                                                                            const Icon(
                                                                          Icons
                                                                              .lock,
                                                                          size:
                                                                              40,
                                                                          color:
                                                                              Color(0xff5682D3),
                                                                        ),
                                                                        suffix:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              forgetconfirmPasswordSeen = !forgetconfirmPasswordSeen;
                                                                            });
                                                                          },
                                                                          child: Icon(forgetconfirmPasswordSeen
                                                                              ? Icons.visibility
                                                                              : Icons.visibility_off),
                                                                        ),
                                                                        validator:
                                                                            (value) {
                                                                          if (value!
                                                                              .isEmpty) {
                                                                            return "Enter Password";
                                                                          } else if (passwordController2.text !=
                                                                              passwordController1
                                                                                  .text) {
                                                                            return "Wrong Password";
                                                                          } else if (passwordController2.text.length <
                                                                              6) {
                                                                            return "Password should be greater than 6 characters";
                                                                          }
                                                                          return null;
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                ButtonWidget(
                                                                    text:
                                                                        "Update Password",
                                                                    onClicked:
                                                                        () {
                                                                      final forgetPasswordForm3 =
                                                                          formKey3
                                                                              .currentState!;
                                                                      if (forgetPasswordForm3
                                                                          .validate()) {
                                                                        final password =
                                                                            passwordController1.text;
                                                                        if (kDebugMode) {
                                                                          print(
                                                                              password);
                                                                        }
                                                                        Navigator.pop(
                                                                            context);
                                                                      }
                                                                    }),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                          }),
                    ],
                  ),
                ),
              );
            });
      },
      child: const Text(
        "Forget Password ?",
        style: TextStyle(
            color: Color(0xff5682D3),
            fontSize: 15,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
