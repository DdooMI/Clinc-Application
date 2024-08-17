import 'dart:convert';

import 'package:clinic_application/Screens/admin/BottomNavigatorBarPages/search_page_admin.dart';
import 'package:clinic_application/utils/api_endPoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchAdminController extends GetxController {
  TextEditingController searchNameController = TextEditingController();
  TextEditingController searchSpecController = TextEditingController();
  TextEditingController searchAreaController = TextEditingController();
  List<dynamic>? json;
  int? listLength;
  Future<void> searchAdmin() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.basePatientUrl + ApiEndPoints.patientEndPoints.search);
      Map body = {
        'docName': searchNameController.text,
        'docAddress': searchAreaController.text,
        'docSpecialty': searchSpecController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        json = jsonDecode(response.body);
        listLength = json?.length;
        Get.off(const SearchPageAdmin());
      } else {
        throw jsonDecode(response.body)["message"] ?? "error";
      }
    } catch (e) {
      Get.back();
    }
  }
}
