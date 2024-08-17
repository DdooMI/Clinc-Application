import 'package:flutter/material.dart';

class SettingsAdminWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const SettingsAdminWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 400,
      child: MaterialButton(
        onPressed: onClicked,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                  color: Color(0xff000000),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff000000),
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
