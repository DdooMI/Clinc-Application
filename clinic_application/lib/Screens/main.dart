import 'package:clinic_application/Provider/favorite_provider.dart';
import 'package:clinic_application/Screens/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboarding") ?? false;
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Get.put(FavoritesController());
  runApp(MyApp(
    onboarding: onboarding,
  ));
}

class MyApp extends StatefulWidget {
  final bool onboarding;
  const MyApp({super.key, this.onboarding = false});

  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //home: widget.onboarding ? const Login() : const Intro(),
      home: Intro(),
    );
  }
}
