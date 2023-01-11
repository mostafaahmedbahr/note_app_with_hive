import 'package:flutter/material.dart';
import 'package:note_app_with_sql_tharwet_thamy/views/notes_view.dart';

void main() {
  runApp(const NotesApp());
}
class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // default theme
      // theme: ThemeData.dark(),
      // عشان لو هعدل على حاجه داخل ال theme
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const NotesView(),
    );
  }
}
