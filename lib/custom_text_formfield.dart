import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  const CustomTextFormField({required this.controller, Key? key})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: widget.controller,
        cursorColor: Colors.white,
        enabled: true,
        decoration: InputDecoration(
            enabled: true,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
        style: TextStyle(
          color: Colors.white70,
        ),
      ),
    );
  }
}
