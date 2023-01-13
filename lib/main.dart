import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app_with_sql_tharwet_thamy/bloc/simple_bloc_observer.dart';
import 'package:note_app_with_sql_tharwet_thamy/views/notes_view.dart';

import 'bloc/cubit.dart';
import 'bloc/notes_cubit/notes_cubit.dart';
import 'constants/consts.dart';
import 'models/note_model.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  // لازم يتحط الاول قبل openbox
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox(kNotesBox);
  runApp(const NotesApp());
}
class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NotesCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // default theme
        // theme: ThemeData.dark(),
        // عشان لو هعدل على حاجه داخل ال theme
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: "Poppins",
        ),
        home: const NotesView(),
      ),
    );
  }
}
