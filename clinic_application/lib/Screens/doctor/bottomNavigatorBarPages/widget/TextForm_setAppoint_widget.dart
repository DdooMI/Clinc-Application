import 'package:flutter/material.dart';

class TextformSetappointWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextAlign? textAlign;

  const TextformSetappointWidget(
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
  State<TextformSetappointWidget> createState() =>
      _TextformSetappointWidgetState();
}

class _TextformSetappointWidgetState extends State<TextformSetappointWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText ?? false,
      textAlign: widget.textAlign ?? TextAlign.center,
      decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
          labelStyle:
              const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
          hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          suffix: widget.suffix,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 3, color: Color(0xffFFFFFF))),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 3, color: Color(0xffFFFFFF))),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 3, color: Color(0xffFFFFFF))),
          fillColor: const Color(0xffFFFFFF),
          iconColor: const Color(0xffFFFFFF),
          focusColor: const Color(0xffFFFFFF)),
      cursorColor: const Color(0xffFFFFFF),
      style: const TextStyle(
          color: const Color(0xffFFFFFF),
          fontSize: 20,
          fontWeight: FontWeight.w500),
      validator: widget.validator,
    );
  }
}
