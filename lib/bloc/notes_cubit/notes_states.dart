import '../../models/note_model.dart';

abstract class NotesStates{}

class NotesInitialState extends NotesStates{}

class NotesSuccessState extends NotesStates{
  final List notes;
  NotesSuccessState(this.notes);
}

