import 'package:clinic_application/Controllers/Patient/search_controller.dart';
import 'package:clinic_application/Controllers/Patient/search_patient_controller.dart';
import 'package:clinic_application/Screens/patient/BottomNavBarPages/widgets/categories_widget.dart';
import 'package:clinic_application/Screens/patient/BottomNavBarPages/widgets/home_top_doctor_widget.dart';
import 'package:clinic_application/Screens/patient/bottom_navigator_bar_patient.dart';
import 'package:clinic_application/widgets/search_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SearchPagePatient extends StatefulWidget {
  const SearchPagePatient({super.key});
  @override
  State<SearchPagePatient> createState() => _SearchPagePatientState();
}

class _SearchPagePatientState extends State<SearchPagePatient> {
  final formKey = GlobalKey<FormState>();
  SearchApiController searchApiController = Get.put(SearchApiController());
  SearchSSController searchController = Get.put(SearchSSController());

  String? categoryValue = CategoryWidget.specialty;
  String? specValueChoose;
  String? areaValueChoose;

  @override
  void initState() {
    super.initState();

    searchController.searchNameController.addListener(onListen);
  }

  @override
  void dispose() {
    searchController.searchNameController.removeListener(onListen);

    super.dispose();
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(20)),
            child: AppBar(
              toolbarHeight: 100,
              leading: Builder(builder: (context) {
                return IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              const BottomNavigatorBarPatient()));
                      searchController.listLength = 0;

                      searchApiController.searchApi();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Color(0xffFFFFFF),
                    ));
              }),
              title: SearchWidget(
                controller: searchController.searchNameController,
                searchFunction: () {
                  setState(() {
                    searchController.search();
                  });
                },
                micFunction: () {},
              ),
              backgroundColor: const Color(0xff8E42CA),
              // centerTitle: true,
            ),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 180,
                    height: 65,
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 3, color: Color(0xff9747FF)),
                            bottom:
                                BorderSide(width: 3, color: Color(0xff9747FF)),
                            left:
                                BorderSide(width: 3, color: Color(0xff9747FF)),
                            right:
                                BorderSide(width: 3, color: Color(0xff9747FF))),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          MdiIcons.stethoscope,
                          color: const Color(0xff9747FF),
                          size: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: 135,
                          child: DropdownButton(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              dropdownColor: const Color(0xffBB84E8),
                              icon: const Icon(Icons.keyboard_arrow_down_sharp),
                              iconSize: 40,
                              focusColor: const Color(0xff9747FF),
                              hint: Text(
                                categoryValue ?? "Specialty",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                              value: specValueChoose,
                              items: const [
                                DropdownMenuItem(
                                    value: "Consultation",
                                    child: Text("Consultation",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600))),
                                DropdownMenuItem(
                                    value: "Dental",
                                    child: Text("Dental",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400))),
                                DropdownMenuItem(
                                    value: "Heart",
                                    child: Text("Heart",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400))),
                                DropdownMenuItem(
                                    value: "Medicines",
                                    child: Text("Medicines",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400))),
                                DropdownMenuItem(
                                    value: "Physician",
                                    child: Text("Physician",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400))),
                                DropdownMenuItem(
                                    value: "Skin",
                                    child: Text("Skin",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400))),
                              ],
                              onChanged: (val) {
                                setState(() {
                                  specValueChoose = val;
                                  if (specValueChoose == "Specialty") {
                                    specValueChoose = "";
                                  }
                                  //  print(specValueChoose);
                                  searchController.searchSpecController.text =
                                      specValueChoose!;
                                  if (kDebugMode) {
                                    print(specValueChoose);
                                  }
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 180,
                    height: 65,
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 3, color: Color(0xff9747FF)),
                            bottom:
                                BorderSide(width: 3, color: Color(0xff9747FF)),
                            left:
                                BorderSide(width: 3, color: Color(0xff9747FF)),
                            right:
                                BorderSide(width: 3, color: Color(0xff9747FF))),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.home_work_outlined,
                          color: Color(0xff9747FF),
                          size: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 119,
                          child: DropdownButton(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              dropdownColor: const Color(0xffBB84E8),
                              icon: const Icon(Icons.keyboard_arrow_down_sharp),
                              iconSize: 40,
                              focusColor: const Color(0xff9747FF),
                              hint: const Text(
                                "Areas",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                              value: areaValueChoose,
                              items: const [
                                DropdownMenuItem(
                                    value: "male",
                                    child: Text("Male",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400))),
                                DropdownMenuItem(
                                    value: "female",
                                    child: Text("Female",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400)))
                              ],
                              onChanged: (val) {
                                setState(() {
                                  areaValueChoose = val;
                                  if (areaValueChoose == "Area") {
                                    areaValueChoose = "";
                                  }
                                  //print(areaValueChoose);
                                  searchController.searchAreaController.text =
                                      areaValueChoose!;
                                  if (kDebugMode) {
                                    print(areaValueChoose);
                                  }
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 610,
              width: 450,
              child: ListView.builder(
                  itemCount: searchController.listLength ?? 0,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        HomeTopDoctorWidget(
                          doctorName: searchController.json?[index]['name'],
                          doctorSpec: searchController.json?[index]
                              ['spicialty'],
                          doctorPlace: searchController.json?[index]['address'],
                          doctorImage: "images/topDoctorone.png",
                          doctorRate: "(122)",
                        ),
                      ],
                    );
                  }),
            )
          ],
        ));
  }
}
