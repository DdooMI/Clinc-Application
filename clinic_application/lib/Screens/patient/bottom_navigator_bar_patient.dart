import 'package:clinic_application/Screens/patient/BottomNavBarPages/book.dart';
import 'package:clinic_application/Screens/patient/BottomNavBarPages/favorite.dart';
import 'package:clinic_application/Screens/patient/BottomNavBarPages/home.dart';
import 'package:clinic_application/Screens/patient/BottomNavBarPages/message.dart';
import 'package:clinic_application/Screens/patient/BottomNavBarPages/notification.dart';
import 'package:flutter/material.dart';

class BottomNavigatorBarPatient extends StatefulWidget {
  const BottomNavigatorBarPatient({super.key});
  @override
  State<BottomNavigatorBarPatient> createState() =>
      _BottomNavigatorBarPatientState();
}

class _BottomNavigatorBarPatientState extends State<BottomNavigatorBarPatient> {
  int selectedIndex = 0;

  void _buttonNaviBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> pages = [
    const HomePatient(),
    const FavoritePatient(),
    const BookPatient(),
    const MessagePatient(),
    const NotificationPatient()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: const Color(0xff471AA0),
        unselectedItemColor: const Color(0xffFFFFFF),
        currentIndex: selectedIndex,
        onTap: _buttonNaviBar,
        iconSize: 40,
        unselectedIconTheme: IconThemeData(color: Color(0xff471AA0)),
        selectedIconTheme: IconThemeData(size: 50),
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: "",
              activeIcon: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Color(0xff471AA0),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: const Icon(
                  Icons.home,
                  color: Color(0xffFFFFFF),
                  size: 30,
                ),
              )),
          BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: "",
              activeIcon: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Color(0xff471AA0),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: const Icon(
                  Icons.favorite,
                  color: Color(0xffFFFFFF),
                  size: 30,
                ),
              )),
          BottomNavigationBarItem(
              icon: const Icon(Icons.menu_book_rounded),
              label: "",
              activeIcon: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Color(0xff471AA0),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: const Icon(
                  Icons.menu_book_rounded,
                  color: Color(0xffFFFFFF),
                  size: 30,
                ),
              )),
          BottomNavigationBarItem(
              icon: const Icon(Icons.message_rounded),
              label: "",
              activeIcon: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Color(0xff471AA0),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: const Icon(
                  Icons.message_rounded,
                  color: Color(0xffFFFFFF),
                  size: 30,
                ),
              )),
          BottomNavigationBarItem(
              icon: const Icon(Icons.notifications_active),
              label: "",
              activeIcon: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Color(0xff471AA0),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: const Icon(
                  Icons.notifications_active,
                  color: Color(0xffFFFFFF),
                  size: 30,
                ),
              ))
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xffD4CCCC),
      ),
      body: pages[selectedIndex],
    );
  }
}
