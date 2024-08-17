import 'package:clinic_application/Controllers/Doctor/reply_invest_controller.dart';
import 'package:clinic_application/Controllers/Doctor/view_investigates_controller.dart';
import 'package:clinic_application/Controllers/Patient/login_controller.dart';
import 'package:clinic_application/Screens/doctor/bottomNavigatorBarPages/widget/send_reply_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ViewInvestPage extends StatefulWidget {
  int? id;
  String? patientName;
  String? date;
  String? comment;
  String? reply;
  String? investImage;

  ViewInvestPage(
      {Key? key,
      this.id,
      this.patientName,
      this.date,
      this.reply,
      this.comment,
      this.investImage})
      : super(key: key);
  @override
  State<ViewInvestPage> createState() => _ViewInvestPageState();
}

class _ViewInvestPageState extends State<ViewInvestPage> {
  ReplyInvestController replyInvestController =
      Get.put(ReplyInvestController());
  LogInController logInController = Get.put(LogInController());
  ViewInvestigatesController viewInvestigatesController =
      Get.put(ViewInvestigatesController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool? showReply;
    setState(() {
      if (widget.reply == "Not yest") {
        showReply = false;
      } else {
        showReply = true;
      }
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
          child: AppBar(
            leading: IconButton(
                onPressed: () {
                  viewInvestigatesController.nationalNumberController.text =
                      logInController.nationlId!;
                  viewInvestigatesController.viewInvest();
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(0xffFFFFFF),
                  size: 30,
                )),
            title: Text(
              widget.patientName ?? "Adham Ahmed",
              style: const TextStyle(
                  color: Color(0xffFAFAFA),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            backgroundColor: const Color(0xff3A71D7),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 740,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 660,
                  width: 420,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 540,
                            width: 350,
                            decoration: const BoxDecoration(
                                color: Color(0xff3A71D7),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50),
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50))),
                            child: Column(
                              children: [
                                Container(
                                  height: 380,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            // widget.investImage ??
                                            "images/health1.jpg",
                                          )),
                                      color: Color(0xffFFFFFF),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          topRight: Radius.circular(50))),
                                ),
                                Container(
                                  height: 120,
                                  // color: Colors.deepOrange,
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.comment ?? "Adham",
                                          style: const TextStyle(
                                              color: Color(0xffFAFAFA),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600))
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 25),
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(widget.date ?? "Adham",
                                          style: const TextStyle(
                                              color: Color(0xffFAFAFA),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      showReply ?? false
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  height: 100,
                                  width: 350,
                                  decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(50),
                                          topLeft: Radius.circular(50),
                                          topRight: Radius.circular(50))),
                                  child: Text(widget.reply ?? "Adham",
                                      style: const TextStyle(
                                          color: Color(0xffFAFAFA),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600)),
                                )
                              ],
                            )
                          : const SizedBox(
                              height: 100,
                              width: 350,
                            )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                    key: formKey,
                    child: SendReplyWidget(
                      controller: replyInvestController.replyController,
                      hint: "Send reply",
                      suffixIcon: IconButton(
                          onPressed: () {
                            widget.reply =
                                replyInvestController.replyController.text;
                            replyInvestController.investId = widget.id;
                            replyInvestController.reply();
                            setState(() {
                              showReply = true;
                            });
                            replyInvestController.replyController.clear();
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Color(0xff3A71D7),
                          )),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
