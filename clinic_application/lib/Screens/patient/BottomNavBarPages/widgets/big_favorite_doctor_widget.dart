import 'package:flutter/material.dart';

class BigFavoriteWidget extends StatelessWidget {
  final String image;
  final String doctorName;
  final String doctorSpec;
  const BigFavoriteWidget(
      {Key? key,
      required this.image,
      required this.doctorName,
      required this.doctorSpec})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        width: 160,
        decoration: const BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(6),
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_outlined)),
            Container(
              margin: const EdgeInsets.only(right: 15),
              height: 120,
              width: 130,
              child: Column(
                children: [
                  CircleAvatar(radius: 40, backgroundImage: AssetImage(image)),
                  Text(
                    doctorName,
                    style: const TextStyle(
                        color: Color(0xff333333),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    doctorSpec,
                    style: const TextStyle(
                        color: Color(0xff0EBE7E),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
