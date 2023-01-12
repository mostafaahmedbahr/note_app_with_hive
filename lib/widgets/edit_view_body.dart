import 'package:flutter/material.dart';
import 'package:note_app_with_sql_tharwet_thamy/widgets/custom_app_bar.dart';
import 'package:note_app_with_sql_tharwet_thamy/widgets/custom_text_field.dart';
class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children:const [
          SizedBox(height: 50,),
          CustomAppBar(
            title: "Edit Note",
            icon: Icons.check,
          ),
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
      ),
    );
  }
}
