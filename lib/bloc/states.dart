abstract class AppStates{}

class AddNoteInitialState extends AppStates{}

class AddNoteLoadingState extends AppStates{}

class AddNoteSuccessState extends AppStates{}

class AddNoteErrorState extends AppStates{
  final String error;
  AddNoteErrorState(this.error);
}