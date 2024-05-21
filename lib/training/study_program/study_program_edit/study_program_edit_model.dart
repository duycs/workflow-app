import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/lessions_dropdown_widget.dart';
import '/components/tests_dropdown_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'study_program_edit_widget.dart' show StudyProgramEditWidget;
import 'package:flutter/material.dart';

class StudyProgramEditModel extends FlutterFlowModel<StudyProgramEditWidget> {
  ///  Local state fields for this component.

  StudyProgramListStruct? requestData;
  void updateRequestDataStruct(Function(StudyProgramListStruct) updateFn) =>
      updateFn(requestData ??= StudyProgramListStruct());

  String uploadImageEdit = '';

  int? check;

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
      updateRequestDataStruct(
        (e) => e
          ..updateLessions(
            (e) => e.add(StudyProgramListLessionsIdStruct(
              lessionsId: LessonsStruct(
                id: lessionsItem.id,
                name: lessionsItem.name,
              ),
            )),
          ),
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
    if ((apiResultUploadFileimg.succeeded ?? true)) {
      uploadImageEdit = getJsonField(
        (apiResultUploadFileimg.jsonBody ?? ''),
        r'''$.data.id''',
      ).toString().toString();
      updateRequestDataStruct(
        (e) => e
          ..imageCover = () {
            if (uploadImageEdit != '') {
              return uploadImageEdit;
            } else if (widget.dataDetail?.imageCover != null &&
                widget.dataDetail?.imageCover != '') {
              return widget.dataDetail?.imageCover;
            } else {
              return null;
            }
          }(),
      );
    } else {
      checkRefreshTokenBlock789 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultUploadFileimg.jsonBody ?? ''),
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
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await uploadImage(context);
      }

      return;
    }
  }
}
