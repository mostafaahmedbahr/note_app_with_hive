 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app_with_sql_tharwet_thamy/bloc/states.dart';
import 'package:note_app_with_sql_tharwet_thamy/constants/consts.dart';
import 'package:note_app_with_sql_tharwet_thamy/models/note_model.dart';
class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(AddNoteInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  addNote(NoteModel note)async{
    emit(AddNoteLoadingState());
    try{
      var notesBox = Hive.box(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccessState());
    }on Exception catch(error){
      print("error in add note");
      emit(AddNoteErrorState(error.toString()));
    }
  }
}