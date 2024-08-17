import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController? controller;
  final VoidCallback searchFunction;
  final VoidCallback micFunction;
  const SearchWidget({
    Key? key,
    required this.controller,
    required this.searchFunction,
    required this.micFunction,
  }) : super(key: key);
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    widget.controller!.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller!.removeListener(onListen);

    super.dispose();
  }

  void onListen() => setState(() {});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 50,
      decoration: const BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Form(
          key: formKey,
          child: TextFormField(
            controller: widget.controller,
            style: const TextStyle(
                color: Color(0xff000000),
                fontSize: 20,
                fontWeight: FontWeight.w400),
            cursorHeight: 25,
            decoration: InputDecoration(
              suffixIcon: widget.controller!.text.isEmpty
                  ? IconButton(
                      onPressed: widget.micFunction,
                      icon: const Icon(Icons.mic))
                  : IconButton(
                      onPressed: widget.searchFunction,
                      icon: const Icon(Icons.search)),
              hintText: "Search....",
              hintStyle: const TextStyle(
                  color: Color(0xff858585),
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color(0xffFFFFFF)),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Color(0xffFFFFFF))),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Color(0xffFFFFFF))),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Color(0xffFFFFFF))),
            ),
          )),
    );
  }
}
