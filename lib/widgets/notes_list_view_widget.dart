import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_sql_tharwet_thamy/bloc/notes_cubit/notes_cubit.dart';
import 'package:note_app_with_sql_tharwet_thamy/bloc/notes_cubit/notes_states.dart';

import 'custom_note_item.dart';
class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NotesCubit,NotesStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = NotesCubit.get(context);
        return  Expanded(
          child: ListView.builder(
            itemCount: cubit.allNotes!.length,
            itemBuilder: (context,index){
              return   Padding(
                padding:  const EdgeInsets.symmetric(vertical: 5),
                child:   CustomNoteItem(
                  noteModel: cubit.allNotes![index],
                ),
              );
            },
          ),) ;
      },

    );
  }
}
