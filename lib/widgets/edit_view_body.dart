import 'package:flutter/material.dart';
import 'package:note_app_with_sql_tharwet_thamy/bloc/notes_cubit/notes_cubit.dart';
import 'package:note_app_with_sql_tharwet_thamy/widgets/custom_app_bar.dart';
import 'package:note_app_with_sql_tharwet_thamy/widgets/custom_text_field.dart';

import '../models/note_model.dart';
class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.noteModel}) : super(key: key);
  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
    String? title, content;
    int? color;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50,),
               CustomAppBar(
              title: "Edit Note",
              icon: Icons.check,
              onPress: ()  {
                // معناه ان لو الاسم فاضى استخدم الاسم القديم
                 widget.noteModel.noteTitle = title ?? widget.noteModel.noteTitle;
                 widget.noteModel.noteContent = content ?? widget.noteModel.noteContent;
                 widget.noteModel.color = color ?? widget.noteModel.color;
                 widget.noteModel.save();
                  NotesCubit.get(context).fetchAllNotes();
               Navigator.pop(context);
              },
            ),
            const  SizedBox(height: 32,),
            CustomTextField(
              initialValue: widget.noteModel.noteTitle,
              onChanged: (val)
              {
                title = val;
              },
              hintText: "",
              maxLines: 1,
            ),
           const SizedBox(height: 16,),
            CustomTextField(
              initialValue: widget.noteModel.noteContent,
              onChanged: (val)
              {
                content = val;
              },
              hintText: "",
              maxLines: 22,
            ),
          ],
        ),
      ),
    );
  }
}
