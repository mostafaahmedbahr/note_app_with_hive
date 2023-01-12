import 'package:flutter/material.dart';

import 'custom_text_field.dart';
class CustomAddNoteBottomSheet extends StatelessWidget {
  const CustomAddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      children: [
        SizedBox(height: 32,),
        CustomTextField(),
      ],

    ),);
  }
}
