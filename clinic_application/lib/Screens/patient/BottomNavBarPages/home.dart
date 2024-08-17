import 'package:clinic_application/Controllers/Patient/login_controller.dart';
import 'package:clinic_application/Controllers/Patient/search_patient_controller.dart';
import 'package:clinic_application/Screens/patient/BottomNavBarPages/search_page.dart';
import 'package:clinic_application/Screens/patient/BottomNavBarPages/top_doctors_page.dart';
import 'package:clinic_application/Screens/patient/BottomNavBarPages/widgets/categories_widget.dart';
import 'package:clinic_application/Screens/patient/BottomNavBarPages/widgets/home_top_doctor_widget.dart';
import 'package:clinic_application/widgets/drawer_Pages.dart/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vector_math/vector_math_64.dart';

class HomePatient extends StatefulWidget {
  const HomePatient({super.key});
  @override
  State<HomePatient> createState() => _HomePatientState();
}

class _HomePatientState extends State<HomePatient> {
  LogInController logInController = Get.put(LogInController());
  final formKey = GlobalKey<FormState>();

  SearchApiController searchApiController = Get.put(SearchApiController());

  @override
  Widget build(BuildContext context) {
    int length = 5;
    double heigth = 100;
    double containerheigth = 130;
    if (searchApiController.listLength! < 5) {
      length = searchApiController.listLength!;
      heigth = length * heigth;
      containerheigth = length * containerheigth;
    }
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(
                  Icons.menu,
                  size: 30,
                  color: Color(0xffFFFFFF),
                ));
          }),
          title: Text(
            "Hi, ${logInController.name}",
            style: const TextStyle(
                color: Color(0xffFAFAFA),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          backgroundColor: Color(0xff8E42CA),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SearchPagePatient()));
                  CategoryWidget.specialty = null;
                  searchApiController.listLength = 0;

                  searchApiController.searchApi();
                },
                icon: const Icon(
                  Icons.search,
                  size: 30,
                  color: Color(0xffFFFFFF),
                ))
          ],
        ),
        drawer: const DrawerWidget(),
        body: ListView(
          children: [
            Container(
              height: 420,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        color: Color(0xFFD0B1EA),
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFFD0B1EA),
                              blurStyle: BlurStyle.normal,
                              blurRadius: 50,
                              spreadRadius: 70)
                        ]),
                    transform: Matrix4.translation(Vector3(-150, 100, 0)),
                  ),
                  Container(
                    height: 80,
                    decoration: const BoxDecoration(
                        color: Color(0xff8E42CA),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Center(
                      child: Container(
                        child: const Text(
                          "Find Your Doctor",
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        margin: EdgeInsets.only(left: 8),
                        //color: Color(0xff19DE19),
                        height: 320,
                        width: 415,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Container(
                                    child: const Text(
                                      "Categories",
                                      style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CategoryWidget(
                                  color: const Color(0xff4485FD),
                                  icon: Icon(
                                    MdiIcons.stethoscope,
                                    size: 80,
                                    color: const Color(0xffFFFFFF),
                                  ),
                                  text: "Consultation",
                                ),
                                CategoryWidget(
                                  color: const Color(0xffA584FF),
                                  icon: Icon(
                                    MdiIcons.tooth,
                                    size: 80,
                                    color: const Color(0xffFFFFFF),
                                  ),
                                  text: "Dental",
                                ),
                                CategoryWidget(
                                  color: const Color(0xffFF7854),
                                  icon: const Icon(
                                    Icons.favorite,
                                    size: 80,
                                    color: Color(0xffFFFFFF),
                                  ),
                                  text: "Heart",
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CategoryWidget(
                                  color: const Color(0xff00CC6A),
                                  icon: Icon(
                                    MdiIcons.medicationOutline,
                                    size: 80,
                                    color: const Color(0xffFFFFFF),
                                  ),
                                  text: "Medicines",
                                ),
                                CategoryWidget(
                                  color: const Color(0xff00C9E4),
                                  icon: Icon(
                                    MdiIcons.human,
                                    size: 80,
                                    color: const Color(0xffFFFFFF),
                                  ),
                                  text: "Physician",
                                ),
                                CategoryWidget(
                                  color: const Color(0xffFD44B3),
                                  icon: Icon(
                                    MdiIcons.bandage,
                                    size: 80,
                                    color: const Color(0xffFFFFFF),
                                  ),
                                  text: "Skin",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: containerheigth,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Top Doctors",
                          style: TextStyle(
                              color: Color(0xff25282B),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const TopDoctorsPagePatient()));

                            searchApiController.searchApi();
                          },
                          child: const Text(
                            "View all",
                            style: TextStyle(
                                color: Color(0xff4485FD),
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: heigth,
                    width: 440,
                    child: ListView.builder(
                        itemCount: length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              HomeTopDoctorWidget(
                                doctorName: searchApiController.json?[index]
                                    ['name'],
                                doctorSpec: searchApiController.json?[index]
                                    ['spicialty'],
                                doctorPlace: searchApiController.json?[index]
                                    ['address'],
                                doctorImage: "images/topDoctorone.png",
                                doctorRate: "(122)",
                                doctoremail: searchApiController.json?[index]
                                    ['email'],
                                doctorphone: searchApiController.json?[index]
                                    ['phoneNumber'],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
