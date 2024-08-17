import 'package:flutter/material.dart';

class HelpCenterContainerWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const HelpCenterContainerWidget({
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
                  color: Color(0xff471AA0),
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff471AA0),
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
