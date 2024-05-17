import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/lessions_dropdown_widget.dart';
import '/components/tests_dropdown_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'study_program_create_widget.dart' show StudyProgramCreateWidget;
import 'package:flutter/material.dart';

class StudyProgramCreateModel
    extends FlutterFlowModel<StudyProgramCreateWidget> {
  ///  Local state fields for this component.

  StudyProgramListStruct? requestData;
  void updateRequestDataStruct(Function(StudyProgramListStruct) updateFn) =>
      updateFn(requestData ??= StudyProgramListStruct());

  String uploadImage = '';

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
  // Model for TestsDropdown component.
  late TestsDropdownModel testsDropdownModel;
  // State field(s) for estimate_in_day widget.
  FocusNode? estimateInDayFocusNode;
  TextEditingController? estimateInDayTextController;
  String? Function(BuildContext, String?)? estimateInDayTextControllerValidator;
  // Model for LessionsDropdown component.
  late LessionsDropdownModel lessionsDropdownModel;
  // Stores action output result for [Action Block - LessionsAddList] action in LessionsDropdown widget.
  bool? lessionsAddListCheck;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? tokenReloadStudyProgramCreate;
  // Stores action output result for [Backend Call - API (StudyProgramCreate)] action in Button widget.
  ApiCallResponse? apiResulti4j;

  @override
  void initState(BuildContext context) {
    programNameTextControllerValidator = _programNameTextControllerValidator;
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
  Future<bool?> lessionsAddList(
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

  Future uploadImagePrograms(BuildContext context) async {
    ApiCallResponse? apiResultUploadFilePrograms;
    bool? checkRefreshTokenBlockbn;

    apiResultUploadFilePrograms = await UploadFileGroup.uploadFileCall.call(
      accessToken: FFAppState().accessToken,
      file: uploadedLocalFile,
    );
    if ((apiResultUploadFilePrograms.succeeded ?? true)) {
      uploadImage = getJsonField(
        (apiResultUploadFilePrograms.jsonBody ?? ''),
        r'''$.data.id''',
      ).toString().toString();
    } else {
      checkRefreshTokenBlockbn = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultUploadImage?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlockbn!) {
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
      }
    }
  }
}
