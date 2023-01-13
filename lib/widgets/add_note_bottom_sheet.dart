import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app_with_sql_tharwet_thamy/constants/consts.dart';

import '../bloc/cubit.dart';
import '../bloc/states.dart';
import 'add_note_form.dart';
 class CustomAddNoteBottomSheet extends StatelessWidget {
    const CustomAddNoteBottomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit,AppStates>(
        listener: (context,state){
          // if(state is AddNoteLoadingState){
          //   AddNoteCubit.get(context).isLoading = true;
          // }
          if(state is AddNoteErrorState){
            print("error in add note >>>>>>");
            print(state.error);
          }
          if(state is AddNoteSuccessState){
            Navigator.pop(context);
          }
        },
        builder: (context,state){
          // var cubit = AddNoteCubit.get(context);
          return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                // ModalProgressHUD لازم تكون فوق السكرول لازم لازم لازم
                child: AddNoteForm(),
              ));
        },

      ),
    );
  }
}


