import 'package:flutter/material.dart';
import 'package:note_app_with_sql_tharwet_thamy/widgets/notes_view_body_widget.dart';
class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody(),
    );
  }
}


