import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'program_certificate_widget.dart' show ProgramCertificateWidget;
import 'package:flutter/material.dart';

class ProgramCertificateModel
    extends FlutterFlowModel<ProgramCertificateWidget> {
  ///  Local state fields for this component.

  List<StudyProgramListStruct> programs = [];
  void addToPrograms(StudyProgramListStruct item) => programs.add(item);
  void removeFromPrograms(StudyProgramListStruct item) => programs.remove(item);
  void removeAtIndexFromPrograms(int index) => programs.removeAt(index);
  void insertAtIndexInPrograms(int index, StudyProgramListStruct item) =>
      programs.insert(index, item);
  void updateProgramsAtIndex(
          int index, Function(StudyProgramListStruct) updateFn) =>
      programs[index] = updateFn(programs[index]);

  CertificatesStruct? certificate;
  void updateCertificateStruct(Function(CertificatesStruct) updateFn) {
    updateFn(certificate ??= CertificatesStruct());
  }

  List<String> listProgramPost = [];
  void addToListProgramPost(String item) => listProgramPost.add(item);
  void removeFromListProgramPost(String item) => listProgramPost.remove(item);
  void removeAtIndexFromListProgramPost(int index) =>
      listProgramPost.removeAt(index);
  void insertAtIndexInListProgramPost(int index, String item) =>
      listProgramPost.insert(index, item);
  void updateListProgramPostAtIndex(int index, Function(String) updateFn) =>
      listProgramPost[index] = updateFn(listProgramPost[index]);

  bool isLoad = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<StudyProgramListStruct, bool> checkboxValueMap1 = {};
  List<StudyProgramListStruct> get checkboxCheckedItems1 =>
      checkboxValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.
  Map<StudyProgramListStruct, bool> checkboxValueMap2 = {};
  List<StudyProgramListStruct> get checkboxCheckedItems2 =>
      checkboxValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.
  Map<StudyProgramListStruct, bool> checkboxValueMap3 = {};
  List<StudyProgramListStruct> get checkboxCheckedItems3 =>
      checkboxValueMap3.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.
  Map<StudyProgramListStruct, bool> checkboxValueMap4 = {};
  List<StudyProgramListStruct> get checkboxCheckedItems4 =>
      checkboxValueMap4.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.
  Map<StudyProgramListStruct, bool> checkboxValueMap5 = {};
  List<StudyProgramListStruct> get checkboxCheckedItems5 =>
      checkboxValueMap5.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.
  Map<StudyProgramListStruct, bool> checkboxValueMap6 = {};
  List<StudyProgramListStruct> get checkboxCheckedItems6 =>
      checkboxValueMap6.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future programsapi(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlockdf;

    apiResultList = await StudyProgramGroup.studyProgramListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}}]}',
    );

    if ((apiResultList.succeeded ?? true)) {
      programs = StudyProgramListDataStruct.maybeFromMap(
              (apiResultList.jsonBody ?? ''))!
          .data
          .toList()
          .cast<StudyProgramListStruct>();
    } else {
      checkRefreshTokenBlockdf = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultList.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlockdf!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await programsapi(context);
      }
    }
  }

  Future certificates(BuildContext context) async {
    ApiCallResponse? apiResultGetOneCertificate;
    bool? checkRefreshTokenBlockdf11;

    apiResultGetOneCertificate =
        await CertificateGroup.getOneCertificatesCall.call(
      accessToken: FFAppState().accessToken,
      idCertificates: widget.idCertificates,
    );

    if ((apiResultGetOneCertificate.succeeded ?? true)) {
      certificate = CertificatesListDataStruct.maybeFromMap(
              (apiResultGetOneCertificate.jsonBody ?? ''))
          ?.data;
    } else {
      checkRefreshTokenBlockdf11 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetOneCertificate.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlockdf11!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await certificates(context);
      }
    }
  }

  Future addProgramsToCertificate(BuildContext context) async {
    ApiCallResponse? apiResultAdd;
    bool? checkRefreshTokenBlockdf1122;

    apiResultAdd = await CertificateGroup.pathCertificatesCall.call(
      accessToken: FFAppState().accessToken,
      programsList: listProgramPost,
      idCertificate: widget.idCertificates,
    );

    if ((apiResultAdd.succeeded ?? true)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Áp dụng chứng chỉ cho chương trình thành công!',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
      Navigator.pop(context);
    } else {
      checkRefreshTokenBlockdf1122 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultAdd.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlockdf1122!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await addProgramsToCertificate(context);
      }
    }
  }
}
