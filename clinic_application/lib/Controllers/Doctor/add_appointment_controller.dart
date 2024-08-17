import 'dart:convert';

import 'package:clinic_application/utils/api_endPoint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddAppointmentController extends GetxController {
  TextEditingController nationalNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  Future<void> addApoint() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseDoctorUrl +
          ApiEndPoints.doctorEndPoints.addAppointments);

      Map body = {
        'dto': {
          'doctorId': nationalNumberController.text,
          'appointments': [
            {'date': dateController.text}
          ]
        }
      };

      http.Response response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      if (kDebugMode) {
        print("Response id: ${nationalNumberController.text}");
        print("Response date: ${dateController.text}");
      }
      if (kDebugMode) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");
      }

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        Get.snackbar('Success', 'Appointment added successfully',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
