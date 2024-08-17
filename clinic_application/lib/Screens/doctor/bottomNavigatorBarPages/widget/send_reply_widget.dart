import 'package:flutter/material.dart';

class SendReplyWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextAlign? textAlign;

  const SendReplyWidget(
      {Key? key,
      this.controller,
      this.label,
      this.hint,
      this.prefixIcon,
      this.suffixIcon,
      this.suffix,
      this.obscureText,
      this.textAlign,
      this.validator})
      : super(key: key);

  @override
  State<SendReplyWidget> createState() => _TextFormFieldDoctorWidgetState();
}

class _TextFormFieldDoctorWidgetState extends State<SendReplyWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText ?? false,
        textAlign: widget.textAlign ?? TextAlign.start,
        decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hint,
            labelStyle:
                const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            hintStyle:
                const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            suffix: widget.suffix,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(width: 3, color: Color(0xff3A71D7))),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(width: 3, color: Color(0xff3A71D7))),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(width: 3, color: Color(0xff3A71D7))),
            fillColor: const Color(0xff3A71D7),
            iconColor: const Color(0xff3A71D7),
            focusColor: const Color(0xff3A71D7)),
        validator: widget.validator,
      ),
    );
  }
}
