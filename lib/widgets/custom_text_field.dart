import 'package:flutter/material.dart';

import '../constants/consts.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hintText, required this.maxLines}) : super(key: key);
final String hintText;
final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:const TextStyle(
          color: kPrimaryColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:  const BorderSide(
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
