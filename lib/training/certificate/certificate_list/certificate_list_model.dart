import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'certificate_list_widget.dart' show CertificateListWidget;
import 'package:flutter/material.dart';

class CertificateListModel extends FlutterFlowModel<CertificateListWidget> {
  ///  Local state fields for this page.

  List<StudyProgramListStruct> programs = [];
  void addToPrograms(StudyProgramListStruct item) => programs.add(item);
  void removeFromPrograms(StudyProgramListStruct item) => programs.remove(item);
  void removeAtIndexFromPrograms(int index) => programs.removeAt(index);
  void insertAtIndexInPrograms(int index, StudyProgramListStruct item) =>
      programs.insert(index, item);
  void updateProgramsAtIndex(
          int index, Function(StudyProgramListStruct) updateFn) =>
      programs[index] = updateFn(programs[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
