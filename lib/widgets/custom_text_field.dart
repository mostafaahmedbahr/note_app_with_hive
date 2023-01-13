import 'dart:ffi';

import 'package:flutter/material.dart';

import '../constants/consts.dart';
class CustomTextField extends StatelessWidget {
    const CustomTextField({Key? key, required this.hintText, required this.maxLines, this.onSaved}) : super(key: key);
final String hintText;
final int maxLines;
 final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value){
        if(value?.isEmpty ?? true){
          return "Field is required";
        }
        return null;
      },
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
