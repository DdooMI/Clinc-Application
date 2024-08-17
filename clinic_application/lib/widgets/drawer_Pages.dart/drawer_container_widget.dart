import 'package:flutter/material.dart';

class DrawerContainerWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final IconData icon;

  const DrawerContainerWidget(
      {Key? key,
      required this.text,
      required this.onClicked,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 250,
      child: MaterialButton(
        onPressed: onClicked,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: const Color(0xffFFFFFF),
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xffFFFFFF),
            )
          ],
        ),
      ),
    );
  }
}
