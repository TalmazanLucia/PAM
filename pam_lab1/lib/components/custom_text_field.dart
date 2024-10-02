import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final Function(String) onChanged;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 33 / 16,
          letterSpacing: -0.5,
          color: Color(0xFF707070)),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffffffff),
        hoverColor: Color(0xffffffff),
        contentPadding: EdgeInsets.symmetric(vertical: 19.5, horizontal: 17),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFE1E2E8), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFE1E2E8), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFE1E2E8), width: 2),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xFFB0B3C7),
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 33 / 16,
          letterSpacing: -0.5,
        ),
        errorText: errorText,
      ),
      onChanged: onChanged,
    );
  }
}
