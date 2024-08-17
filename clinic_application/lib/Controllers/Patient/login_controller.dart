import 'dart:convert';

import 'package:clinic_application/Screens/doctor/bottom_navigator_bar_doctor.dart';
import 'package:clinic_application/Screens/patient/bottom_navigator_bar_patient.dart';
import 'package:clinic_application/utils/api_endPoint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogInController extends GetxController {
  String? name;
  String? nationlId;
  String? phoneNumber;
  String? email;
  int? age;
  String? gender;
  String? status;
  String? bloodType;
  List? image;
  String? password;
  String? speciality;
  String? address;
  String? specializeIn;
  String? appointmentPrice;
  String? description;
  String? aboutDoctor;

  var role;
  TextEditingController nationalNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> logIn() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'accept': ' */*',
        'Charset': 'utf-8',
        'transfer-encoding': 'chunked'
      };
      var url = Uri.parse(
          ApiEndPoints.basePatientUrl + ApiEndPoints.patientEndPoints.logIn);
      Map body = {
        'nationalID': nationalNumberController.text,
        'password': passwordController.text
      };
      http.Response response =
          await http.post(url, headers: headers, body: jsonEncode(body));

      if (kDebugMode) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");
      }

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        name = json['name'];
        nationlId = json['nationalID'];
        phoneNumber = json['phoneNumber'];
        email = json['email'];
        age = json['age'];
        gender = json['gender'];
        status = json['status'];
        image?[0] = json['clinicPhotos'];
        password = passwordController.text;
        speciality = json['spicialty'];
        address = json['address'];
        specializeIn = json['specializeIn'];
        appointmentPrice = json['appointmentPrice'];
        description = json['description'];
        aboutDoctor = json['aboutDoctor'];

        role = json['roles'][0];
        var token = json['token'];
        if (kDebugMode) {
          print("Body:$name");
          print("Body:$role");
          print("Body:$json");
          print("Token:$token");
        }
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);
        nationalNumberController.clear();
        passwordController.clear();
        if (role == "Patient") {
          Get.off(const BottomNavigatorBarPatient());
        } else if (role == "Doctor") {
          Get.off(const BottomNavigatorBarDoctor());
        }
      } else {
        throw jsonDecode(response.body)["message"] ?? "Something went wrong";
      }
    } catch (e) {
      print(e.toString());
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text("Warning"),
              children: [Text("$e")],
            );
          });
    }
  }
}
