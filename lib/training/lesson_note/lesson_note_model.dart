import '/flutter_flow/flutter_flow_util.dart';
import 'lesson_note_widget.dart' show LessonNoteWidget;
import 'package:flutter/material.dart';

class LessonNoteModel extends FlutterFlowModel<LessonNoteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
