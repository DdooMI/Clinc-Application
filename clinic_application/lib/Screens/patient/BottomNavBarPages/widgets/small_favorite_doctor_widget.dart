import 'package:flutter/material.dart';

class SmallFavoriteWidget extends StatelessWidget {
  final String image;
  final String rate;
  final String doctorName;
  final String doctorPrice;
  const SmallFavoriteWidget(
      {Key? key,
      required this.image,
      required this.rate,
      required this.doctorName,
      required this.doctorPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 120,
        padding: const EdgeInsets.only(right: 10),
        decoration: const BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border, size: 20)),
                Container(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xffF6D060),
                        size: 15,
                      ),
                      Text(
                        rate,
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      image,
                    ),
                  ),
                  Text(
                    doctorName,
                    style: const TextStyle(
                        color: Color(0xff333333),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    doctorPrice,
                    style: const TextStyle(
                        fontSize: 9, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
