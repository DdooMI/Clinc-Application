import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
        decoration: const BoxDecoration(
            color: Color(0xff716C6C),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32))),
        child: const Text(
          "abfjabcvajbvcabfua",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xffFFFFFFF)),
        ),
      ),
    );
  }
}
