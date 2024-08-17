import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingPageWidget extends StatefulWidget {
  final String? patientName;
  final double? numStars;
  final String? comment;
  final String? rateDate;

  const RatingPageWidget(
      {Key? key, this.patientName, this.rateDate, this.numStars, this.comment})
      : super(key: key);
  @override
  State<RatingPageWidget> createState() => _RatingPageWidgetState();
}

class _RatingPageWidgetState extends State<RatingPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: 100,
        width: 400,
        decoration: const BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 5)],
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 380,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.patientName ?? "",
                    style: const TextStyle(
                        color: Color(0xff404345),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                    width: 150,
                    child: RatingBar.builder(
                        initialRating: widget.numStars!,
                        direction: Axis.horizontal,
                        itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Color(0xffFFE848),
                            ),
                        itemSize: 20,
                        ignoreGestures: true,
                        onRatingUpdate: (ratingIndex) {
                          print(ratingIndex);
                        }),
                  ),
                  Container(
                    height: 30,
                    child: Text(
                      widget.comment ?? "",
                      style: const TextStyle(
                          color: Color(0xff404345),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        child: Text(
                          widget.rateDate ?? "",
                          style: const TextStyle(
                              color: Color(0xff404345),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
