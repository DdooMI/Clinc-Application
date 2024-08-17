import 'dart:convert';

import 'package:clinic_application/Screens/admin/bottom_Navigator_bar_admin.dart';
import 'package:clinic_application/utils/api_endPoint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AdminLogInController extends GetxController {
  String? name;
  // ignore: prefer_typing_uninitialized_variables
  var role;
  TextEditingController userNameController = TextEditingController();
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
          ApiEndPoints.baseAdminUrl + ApiEndPoints.adminEndPoints.login);
      Map body = {
        'nationalID': userNameController.text,
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
        name = json['userName'];
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
        userNameController.clear();
        passwordController.clear();
        if (role == "Admin") {
          Get.off(const BottomNavigatorBarAdmin());
        }
      } else {
        throw jsonDecode(response.body)["message Body"] ?? "error";
      }
    } catch (e) {
      print(e.toString());
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text("Error try"),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
