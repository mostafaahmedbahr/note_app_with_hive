import 'package:flutter/material.dart';
import 'package:note_app_with_sql_tharwet_thamy/models/note_model.dart';

 import '../widgets/edit_view_body.dart';
class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key, required this.noteModel}) : super(key: key);
final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(
        noteModel: noteModel,
      ),

    );
  }
}
