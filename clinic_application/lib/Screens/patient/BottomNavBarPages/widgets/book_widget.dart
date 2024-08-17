import 'package:clinic_application/Provider/favorite_provider.dart';
import 'package:clinic_application/Screens/patient/BottomNavBarPages/booking_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookWidget extends StatefulWidget {
  final String image;
  final String doctorName;
  final String doctorSpec;
  final int yearExperience;

  final String timeHour;
  final String timeDay;
  const BookWidget(
      {Key? key,
      required this.image,
      required this.doctorName,
      required this.doctorSpec,
      required this.yearExperience,
      required this.timeDay,
      required this.timeHour})
      : super(key: key);
  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  @override
  Widget build(BuildContext context) {
    FavoritesController favoritesController = Get.find<FavoritesController>();
    final doctor = {
      'name': widget.doctorName,
      'spicialty': widget.doctorSpec,
      'address': "",
    };
    return Container(
      height: 160,
      width: 385,
      decoration: const BoxDecoration(
          color: Color(0xffFFFFFF),
          boxShadow: [BoxShadow(blurRadius: 5, spreadRadius: 1)],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(15))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                height: 100,
                width: 95,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: ExactAssetImage(widget.image)),
                    borderRadius: const BorderRadius.all(Radius.circular(100))),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.only(right: 10),
                height: 100,
                width: 260,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(50))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.doctorName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              favoritesController.toggleFavorite(doctor);
                              favoritesController.isFavorite(doctor);
                            });
                          },
                          icon: favoritesController.isFavorite(doctor)
                              ? Icon(Icons.favorite, color: Colors.red)
                              : Icon(
                                  Icons.favorite_border,
                                ),
                        )
                      ],
                    ),
                    Text(
                      widget.doctorSpec,
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "${widget.yearExperience} Years experience",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                width: 150,
                height: 50,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Next Available ",
                      style: TextStyle(
                          color: Color(0xff471AA0),
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.timeHour,
                          style: const TextStyle(
                              color: Color(0xff677294),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.timeDay,
                          style: const TextStyle(
                              color: Color(0xff677294),
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 50,
                width: 150,
                decoration: const BoxDecoration(
                    color: Color(0xff471AA0),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(15))),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const BookingPagePatient()));
                  },
                  child: const Text(
                    "Book Now",
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
