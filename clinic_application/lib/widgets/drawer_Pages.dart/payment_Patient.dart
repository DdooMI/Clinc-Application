import 'package:clinic_application/Screens/patient/bottom_navigator_bar_patient.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class PaymentPatient extends StatefulWidget {
  const PaymentPatient({super.key});
  @override
  State<PaymentPatient> createState() => _PaymentPatientState();
}

class _PaymentPatientState extends State<PaymentPatient> {
  String expiryDate = "";
  String cardName = "";
  String cardIssuer = "";
  void Scan() async {
    var details = await CardScanner.scanCard(
        scanOptions: const CardScanOptions(
            scanExpiryDate: true,
            enableDebugLogs: false,
            scanCardHolderName: true,
            considerPastDatesInExpiryDateScan: true,
            possibleCardHolderNamePositions: [
          CardHolderNameScanPosition.belowCardNumber,
          CardHolderNameScanPosition.aboveCardNumber
        ]));
    print(details!.expiryDate);
    print(details.cardHolderName);
    print(details.cardIssuer);
    setState(() {
      expiryDate = details.expiryDate;
      cardName = details.cardHolderName;
      cardIssuer = details.cardIssuer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Add Payment",
            style: TextStyle(
                color: Color(0xff471AA0),
                fontSize: 30,
                fontWeight: FontWeight.w700),
          ),
          toolbarHeight: 90,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const BottomNavigatorBarPatient())),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xff471AA0),
              size: 30,
            ),
          ),
          actions: [
            Container(
                child: Stack(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: const BoxDecoration(
                      color: Color(0xff471AA0),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  transform: Matrix4.translation(Vector3(0, -50, 0)),
                ),
                Container(
                  width: 90,
                  height: 90,
                  decoration: const BoxDecoration(
                      color: Color(0xffBB84E8),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  transform: Matrix4.translation(Vector3(60, 0, 0)),
                ),
              ],
            ))
          ],
        ),
        body: Expanded(
            child: ListView(children: [
          Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,
                    width: 60,
                    decoration: const BoxDecoration(
                        color: Color(0xffFFFFFF),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff111111),
                              offset: Offset(
                                1,
                                1,
                              ),
                              blurStyle: BlurStyle.outer,
                              blurRadius: 10,
                              spreadRadius: 10)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Image.asset("images/visa.png"),
                  ),
                  Container(
                    height: 40,
                    width: 60,
                    decoration: const BoxDecoration(
                        color: Color(0xffFFFFFF),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff111111),
                              offset: Offset(
                                1,
                                1,
                              ),
                              blurStyle: BlurStyle.outer,
                              blurRadius: 10,
                              spreadRadius: 10)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Image.asset("images/MasterCard.png"),
                  ),
                  Container(
                    height: 40,
                    width: 60,
                    decoration: const BoxDecoration(
                        color: Color(0xffFFFFFF),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff111111),
                              offset: Offset(
                                1,
                                1,
                              ),
                              blurStyle: BlurStyle.outer,
                              blurRadius: 10,
                              spreadRadius: 10)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Image.asset("images/visa.png"),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: Scan,
                child: Container(
                  width: 100,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.document_scanner_outlined,
                        color: Color(0xff9747FF),
                      ),
                      Text(
                        "Scan Card",
                        style: TextStyle(color: Color(0xff9747FF)),
                      )
                    ],
                  ),
                ),
              ),
              Form(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(fontSize: 20),
                            prefixIcon: Icon(
                              Icons.person_outline_sharp,
                              size: 40,
                              color: Color(0xff9747FF),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff9747FF))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff9747FF))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff9747FF))),
                            fillColor: Color(0xff9747FF),
                            iconColor: Color(0xff9747FF),
                            focusColor: Color(0xff9747FF)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Card Number",
                            labelStyle: TextStyle(fontSize: 20),
                            hintText: "XXXX XXXX XXXX XXXX",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                            prefixIcon: Icon(
                              Icons.credit_card,
                              size: 40,
                              color: Color(0xff9747FF),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff9747FF))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff9747FF))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff9747FF))),
                            fillColor: Color(0xff9747FF),
                            iconColor: Color(0xff9747FF),
                            focusColor: Color(0xff9747FF)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 175,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "expiry date",
                                  labelStyle: TextStyle(fontSize: 20),
                                  hintText: "MM/YY",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          width: 3, color: Color(0xff9747FF))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          width: 3, color: Color(0xff9747FF))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          width: 3, color: Color(0xff9747FF))),
                                  fillColor: Color(0xff9747FF),
                                  iconColor: Color(0xff9747FF),
                                  focusColor: Color(0xff9747FF)),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 175,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Security code",
                                  labelStyle: TextStyle(fontSize: 20),
                                  hintText: "CVV",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          width: 3, color: Color(0xff9747FF))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          width: 3, color: Color(0xff9747FF))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          width: 3, color: Color(0xff9747FF))),
                                  fillColor: Color(0xff9747FF),
                                  iconColor: Color(0xff9747FF),
                                  focusColor: Color(0xff9747FF)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "ZIP/Postal Code",
                            labelStyle: TextStyle(fontSize: 20),
                            hintText: "XXXXX",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff9747FF))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff9747FF))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff9747FF))),
                            fillColor: Color(0xff9747FF),
                            iconColor: Color(0xff9747FF),
                            focusColor: Color(0xff9747FF)),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: 55,
                          width: 267,
                          decoration: const BoxDecoration(
                              color: Color(0xffBB84E8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: const Text(
                            "Add",
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ])));
  }
}
