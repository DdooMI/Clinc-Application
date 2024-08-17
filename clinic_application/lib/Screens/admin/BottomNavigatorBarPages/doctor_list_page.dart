import 'package:clinic_application/Controllers/Admin/Add_doctor_controller.dart';
import 'package:clinic_application/Controllers/Admin/search_admin_controller.dart';
import 'package:clinic_application/Controllers/Patient/search_patient_controller.dart';
import 'package:clinic_application/Screens/admin/BottomNavigatorBarPages/add_doctor_listPage.dart';
import 'package:clinic_application/Screens/admin/BottomNavigatorBarPages/search_page_admin.dart';
import 'package:clinic_application/Screens/admin/BottomNavigatorBarPages/widget/doctor_list_widget.dart';
import 'package:clinic_application/Screens/admin/bottom_Navigator_bar_admin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({super.key});
  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

Future<void> _refresh() {
  Get.off(BottomNavigatorBarAdmin());
  return Future.delayed(Duration(seconds: 3));
}

class _DoctorListPageState extends State<DoctorListPage> {
  final formKey = GlobalKey<FormState>();
  SearchApiController searchController = Get.put(SearchApiController());
  SearchAllDoctorController searchAllDoctorController =
      Get.put(SearchAllDoctorController());
  AddDoctorController addDoctorController = Get.put(AddDoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          width: 150,
          child: FloatingActionButton(
            isExtended: true,
            backgroundColor: const Color(0xff720404),
            onPressed: () {
              addDoctorController.nameController.clear();
              addDoctorController.nationalNumberController.clear();
              addDoctorController.emailController.clear();
              addDoctorController.phoneNumberController.clear();
              addDoctorController.addressController.clear();
              addDoctorController.ageController.clear();
              addDoctorController.genderController.clear();
              addDoctorController.passwordController.clear();
              addDoctorController.specialityController.clear();

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const AddDoctorListPage()));
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Add doctor",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFFFFFF))),
                Icon(
                  Icons.add,
                  color: Color(0xffFFFFFF),
                  size: 30,
                )
              ],
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(20)),
            child: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              backgroundColor: const Color(0xff720404),
              title: const Text(
                "Doctors List",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffFFFFFF)),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      searchController.listLength = 0;
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const SearchPageAdmin()));
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 35,
                      color: Color(0xffFFFFFF),
                    ))
              ],
            ),
          ),
        ),
        body: SizedBox(
          height: 650,
          width: 450,
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
                itemCount: searchAllDoctorController.listLength ?? 0,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      DoctorListWidget(
                        doctorName: searchAllDoctorController.json?[index]
                            ['name'],
                        doctorSpec: searchAllDoctorController.json?[index]
                            ['address'],
                        doctorId: searchAllDoctorController.json?[index]
                            ['nationalID'],
                        doctorImage: "images/doctor1.png",
                        doctorNationalId: searchAllDoctorController.json?[index]
                            ['nationalID'],
                        doctoraddress: searchAllDoctorController.json?[index]
                            ['address'],
                        doctorage: searchAllDoctorController.json?[index]
                            ['age'],
                        doctoremail: searchAllDoctorController.json?[index]
                            ['email'],
                        doctorgender: searchAllDoctorController.json?[index]
                            ['gender'],
                        doctorphoneNumber: searchAllDoctorController
                            .json?[index]['phoneNumber'],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                }),
          ),
        ));
  }
}
