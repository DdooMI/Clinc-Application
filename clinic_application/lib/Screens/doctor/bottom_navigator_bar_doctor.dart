import 'package:clinic_application/Screens/doctor/bottomNavigatorBarPages/Rating_page.dart';
import 'package:clinic_application/Screens/doctor/bottomNavigatorBarPages/view_inves.dart';
import 'package:clinic_application/Screens/doctor/bottomNavigatorBarPages/waiting_list_patients.dart';
import 'package:flutter/material.dart';

class BottomNavigatorBarDoctor extends StatefulWidget {
  const BottomNavigatorBarDoctor({super.key});
  @override
  State<BottomNavigatorBarDoctor> createState() =>
      _BottomNavigatorBarDoctorState();
}

class _BottomNavigatorBarDoctorState extends State<BottomNavigatorBarDoctor> {
  int selectedIndex = 0;

  void _buttonNaviBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> pages = [
    const WaitingListDoctor(),
    const RatingDoctorPage(),
    const ViewInvestDoctor(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: const Color(0xff4485FD),
        unselectedItemColor: const Color(0xffFFFFFF),
        currentIndex: selectedIndex,
        onTap: _buttonNaviBar,
        iconSize: 40,
        unselectedIconTheme: IconThemeData(color: Color(0xff3A71D7)),
        selectedIconTheme: IconThemeData(size: 50),
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: "",
              activeIcon: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Color(0xff3A71D7),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: const Icon(
                  Icons.home,
                  color: Color(0xffFFFFFF),
                  size: 30,
                ),
              )),
          BottomNavigationBarItem(
              icon: const Icon(Icons.star),
              label: "",
              activeIcon: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Color(0xff3A71D7),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: const Icon(
                  Icons.star,
                  color: Color(0xffFFFFFF),
                  size: 30,
                ),
              )),
          BottomNavigationBarItem(
              icon: const Icon(Icons.mail),
              label: "",
              activeIcon: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Color(0xff3A71D7),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: const Icon(
                  Icons.mail,
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
