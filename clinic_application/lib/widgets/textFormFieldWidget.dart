import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? initialValue;
  final String? hint;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextAlign? textAlign;

  const TextFormFieldWidget(
      {Key? key,
      this.controller,
      this.initialValue,
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
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      controller: widget.controller,
      obscureText: widget.obscureText ?? false,
      textAlign: widget.textAlign ?? TextAlign.start,
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
              borderSide: BorderSide(width: 3, color: Color(0xff5682D3))),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 3, color: Color(0xff5682D3))),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 3, color: Color(0xff5682D3))),
          fillColor: const Color(0xff5682D3),
          iconColor: const Color(0xff5682D3),
          focusColor: const Color(0xff5682D3)),
      validator: widget.validator,
    );
  }
}
