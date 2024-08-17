import 'dart:convert';

import 'package:clinic_application/utils/api_endPoint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ReplyInvestController extends GetxController {
  TextEditingController replyController = TextEditingController();
  int? investId;

  Future<void> reply() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          "${ApiEndPoints.baseDoctorUrl}${ApiEndPoints.doctorEndPoints.replyInvestigates}?investigateId=$investId");
      Map body = {'investigateId': investId, 'replay': replyController.text};

      http.Response response =
          await http.post(url, headers: headers, body: jsonEncode(body));

      if (kDebugMode) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");
      }

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (kDebugMode) {
          print("Body:$json");
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
