import 'package:flutter/material.dart';

import 'custom_text_field.dart';
class CustomAddNoteBottomSheet extends StatelessWidget {
  const CustomAddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      children:const [
        SizedBox(height: 32,),
        CustomTextField(
          hintText: "Title",
          maxLines: 1,
        ),
        SizedBox(height: 16,),
        CustomTextField(
          hintText: "Content",
          maxLines: 7,
        ),
      ],

    ),);
  }
}
