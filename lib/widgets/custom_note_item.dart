import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app_with_sql_tharwet_thamy/models/note_model.dart';
import 'package:note_app_with_sql_tharwet_thamy/views/edit_note_view.dart';
class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({Key? key, required this.noteModel , }) : super(key: key);

  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context){
          return const EditNoteView();
        }));
      },
      child: Container(
        padding:const EdgeInsets.only(top:24,bottom:24,left: 16),
        decoration: BoxDecoration(
          color:   Color(noteModel.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              // contentPadding: const EdgeInsets.all(0),
              title:  Text(noteModel.noteTitle,style:const TextStyle(
                color: Colors.black87,
                fontSize: 26,
              ),),
              subtitle:    Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(noteModel.noteContent,style: TextStyle(
                  color: Colors.black87.withOpacity(0.5),
                  fontSize: 18,
                ),),
              ),
              trailing: IconButton(
                onPressed: (){
                  noteModel.delete();
                },
                icon:const Icon(FontAwesomeIcons.trash,color: Colors.black87,size: 24,),
              ),
            ),
            Padding(padding:const  EdgeInsets.only(right: 24 ),
              child:  Text(noteModel.date,
                style: TextStyle(
                    color: Colors.black87.withOpacity(0.4),
                    fontSize: 16
                ),),
            ),
          ],
        ),
      ),
    );
  }
}
