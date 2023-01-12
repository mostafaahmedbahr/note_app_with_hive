
import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)

class NoteModel extends HiveObject
{
  @HiveField(0)
  final String noteTitle;

  @HiveField(1)
  final String noteContent;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final int color;

  NoteModel({
    required this.color,
    required this.noteContent,
    required this.noteTitle,
    required this.date,
});
}