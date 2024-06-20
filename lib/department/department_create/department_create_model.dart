import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'department_create_widget.dart' show DepartmentCreateWidget;
import 'package:flutter/material.dart';

class DepartmentCreateModel extends FlutterFlowModel<DepartmentCreateWidget> {
  ///  Local state fields for this page.

  List<BranchListStruct> branchList = [];
  void addToBranchList(BranchListStruct item) => branchList.add(item);
  void removeFromBranchList(BranchListStruct item) => branchList.remove(item);
  void removeAtIndexFromBranchList(int index) => branchList.removeAt(index);
  void insertAtIndexInBranchList(int index, BranchListStruct item) =>
      branchList.insert(index, item);
  void updateBranchListAtIndex(
          int index, Function(BranchListStruct) updateFn) =>
      branchList[index] = updateFn(branchList[index]);

  List<StudyProgramListStruct> programsList = [];
  void addToProgramsList(StudyProgramListStruct item) => programsList.add(item);
  void removeFromProgramsList(StudyProgramListStruct item) =>
      programsList.remove(item);
  void removeAtIndexFromProgramsList(int index) => programsList.removeAt(index);
  void insertAtIndexInProgramsList(int index, StudyProgramListStruct item) =>
      programsList.insert(index, item);
  void updateProgramsListAtIndex(
          int index, Function(StudyProgramListStruct) updateFn) =>
      programsList[index] = updateFn(programsList[index]);

  String checkCode = '';

  List<ProgramStruct> programs = [];
  void addToPrograms(ProgramStruct item) => programs.add(item);
  void removeFromPrograms(ProgramStruct item) => programs.remove(item);
  void removeAtIndexFromPrograms(int index) => programs.removeAt(index);
  void insertAtIndexInPrograms(int index, ProgramStruct item) =>
      programs.insert(index, item);
  void updateProgramsAtIndex(int index, Function(ProgramStruct) updateFn) =>
      programs[index] = updateFn(programs[index]);

  List<ProgaramsCreateDepartmentsStruct> programIds = [];
  void addToProgramIds(ProgaramsCreateDepartmentsStruct item) =>
      programIds.add(item);
  void removeFromProgramIds(ProgaramsCreateDepartmentsStruct item) =>
      programIds.remove(item);
  void removeAtIndexFromProgramIds(int index) => programIds.removeAt(index);
  void insertAtIndexInProgramIds(
          int index, ProgaramsCreateDepartmentsStruct item) =>
      programIds.insert(index, item);
  void updateProgramIdsAtIndex(
          int index, Function(ProgaramsCreateDepartmentsStruct) updateFn) =>
      programIds[index] = updateFn(programIds[index]);

  int loop = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for code widget.
  FocusNode? codeFocusNode;
  TextEditingController? codeTextController;
  String? Function(BuildContext, String?)? codeTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for DropDownBranch_id widget.
  String? dropDownBranchIdValue;
  FormFieldController<String>? dropDownBranchIdValueController;
  // State field(s) for programs_id widget.
  String? programsIdValue;
  FormFieldController<String>? programsIdValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    codeFocusNode?.dispose();
    codeTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }

  /// Action blocks.
  Future getLinkBranchList(BuildContext context) async {
    ApiCallResponse? apiResultist;
    bool? checkRefreshTokenBlockad;

    apiResultist = await BranchGroup.branchListCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}}},{\"status\":{\"_eq\":\"published\"}}]}',
    );

    if ((apiResultist.succeeded ?? true)) {
      branchList =
          BranchListDataStruct.maybeFromMap((apiResultist.jsonBody ?? ''))!
              .data
              .toList()
              .cast<BranchListStruct>();
    } else {
      checkRefreshTokenBlockad = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultist.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlockad!) {
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
        await getLinkBranchList(context);
      }
    }
  }

  Future getPrograms(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlockdf;

    apiResultList = await StudyProgramGroup.studyProgramListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}},{\"status\":{\"_eq\":\"published\"}}]}',
    );

    if ((apiResultList.succeeded ?? true)) {
      programsList = StudyProgramListDataStruct.maybeFromMap(
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
        await getLinkBranchList(context);
      }
    }
  }

  Future postDepartment(BuildContext context) async {
    ApiCallResponse? apiResultPostDepartment;
    bool? checkRefreshTokenBlockak;

    apiResultPostDepartment = await DepartmentGroup.postdepartmentCall.call(
      accessToken: FFAppState().accessToken,
      name: nameTextController.text,
      description: descriptionTextController.text,
      code: codeTextController.text,
      branchId: FFAppState().user.role == '82073000-1ba2-43a4-a55c-459d17c23b68'
          ? dropDownBranchIdValue
          : getJsonField(
              FFAppState().staffLogin,
              r'''$.branch_id''',
            ).toString().toString(),
      programsIdJson: programIds.map((e) => e.toMap()).toList(),
    );

    if ((apiResultPostDepartment.succeeded ?? true)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Tạo bộ phận thành công!',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
      await Future.delayed(const Duration(milliseconds: 500));
      if (Navigator.of(context).canPop()) {
        context.pop();
      }
      context.pushNamed(
        'DepartmentList',
        extra: <String, dynamic>{
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );
    } else {
      checkRefreshTokenBlockak = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultPostDepartment.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlockak!) {
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
        await postDepartment(context);
      }
    }
  }
}
