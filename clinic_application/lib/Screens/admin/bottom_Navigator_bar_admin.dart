import 'package:clinic_application/Screens/admin/BottomNavigatorBarPages/doctor_list_page.dart';
import 'package:clinic_application/Screens/admin/BottomNavigatorBarPages/doctor_requests_page.dart';
import 'package:clinic_application/Screens/admin/BottomNavigatorBarPages/settings.dart';
import 'package:flutter/material.dart';

class BottomNavigatorBarAdmin extends StatefulWidget {
  const BottomNavigatorBarAdmin({super.key});
  @override
  State<BottomNavigatorBarAdmin> createState() =>
      _BottomNavigatorBarAdminState();
}

class _BottomNavigatorBarAdminState extends State<BottomNavigatorBarAdmin> {
  int selectedIndex = 0;

  void _buttonNaviBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> pages = [
    const DoctorListPage(),
    const DoctorRequestsPage(),
    const SettingsAdminPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: const Color(0xff000000),
        unselectedItemColor: const Color(0xffFFFFFF),
        currentIndex: selectedIndex,
        onTap: _buttonNaviBar,
        iconSize: 40,
        unselectedIconTheme: IconThemeData(color: Color(0xff000000)),
        selectedIconTheme: IconThemeData(size: 50),
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: "",
              activeIcon: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Color(0xff720404),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: const Icon(
                  Icons.home,
                  color: Color(0xffFFFFFF),
                  size: 30,
                ),
              )),
          BottomNavigationBarItem(
              icon: const Icon(Icons.notification_add),
              label: "",
              activeIcon: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Color(0xff720404),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: const Icon(
                  Icons.notification_add,
                  color: Color(0xffFFFFFF),
                  size: 30,
                ),
              )),
          BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle_rounded),
              label: "",
              activeIcon: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Color(0xff720404),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: const Icon(
                  Icons.account_circle_rounded,
                  color: Color(0xffFFFFFF),
                  size: 30,
                ),
              )),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xffD4CCCC),
      ),
      body: pages[selectedIndex],
    );
  }
}
