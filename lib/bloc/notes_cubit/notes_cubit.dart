import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app_with_sql_tharwet_thamy/models/note_model.dart';
import '../../constants/consts.dart';
import 'notes_states.dart';
class NotesCubit extends Cubit<NotesStates> {

  NotesCubit() : super(NotesInitialState());

  static NotesCubit get(context) => BlocProvider.of(context);
  List? allNotes;
  fetchAllNotes( )async{
    // emit(NotesLoadingState());
    // مش محتاجين عشان الداتا بتيجى بسرعه لحظه ال READ
   // هنا مش هنستخدم try عشان مش ف احتياج ليها
      var notesBox = Hive.box(kNotesBox);
        allNotes = notesBox.values.toList();
      await notesBox.get(allNotes);
      emit(NotesSuccessState(allNotes!));

  }





}