import 'dart:convert';

import 'package:clinic_application/Screens/doctor/bottom_navigator_bar_doctor.dart';
import 'package:clinic_application/utils/api_endPoint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EditProfileDoctor extends GetxController {
  TextEditingController nationalNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController appointmentPriceController = TextEditingController();
  TextEditingController specializeInController = TextEditingController();
  List<String> images = [];

  Future<void> edit() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          "${ApiEndPoints.baseDoctorUrl}${ApiEndPoints.doctorEndPoints.edit}/${nationalNumberController.text}");
      Map body = {
        'name': nameController.text,
        'phoneNumber': phoneNumberController.text,
        'email': emailController.text.trim(),
        'age': ageController.text,
        'gender': genderController.text,
        'spicialty': specialityController.text,
        'address': addressController.text,
        'aboutDoctor': aboutController.text,
        'description': descriptionController.text,
        'appointmentPrice': appointmentPriceController.text,
        'specializeIn': specializeInController.text,
        'clinicPhotos': images
      };

      http.Response response =
          await http.put(url, headers: headers, body: jsonEncode(body));

      if (kDebugMode) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");
      }

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        Get.off(const BottomNavigatorBarDoctor());
        if (kDebugMode) {
          print("Body:$json");
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
