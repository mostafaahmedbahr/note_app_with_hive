import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_sql_tharwet_thamy/bloc/cubit.dart';
import 'package:note_app_with_sql_tharwet_thamy/bloc/states.dart';
import 'package:note_app_with_sql_tharwet_thamy/models/note_model.dart';
import 'package:note_app_with_sql_tharwet_thamy/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';

import '../bloc/notes_cubit/notes_cubit.dart';
import '../constants/consts.dart';
class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title , content;
  var colorItemIndex = 0;
  List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.grey,
    Colors.blue,
    Colors.white,
     Colors.purple,
    Colors.deepOrange,
    Colors.tealAccent,
    Colors.deepPurpleAccent,
  ];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const  SizedBox(height: 32,),
          CustomTextField(
            hintText: "Title",
            maxLines: 1,
            onSaved: (value){
              title = value;
            },
          ),
          const  SizedBox(height: 16,),
          CustomTextField(
            hintText: "Content",
            maxLines: 7,
            onSaved: (value){
              content = value;
            },
          ),
          const SizedBox(height: 16,),
          SizedBox(
            height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)
              {
                return   GestureDetector(
                  onTap: (){
                    setState((){
                      colorItemIndex=index;
                    });
                  },
                  child: ColorItem(
                    isActive:colorItemIndex==index ? true : false,
                    color: colors[index],
                  ),
                );
              },
              separatorBuilder: (context,index){
                return const SizedBox(width: 10,);
              },
              itemCount: colors.length,
          ),
          ),
          const SizedBox(height: 16,),
          BlocBuilder<AddNoteCubit,AppStates>(
            builder: (context,state){
              return ConditionalBuilder(
                condition: state is! AddNoteLoadingState  ,
                fallback: (context){
                  return const CircularProgressIndicator(
                    color: kPrimaryColor,
                  );
                },
                builder: (context){
                  return  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                      ),
                      onPressed: (){
                        if(formKey.currentState!.validate())
                        {
                          formKey.currentState!.save();
                          var currentDate = DateTime.now();
                          var formattedCurrentDate = DateFormat.yMEd().format(currentDate);
                          var noteModel = NoteModel(
                            color: colors[colorItemIndex].value,
                            noteContent: content!,
                            noteTitle: title!,
                            date: formattedCurrentDate,
                          );
                          BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                        }
                        else{
                          autoValidateMode = AutovalidateMode.always;
                          setState((){});
                        }
                        NotesCubit.get(context).fetchAllNotes();
                      },
                      child: const Text("Add",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  );
                },

              );
            },
          ),
          const SizedBox(height: 16,),
        ],

      ),
    );
  }
}

class ColorItem extends StatelessWidget {
    ColorItem({Key? key,required this.isActive, required this.color}) : super(key: key);
  final bool? isActive;
final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive == false ?   CircleAvatar(
      backgroundColor: color,
      radius: 15,
    ) :
      CircleAvatar(
      radius: 18,
      backgroundColor : Colors.white,
      child:   CircleAvatar(
        backgroundColor:color,
        radius: 15,
      ),
    );
  }
}

