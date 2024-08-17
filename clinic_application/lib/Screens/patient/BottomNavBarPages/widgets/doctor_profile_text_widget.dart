import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final String? name;
  final IconData? icon;

  const TextWidget({
    Key? key,
    this.name,
    this.icon,
  }) : super(key: key);

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border(
              top: BorderSide(width: 3, color: Color(0xff9747FF)),
              bottom: BorderSide(width: 3, color: Color(0xff9747FF)),
              left: BorderSide(width: 3, color: Color(0xff9747FF)),
              right: BorderSide(width: 3, color: Color(0xff9747FF))),
        ),
        height: 60,
        width: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              widget.icon,
              size: 40,
              color: Color(0xff9747FF),
            ),
            SizedBox(
              width: 300,
              child: Text(
                widget.name ?? "",
                style: const TextStyle(
                    color: Color(0xff000000),
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
