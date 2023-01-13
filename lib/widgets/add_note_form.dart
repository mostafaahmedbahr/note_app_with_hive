import 'package:flutter/material.dart';
import 'package:note_app_with_sql_tharwet_thamy/widgets/custom_text_field.dart';

import '../constants/consts.dart';
class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title , content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const  SizedBox(height: 32,),
          CustomTextField(
            hintText: "Title",
            maxLines: 1,
            onSaved: (value){
              title = value;
            },
          ),
          const  SizedBox(height: 16,),
          CustomTextField(
            hintText: "Content",
            maxLines: 7,
            onSaved: (value){
              content = value;
            },
          ),
          const SizedBox(height: 16,),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
              ),
              onPressed: (){
                if(formKey.currentState!.validate())
                {
                  formKey.currentState!.save();
                }
                else{
                  autoValidateMode = AutovalidateMode.always;
                  setState((){});
                }
              },
              child: const Text("Add",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),),
            ),
          ),
          const SizedBox(height: 16,),
        ],

      ),
    );
  }
}

