import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/lessions_dropdown_widget.dart';
import '/components/tests_dropdown_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/training/study_program/created_lession_study/created_lession_study_widget.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'study_program_edit_widget.dart' show StudyProgramEditWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudyProgramEditModel extends FlutterFlowModel<StudyProgramEditWidget> {
  ///  Local state fields for this component.

  StudyProgramListStruct? requestData;
  void updateRequestDataStruct(Function(StudyProgramListStruct) updateFn) {
    updateFn(requestData ??= StudyProgramListStruct());
  }

  String uploadImageEdit = '';

  int? check;

  int? es;

  List<StudyProgramListLessionsIdStruct> listLessions = [];
  void addToListLessions(StudyProgramListLessionsIdStruct item) =>
      listLessions.add(item);
  void removeFromListLessions(StudyProgramListLessionsIdStruct item) =>
      listLessions.remove(item);
  void removeAtIndexFromListLessions(int index) => listLessions.removeAt(index);
  void insertAtIndexInListLessions(
          int index, StudyProgramListLessionsIdStruct item) =>
      listLessions.insert(index, item);
  void updateListLessionsAtIndex(
          int index, Function(StudyProgramListLessionsIdStruct) updateFn) =>
      listLessions[index] = updateFn(listLessions[index]);

  dynamic itemPrograms;

  StudyProgramListStruct? itemLessions;
  void updateItemLessionsStruct(Function(StudyProgramListStruct) updateFn) {
    updateFn(itemLessions ??= StudyProgramListStruct());
  }

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for ProgramName widget.
  FocusNode? programNameFocusNode;
  TextEditingController? programNameTextController;
  String? Function(BuildContext, String?)? programNameTextControllerValidator;
  String? _programNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập tên chương trình!';
    }

    return null;
  }

  // State field(s) for ProgramDescription widget.
  FocusNode? programDescriptionFocusNode;
  TextEditingController? programDescriptionTextController;
  String? Function(BuildContext, String?)?
      programDescriptionTextControllerValidator;
  String? _programDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập mô tả chương trình!';
    }

    return null;
  }

  // Model for TestsDropdown component.
  late TestsDropdownModel testsDropdownModel;
  // State field(s) for estimate_in_day widget.
  FocusNode? estimateInDayFocusNode;
  TextEditingController? estimateInDayTextController;
  String? Function(BuildContext, String?)? estimateInDayTextControllerValidator;
  // Model for LessionsDropdown component.
  late LessionsDropdownModel lessionsDropdownModel;
  // Stores action output result for [Action Block - addList] action in LessionsDropdown widget.
  bool? updateLessionItem;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? tokenStudyProgramEdit;
  // Stores action output result for [Backend Call - API (StudyProgramLessionsUpdate)] action in Button widget.
  ApiCallResponse? apiResultuus;
  // Stores action output result for [Backend Call - API (SynchronizedStaffLesson)] action in Button widget.
  ApiCallResponse? apiResultSynchronizedStaffLesson;
  // Stores action output result for [Backend Call - API (StudyProgramLessionsUpdate)] action in Button widget.
  ApiCallResponse? apiResultuus111;
  // Stores action output result for [Backend Call - API (SynchronizedStaffLesson)] action in Button widget.
  ApiCallResponse? apiResultSynchronizedStaffLesson1;
  // Stores action output result for [Backend Call - API (StudyProgramLessionsUpdate)] action in Button widget.
  ApiCallResponse? apiResultuus11122;
  // Stores action output result for [Backend Call - API (SynchronizedStaffLesson)] action in Button widget.
  ApiCallResponse? apiResultSynchronizedStaffLesson12;
  // Stores action output result for [Backend Call - API (StudyProgramLessionsUpdate)] action in Button widget.
  ApiCallResponse? apiResultuus1112233;
  // Stores action output result for [Backend Call - API (SynchronizedStaffLesson)] action in Button widget.
  ApiCallResponse? apiResultSynchronizedStaffLesson123;

  @override
  void initState(BuildContext context) {
    programNameTextControllerValidator = _programNameTextControllerValidator;
    programDescriptionTextControllerValidator =
        _programDescriptionTextControllerValidator;
    testsDropdownModel = createModel(context, () => TestsDropdownModel());
    lessionsDropdownModel = createModel(context, () => LessionsDropdownModel());
  }

  @override
  void dispose() {
    programNameFocusNode?.dispose();
    programNameTextController?.dispose();

    programDescriptionFocusNode?.dispose();
    programDescriptionTextController?.dispose();

    testsDropdownModel.dispose();
    estimateInDayFocusNode?.dispose();
    estimateInDayTextController?.dispose();

    lessionsDropdownModel.dispose();
  }

  /// Action blocks.
  Future<bool?> addList(
    BuildContext context, {
    LessonsStruct? lessionsItem,
  }) async {
    if (!requestData!.lessions
        .map((e) => e.lessionsId.id)
        .toList()
        .toList()
        .contains(lessionsItem!.id)) {
      listLessions = [];
      listLessions = requestData!.lessions
          .toList()
          .cast<StudyProgramListLessionsIdStruct>();
      addToListLessions(StudyProgramListLessionsIdStruct(
        lessionsId: LessonsStruct(
          id: lessionsItem?.id,
          name: lessionsItem?.name,
        ),
      ));
      updateRequestDataStruct(
        (e) => e..lessions = listLessions.toList(),
      );
      return true;
    } else {
      return false;
    }
  }

  Future uploadImage(BuildContext context) async {
    ApiCallResponse? apiResultUploadFileimg;
    bool? checkRefreshTokenBlock789;

    apiResultUploadFileimg = await UploadFileGroup.uploadFileCall.call(
      file: uploadedLocalFile,
      accessToken: FFAppState().accessToken,
    );

    if ((apiResultUploadFileimg?.succeeded ?? true)) {
      uploadImageEdit = getJsonField(
        (apiResultUploadFileimg?.jsonBody ?? ''),
        r'''$.data.id''',
      ).toString().toString();
      updateRequestDataStruct(
        (e) => e
          ..imageCover = () {
            if (uploadImageEdit != null && uploadImageEdit != '') {
              return uploadImageEdit;
            } else if (widget!.dataDetail?.imageCover != null &&
                widget!.dataDetail?.imageCover != '') {
              return widget!.dataDetail?.imageCover;
            } else {
              return null;
            }
          }(),
      );
    } else {
      checkRefreshTokenBlock789 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultUploadFileimg?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock789!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await uploadImage(context);
      }

      return;
    }
  }

  Future<bool?> addLession(
    BuildContext context, {
    LessonsStruct? itemLession,
  }) async {
    if (!requestData!.lessions
        .map((e) => e.lessionsId.id)
        .toList()
        .toList()
        .contains(itemLession!.id)) {
      listLessions = [];
      listLessions = requestData!.lessions
          .toList()
          .cast<StudyProgramListLessionsIdStruct>();
      addToListLessions(StudyProgramListLessionsIdStruct(
        lessionsId: LessonsStruct(
          id: itemLession?.id,
          name: itemLession?.name,
        ),
      ));
      updateRequestDataStruct(
        (e) => e..lessions = listLessions.toList(),
      );
      return true;
    } else {
      return false;
    }
  }
}
