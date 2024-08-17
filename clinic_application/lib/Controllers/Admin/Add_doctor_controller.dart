import 'dart:convert';

import 'package:clinic_application/Controllers/Admin/search_admin_controller.dart';
import 'package:clinic_application/utils/api_endPoint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddDoctorController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController nationalNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SearchAllDoctorController searchAllDoctorController =
      Get.put(SearchAllDoctorController());
  Future<void> addDoctor() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          "${ApiEndPoints.baseAdminUrl}${ApiEndPoints.adminEndPoints.addDoctor}?Name=${nameController.text}&NationalID=${nationalNumberController.text}&PhoneNumber=${phoneNumberController.text}&Email=${emailController.text}&Age=${ageController.text}&Gender=${genderController.text}&Spicialty=${specialityController.text}&Address=${addressController.text}&Password=${passwordController.text}");

      http.Response response = await http.post(url, headers: headers);

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
        passwordController.clear();
        addressController.clear();
        specialityController.clear();
        searchAllDoctorController.searchAdmin();
      } else {
        throw jsonDecode(response.body)["message"] ?? "error add";
      }
    } catch (e) {
      print(e.toString());
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text("Error"),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
