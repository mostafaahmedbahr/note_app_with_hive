import 'package:flutter/material.dart';
import 'package:note_app_with_sql_tharwet_thamy/widgets/notes_view_body_widget.dart';

import '../widgets/add_note_bottom_sheet.dart';
class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
              builder: (context){
            return CustomAddNoteBottomSheet();
              },
          );
        },
        child: const Icon(Icons.add,
        size: 30,
        ),
      ),
    );
  }
}


