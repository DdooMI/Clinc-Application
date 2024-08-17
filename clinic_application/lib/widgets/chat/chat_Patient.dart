// ignore_for_file: file_names

import 'package:clinic_application/widgets/chat/chat_message.dart';
import 'package:flutter/material.dart';

class ChatPatient extends StatelessWidget {
  ChatPatient({super.key});
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_outlined,
                size: 30, color: Color(0xffFFFFFF))),
        backgroundColor: const Color(0xffAA5DE8),
        title: const Text(
          "Dr.Hazam",
          style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 26,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.phone,
                size: 30,
                color: Color(0xffFFFFFF),
              )),
          Container(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                controller: _controller,
                itemBuilder: (context, index) {
                  return const ChatMessage();
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Color(0xffAA5DE8),
                focusColor: Color(0xffAA5DE8),
                hoverColor: Color(0xffAA5DE8),
                suffixIcon: IconButton(
                    onPressed: () {
                      _controller.jumpTo(
                        _controller.position.maxScrollExtent,
                      );
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Color(0xffAA5DE8),
                    )),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
