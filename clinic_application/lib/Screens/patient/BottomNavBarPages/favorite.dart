import 'package:clinic_application/Provider/favorite_provider.dart';
import 'package:clinic_application/Screens/patient/BottomNavBarPages/widgets/home_top_doctor_widget.dart';
import 'package:clinic_application/widgets/drawer_Pages.dart/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePatient extends StatelessWidget {
  const FavoritePatient({super.key});

  @override
  Widget build(BuildContext context) {
    FavoritesController favoritesController = Get.find<FavoritesController>();
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
          child: AppBar(
            toolbarHeight: 80,
            backgroundColor: const Color(0xffFFFFFF),
            title: const Text(
              "Favorite",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff471AA0)),
            ),
            leading: Builder(builder: (context) {
              return IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(
                    Icons.menu,
                    size: 30,
                    color: Color(0xff471AA0),
                  ));
            }),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFD0B1EA),
      body: Obx(() {
        return ListView.builder(
          itemCount: favoritesController.favoriteDoctors.length,
          itemBuilder: (context, index) {
            final doctor = favoritesController.favoriteDoctors[index];
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                HomeTopDoctorWidget(
                  doctorName: doctor['name'],
                  doctorSpec: doctor['spicialty'],
                  doctorPlace: doctor['address'],
                  doctorImage: "images/topDoctorone.png",
                  doctorRate: "(122)",
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
