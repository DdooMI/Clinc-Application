import 'dart:convert';

import 'package:clinic_application/Screens/admin/bottom_Navigator_bar_admin.dart';
import 'package:clinic_application/utils/api_endPoint.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchAllDoctorController extends GetxController {
  List<dynamic>? json;
  int? listLength;
  Future<void> searchAdmin() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.basePatientUrl + ApiEndPoints.patientEndPoints.search);
      Map body = {'docName': "", 'docAddress': "", 'docSpecialty': ""};
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        json = jsonDecode(response.body);
        listLength = json?.length;

        Get.off(const BottomNavigatorBarAdmin());
      } else {
        throw jsonDecode(response.body)["message"] ?? "error";
      }
    } catch (e) {
      Get.back();
    }
  }
}
