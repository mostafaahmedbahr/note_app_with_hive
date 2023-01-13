 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_sql_tharwet_thamy/bloc/states.dart';
class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(AddNoteInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
}