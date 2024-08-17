import 'package:clinic_application/Screens/patient/BottomNavBarPages/widgets/chat_widget.dart';
import 'package:clinic_application/widgets/drawer_Pages.dart/drawer_widget.dart';
import 'package:clinic_application/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class MessagePatient extends StatefulWidget {
  const MessagePatient({super.key});
  @override
  State<MessagePatient> createState() => _MessagePatientState();
}

class _MessagePatientState extends State<MessagePatient> {
  final formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(20)),
            child: AppBar(
              toolbarHeight: 80,
              backgroundColor: const Color(0xffFFFFFF),
              title: const Text(
                "Message",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff471AA0)),
              ),
              leading: Builder(builder: (context) {
                return IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(
                      Icons.menu,
                      size: 30,
                      color: Color(0xff471AA0),
                    ));
              }),
            ),
          ),
        ),
        backgroundColor: const Color(0xFFD0B1EA),
        drawer: const DrawerWidget(),
        body: ListView(
          children: [
            SizedBox(
              height: 735,
              child: SizedBox(
                height: 670,
                width: 410,
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Center(
                            child: SearchWidget(
                              controller: searchController,
                              searchFunction: () {
                                setState(() {});
                              },
                              micFunction: () {},
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Chats",
                            style: TextStyle(
                                color: Color(0xff471AA0),
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ChatWidget(
                            image: "images/messagedoctor.jpeg",
                            doctorName: "Dr.hazem",
                            doctorSpec: "Worem consectetur adipiscing elit.",
                            onClicked: () {},
                            timeHour: "12.50"),
                        const SizedBox(
                          height: 10,
                        ),
                        ChatWidget(
                            image: "images/messagedoctor.jpeg",
                            doctorName: "Dr.hazem",
                            doctorSpec: "Worem consectetur adipiscing elit.",
                            onClicked: () {},
                            timeHour: "12.50"),
                        const SizedBox(
                          height: 10,
                        ),
                        ChatWidget(
                            image: "images/messagedoctor.jpeg",
                            doctorName: "Dr.hazem",
                            doctorSpec: "Worem consectetur adipiscing elit.",
                            onClicked: () {},
                            timeHour: "12.50"),
                        const SizedBox(
                          height: 10,
                        ),
                        ChatWidget(
                            image: "images/messagedoctor.jpeg",
                            doctorName: "Dr.hazem",
                            doctorSpec: "Worem consectetur adipiscing elit.",
                            onClicked: () {},
                            timeHour: "12.50"),
                        const SizedBox(
                          height: 10,
                        ),
                        ChatWidget(
                            image: "images/messagedoctor.jpeg",
                            doctorName: "Dr.hazem",
                            doctorSpec: "Worem consectetur adipiscing elit.",
                            onClicked: () {},
                            timeHour: "12.50"),
                        const SizedBox(
                          height: 10,
                        ),
                        ChatWidget(
                            image: "images/messagedoctor.jpeg",
                            doctorName: "Dr.hazem",
                            doctorSpec: "Worem consectetur adipiscing elit.",
                            onClicked: () {},
                            timeHour: "12.50"),
                        const SizedBox(
                          height: 10,
                        ),
                        ChatWidget(
                            image: "images/messagedoctor.jpeg",
                            doctorName: "Dr.hazem",
                            doctorSpec: "Worem consectetur adipiscing elit.",
                            onClicked: () {},
                            timeHour: "12.50"),
                        const SizedBox(
                          height: 10,
                        ),
                        ChatWidget(
                            image: "images/messagedoctor.jpeg",
                            doctorName: "Dr.hazem",
                            doctorSpec: "Worem consectetur adipiscing elit.",
                            onClicked: () {},
                            timeHour: "12.50"),
                        const SizedBox(
                          height: 10,
                        ),
                        ChatWidget(
                            image: "images/messagedoctor.jpeg",
                            doctorName: "Dr.hazem",
                            doctorSpec: "Worem consectetur adipiscing elit.",
                            onClicked: () {},
                            timeHour: "12.50"),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
