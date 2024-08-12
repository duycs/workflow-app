import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'study_program_rank_widget.dart' show StudyProgramRankWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudyProgramRankModel extends FlutterFlowModel<StudyProgramRankWidget> {
  ///  Local state fields for this page.

  List<LessonsStruct> listLesson = [];
  void addToListLesson(LessonsStruct item) => listLesson.add(item);
  void removeFromListLesson(LessonsStruct item) => listLesson.remove(item);
  void removeAtIndexFromListLesson(int index) => listLesson.removeAt(index);
  void insertAtIndexInListLesson(int index, LessonsStruct item) =>
      listLesson.insert(index, item);
  void updateListLessonAtIndex(int index, Function(LessonsStruct) updateFn) =>
      listLesson[index] = updateFn(listLesson[index]);

  List<EmployeeLessonListStruct> listLessonRow = [];
  void addToListLessonRow(EmployeeLessonListStruct item) =>
      listLessonRow.add(item);
  void removeFromListLessonRow(EmployeeLessonListStruct item) =>
      listLessonRow.remove(item);
  void removeAtIndexFromListLessonRow(int index) =>
      listLessonRow.removeAt(index);
  void insertAtIndexInListLessonRow(int index, EmployeeLessonListStruct item) =>
      listLessonRow.insert(index, item);
  void updateListLessonRowAtIndex(
          int index, Function(EmployeeLessonListStruct) updateFn) =>
      listLessonRow[index] = updateFn(listLessonRow[index]);

  String status = '';

  String dateStartList = '';

  String dateEndList = '';

  String statusLove = '';

  String lessonFavoriteStatusList = '';

  List<EmployeeLessonListStruct> listLessonRow2 = [];
  void addToListLessonRow2(EmployeeLessonListStruct item) =>
      listLessonRow2.add(item);
  void removeFromListLessonRow2(EmployeeLessonListStruct item) =>
      listLessonRow2.remove(item);
  void removeAtIndexFromListLessonRow2(int index) =>
      listLessonRow2.removeAt(index);
  void insertAtIndexInListLessonRow2(
          int index, EmployeeLessonListStruct item) =>
      listLessonRow2.insert(index, item);
  void updateListLessonRow2AtIndex(
          int index, Function(EmployeeLessonListStruct) updateFn) =>
      listLessonRow2[index] = updateFn(listLessonRow2[index]);

  List<EmployeeLessonListStruct> listLessonRow3 = [];
  void addToListLessonRow3(EmployeeLessonListStruct item) =>
      listLessonRow3.add(item);
  void removeFromListLessonRow3(EmployeeLessonListStruct item) =>
      listLessonRow3.remove(item);
  void removeAtIndexFromListLessonRow3(int index) =>
      listLessonRow3.removeAt(index);
  void insertAtIndexInListLessonRow3(
          int index, EmployeeLessonListStruct item) =>
      listLessonRow3.insert(index, item);
  void updateListLessonRow3AtIndex(
          int index, Function(EmployeeLessonListStruct) updateFn) =>
      listLessonRow3[index] = updateFn(listLessonRow3[index]);

  String programsAllId = '';

  List<ProgramIdStruct> listPrograms = [];
  void addToListPrograms(ProgramIdStruct item) => listPrograms.add(item);
  void removeFromListPrograms(ProgramIdStruct item) =>
      listPrograms.remove(item);
  void removeAtIndexFromListPrograms(int index) => listPrograms.removeAt(index);
  void insertAtIndexInListPrograms(int index, ProgramIdStruct item) =>
      listPrograms.insert(index, item);
  void updateListProgramsAtIndex(
          int index, Function(ProgramIdStruct) updateFn) =>
      listPrograms[index] = updateFn(listPrograms[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for nameSearch widget.
  FocusNode? nameSearchFocusNode;
  TextEditingController? nameSearchTextController;
  String? Function(BuildContext, String?)? nameSearchTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameSearchFocusNode?.dispose();
    nameSearchTextController?.dispose();
  }
}
