import 'package:clinic_application/Screens/doctor/bottomNavigatorBarPages/view_invest_page.dart';
import 'package:flutter/material.dart';

class ViewInvestWidget extends StatefulWidget {
  final int? id;
  final String? patientName;
  final String? date;
  final String? investImage;
  final String? comment;
  final String? reply;

  const ViewInvestWidget(
      {Key? key,
      this.id,
      this.patientName,
      this.investImage,
      this.date,
      this.reply,
      this.comment})
      : super(key: key);
  @override
  State<ViewInvestWidget> createState() => _ViewInvestWidgetState();
}

class _ViewInvestWidgetState extends State<ViewInvestWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ViewInvestPage(
                  id: widget.id,
                  reply: widget.reply,
                  patientName: widget.patientName,
                  comment: widget.comment,
                  investImage: widget.investImage,
                  date: widget.date,
                )));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: 60,
        width: 400,
        decoration: const BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 5)],
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Row(
          children: [
            Container(
              height: 150,
              width: 380,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.patientName ?? "Adham Ahmed",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.date ?? "",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
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
