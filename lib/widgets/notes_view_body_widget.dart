import 'package:flutter/material.dart';
 import 'package:note_app_with_sql_tharwet_thamy/bloc/notes_cubit/notes_cubit.dart';

import 'custom_app_bar.dart';
 import 'notes_list_view_widget.dart';
class NotesViewBody extends StatefulWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    NotesCubit.get(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: const [
            SizedBox(height: 50,),
            CustomAppBar(
              title: "Notes",
              icon: Icons.search,
            ),
          NotesListView(),
        ],
      ),
    );
  }
}




