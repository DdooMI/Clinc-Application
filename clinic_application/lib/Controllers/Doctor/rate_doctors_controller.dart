import 'dart:convert';

import 'package:clinic_application/utils/api_endPoint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RateController extends GetxController {
  TextEditingController nationalNumberController = TextEditingController();
  List<dynamic>? json;
  int? listLength;
  Future<void> rate() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'accept': '*/*',
        'Charset': 'utf-8',
        'transfer-encoding': 'chunked'
      };
      var url = Uri.parse(
          "${ApiEndPoints.baseDoctorUrl}${ApiEndPoints.doctorEndPoints.rate}?DoctorNationalID=${nationalNumberController.text}");

      http.Response response = await http.get(url, headers: headers);
      if (kDebugMode) {
        print("view ${response.statusCode}");
      }

      if (response.statusCode == 200) {
        json = jsonDecode(response.body);
        listLength = json?.length;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
