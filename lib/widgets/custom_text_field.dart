// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:nijad_app/constonts.dart';

class CustomTextField extends StatelessWidget {
  final String? Function(String?)? valid;
  final String hint;
  final IconData icon;
  final TextEditingController myController;

  const CustomTextField(
      {Key? key,
      required this.hint,
      required this.icon,
      required this.myController,
      required this.valid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: EdgeInsets.all(10),
        child: TextFormField(
          controller: myController,
          validator: valid,
          cursorColor: kMainColors,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontFamily: 'Styles'),
            prefixIcon: Icon(icon, color: kMainColors),
            filled: true,
            fillColor: kTextFontColors,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
