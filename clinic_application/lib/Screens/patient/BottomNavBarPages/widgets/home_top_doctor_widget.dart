import 'package:clinic_application/Provider/favorite_provider.dart';
import 'package:clinic_application/Screens/patient/BottomNavBarPages/doctor_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class HomeTopDoctorWidget extends StatefulWidget {
  final String? doctorName;
  final String? doctorSpec;
  final String? doctorPlace;
  final String? doctorRate;
  final String? doctorImage;
  final String? doctorphone;
  final String? doctorPrice;
  final String? doctoremail;

  const HomeTopDoctorWidget(
      {Key? key,
      this.doctorName,
      this.doctorSpec,
      this.doctorPlace,
      this.doctorRate,
      this.doctorImage,
      this.doctorphone,
      this.doctorPrice,
      this.doctoremail})
      : super(key: key);
  @override
  State<HomeTopDoctorWidget> createState() => _HomeTopDoctorWidgetState();
}

class _HomeTopDoctorWidgetState extends State<HomeTopDoctorWidget> {
  Color red = Color(0xff000000);
  @override
  Widget build(BuildContext context) {
    FavoritesController favoritesController = Get.find<FavoritesController>();
    final doctor = {
      'name': widget.doctorName,
      'spicialty': widget.doctorSpec,
      'address': widget.doctorPlace,
    };

    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DoctorProfile(
                  name: widget.doctorName,
                  specialty: widget.doctorSpec,
                  phone: widget.doctorphone,
                  location: widget.doctorPlace,
                  email: widget.doctoremail,
                  price: widget.doctorPrice,
                  image: widget.doctorImage,
                )));
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 80,
            width: 400,
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 5)],
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(widget.doctorImage ?? ""),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.doctorName ?? "",
                      style: const TextStyle(
                          color: Color(0xff404345),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20,
                      width: 220,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.doctorSpec ?? "",
                            style: const TextStyle(
                                color: Color(0xffAAAAAA),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          Container(
                            height: 3,
                            width: 3,
                            decoration: const BoxDecoration(
                                color: Color(0xffAAAAAA),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                          ),
                          Text(
                            widget.doctorPlace ?? "",
                            style: const TextStyle(
                                color: Color(0xffAAAAAA),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 16,
                            width: 100,
                            child: RatingBar.builder(
                                initialRating: 4,
                                minRating: 2,
                                direction: Axis.horizontal,
                                itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Color(0xffFFE848),
                                    ),
                                allowHalfRating: true,
                                itemSize: 20,
                                onRatingUpdate: (ratingIndex) {
                                  print(ratingIndex);
                                }),
                          ),
                          Text(
                            widget.doctorRate ?? "",
                            style: const TextStyle(
                                color: Color(0xffC4C4C4),
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    )
                  ],
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
          )
        ],
      ),
    );
  }
}
