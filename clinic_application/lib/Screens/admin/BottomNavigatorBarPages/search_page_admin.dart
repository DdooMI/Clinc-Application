import 'package:clinic_application/Controllers/Admin/search_doctor_admin.dart';
import 'package:clinic_application/Screens/admin/BottomNavigatorBarPages/widget/doctor_list_widget.dart';
import 'package:clinic_application/Screens/admin/bottom_Navigator_bar_admin.dart';
import 'package:clinic_application/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart';

class SearchPageAdmin extends StatefulWidget {
  const SearchPageAdmin({super.key});
  @override
  State<SearchPageAdmin> createState() => _SearchPageAdminState();
}

class _SearchPageAdminState extends State<SearchPageAdmin> {
  final formKey = GlobalKey<FormState>();
  SearchAdminController searchController = Get.put(SearchAdminController());

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
                              const BottomNavigatorBarAdmin()));
                      searchController.searchNameController.clear();
                      searchController.searchAreaController.clear();
                      searchController.searchNameController.clear();
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
                    searchController.searchSpecController.text = "";
                    searchController.searchAreaController.text = "";
                    searchController.searchAdmin();
                  });
                },
                micFunction: () {},
              ),
              backgroundColor: const Color(0xff720404),
              centerTitle: true,
            ),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 500,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        color: Color(0xffCD5F5F),
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffCD5F5F),
                              blurStyle: BlurStyle.normal,
                              blurRadius: 50,
                              spreadRadius: 70)
                        ]),
                    transform: Matrix4.translation(Vector3(-150, 100, 0)),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        color: Color(0xffCD5F5F),
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffCD5F5F),
                              blurStyle: BlurStyle.normal,
                              blurRadius: 50,
                              spreadRadius: 70)
                        ]),
                    transform: Matrix4.translation(Vector3(300, 500, 0)),
                  ),
                  SizedBox(
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
                              DoctorListWidget(
                                  doctorName: searchController.json?[index]
                                      ['name'],
                                  doctorSpec: searchController.json?[index]
                                      ['address'],
                                  doctorImage: "images/doctor1.png"),
                            ],
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
