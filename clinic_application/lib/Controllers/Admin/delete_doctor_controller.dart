import 'dart:convert';

import 'package:clinic_application/Controllers/Admin/search_admin_controller.dart';
import 'package:clinic_application/utils/api_endPoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DeleteDoctorController extends GetxController {
  TextEditingController nationalNumberController = TextEditingController();
  SearchAllDoctorController searchAllDoctorController =
      Get.put(SearchAllDoctorController());
  Future<void> deleteDoctor() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          "${ApiEndPoints.baseAdminUrl}${ApiEndPoints.adminEndPoints.deleteDoctor}?doctorId=${nationalNumberController.text}");

      http.Response response = await http.delete(url, headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        nationalNumberController.clear();
        searchAllDoctorController.searchAdmin();
        // await Get.off(const BottomNavigatorBarAdmin());
      } else {
        throw jsonDecode(response.body)["message"] ?? "error add";
      }
    } catch (e) {
      Get.back();
    }
  }
}
