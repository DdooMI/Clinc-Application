import 'package:flutter/material.dart';

class ThankYouPatient extends StatelessWidget {
  const ThankYouPatient({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(height: 200,),
                Container(
                  height: 450,
                  child: Column(
                    children:[
                      Container(
                        height:200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: const Color(0xffE4D2F3),
                            borderRadius: BorderRadius.circular(200)),
                        child:const Icon(
                          Icons.thumb_up,
                          color: Color(0xff471AA0),
                          size: 100,
                        ),
                      ),
                      const Text(
                        "Thank You!",
                        style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 40,
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        "Your Appointment Successful",
                        style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                   ),
                 ),
                MaterialButton(
                  onPressed:  ()=>Navigator.of(context).pop,
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: 267,
                    decoration: const BoxDecoration(
                        color: Color(0xff471AA0),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child:const Text(
                      "Done",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
