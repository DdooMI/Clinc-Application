import 'dart:convert';

import 'package:clinic_application/utils/api_endPoint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignupAsDoctorController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController nationalNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> signUp() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiEndPoints.basePatientUrl +
          ApiEndPoints.patientEndPoints.signupAsDoctor);
      Map body = {
        'name': nameController.text,
        'nationalID': nationalNumberController.text,
        'phoneNumber': phoneNumberController.text,
        'email': emailController.text.trim(),
        'age': ageController.text,
        'gender': genderController.text,
        'spicialty': specialityController.text,
        'address': addressController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var token = json['token'];
        if (kDebugMode) {
          print("Body:$json");
          print("Token:$token");
        }
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);
        nameController.clear();
        nationalNumberController.clear();
        phoneNumberController.clear();
        ageController.clear();
        genderController.clear();
        emailController.clear();
        specialityController.clear();
        addressController.clear();
      } else {
        throw jsonDecode(response.body)["message"] ?? "error";
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
