import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/edit_view_body.dart';
class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(),

    );
  }
}
