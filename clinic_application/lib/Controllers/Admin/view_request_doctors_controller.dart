import 'dart:convert';

import 'package:clinic_application/utils/api_endPoint.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ViewRequestDoctorsController extends GetxController {
  List<dynamic>? json;
  int? listLength;
  Future<void> viewRequestDoctor() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseAdminUrl + ApiEndPoints.adminEndPoints.viewRequest);

      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        json = jsonDecode(response.body);
        listLength = json?.length;
      } else {
        throw jsonDecode(response.body)["message"] ?? "error show";
      }
    } catch (e) {
      Get.back();
    }
  }
}
