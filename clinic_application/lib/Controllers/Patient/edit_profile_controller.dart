import 'dart:convert';

import 'package:clinic_application/utils/api_endPoint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EditController extends GetxController {
  var role;
  TextEditingController nationalNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController bloodTypeController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  Future<void> edit() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          "${ApiEndPoints.basePatientUrl}${ApiEndPoints.patientEndPoints.edit}?Name=${nameController.text}&NationalID=${nationalNumberController.text}&PhoneNumber=${phoneNumberController.text}&Email=${emailController.text}&Age=${ageController.text}&Gender=${genderController.text}&Status=${statusController.text}&BloodType=${bloodTypeController.text}");

      http.Response response = await http.put(url, headers: headers);

      if (kDebugMode) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");
      }

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (kDebugMode) {
          print("Body:$role");
          print("Body:$json");
        }
      } else {
        throw jsonDecode(response.body)["message Body"] ?? "error";
      }
    } catch (e) {
      print(e.toString());
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text("Error try"),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
