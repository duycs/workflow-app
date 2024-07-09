import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/rich_text_editor/mobile_editor_display_component/mobile_editor_display_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'created_lession_study_widget.dart' show CreatedLessionStudyWidget;
import 'package:flutter/material.dart';

class CreatedLessionStudyModel
    extends FlutterFlowModel<CreatedLessionStudyWidget> {
  ///  Local state fields for this component.

  String image = '';

  String video = '';

  String file = '';

  List<TestListStruct> dataTest = [];
  void addToDataTest(TestListStruct item) => dataTest.add(item);
  void removeFromDataTest(TestListStruct item) => dataTest.remove(item);
  void removeAtIndexFromDataTest(int index) => dataTest.removeAt(index);
  void insertAtIndexInDataTest(int index, TestListStruct item) =>
      dataTest.insert(index, item);
  void updateDataTestAtIndex(int index, Function(TestListStruct) updateFn) =>
      dataTest[index] = updateFn(dataTest[index]);

  LessonsStruct? dataListLession;
  void updateDataListLessionStruct(Function(LessonsStruct) updateFn) {
    updateFn(dataListLession ??= LessonsStruct());
  }

  int? checkDay;

  String input = '';

  String testId = '';

  bool checkValidateImage = false;

  bool checkValiContent = false;

  bool checkValiTime = false;

  dynamic content;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập tiêu đề';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập mô tả';
    }

    return null;
  }

  // State field(s) for test_id widget.
  String? testIdValue;
  FormFieldController<String>? testIdValueController;
  // State field(s) for durationHours widget.
  FocusNode? durationHoursFocusNode;
  TextEditingController? durationHoursTextController;
  String? Function(BuildContext, String?)? durationHoursTextControllerValidator;
  // State field(s) for estimate_in_day widget.
  FocusNode? estimateInDayFocusNode;
  TextEditingController? estimateInDayTextController;
  String? Function(BuildContext, String?)? estimateInDayTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for MobileEditorDisplayComponent component.
  late MobileEditorDisplayComponentModel mobileEditorDisplayComponentModel;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? checkReloadTokenCreatedLession2;
  // Stores action output result for [Backend Call - API (PostLesson)] action in Button widget.
  ApiCallResponse? apiResultCreatedLession2;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? checkReloadTokenCreatedLession1;
  // Stores action output result for [Backend Call - API (PostLesson)] action in Button widget.
  ApiCallResponse? apiResultCreatedLession1;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    mobileEditorDisplayComponentModel =
        createModel(context, () => MobileEditorDisplayComponentModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    durationHoursFocusNode?.dispose();
    durationHoursTextController?.dispose();

    estimateInDayFocusNode?.dispose();
    estimateInDayTextController?.dispose();

    mobileEditorDisplayComponentModel.dispose();
  }

  /// Action blocks.
  Future getListTest(BuildContext context) async {
    bool? checkTokenTestList;
    ApiCallResponse? apiResutDataTesst;

    checkTokenTestList = await action_blocks.tokenReload(context);
    if (checkTokenTestList!) {
      apiResutDataTesst = await TestGroup.testListCall.call(
        accessToken: FFAppState().accessToken,
        filter: '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffLogin,
          r'''$.organization_id''',
        ).toString().toString()}\"}}]}',
      );

      if ((apiResutDataTesst.succeeded ?? true)) {
        dataTest = TestListDataStruct.maybeFromMap(
                (apiResutDataTesst.jsonBody ?? ''))!
            .data
            .toList()
            .cast<TestListStruct>();
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future getUploadImage(BuildContext context) async {
    bool? checkReloadTokenImage;
    ApiCallResponse? apiResultUploadFileImage;

    checkReloadTokenImage = await action_blocks.tokenReload(context);
    if (checkReloadTokenImage!) {
      apiResultUploadFileImage = await UploadFileGroup.uploadFileCall.call(
        accessToken: FFAppState().accessToken,
        file: uploadedLocalFile1,
      );

      if ((apiResultUploadFileImage.succeeded ?? true)) {
        image = getJsonField(
          (apiResultUploadFileImage.jsonBody ?? ''),
          r'''$.data.id''',
        ).toString().toString();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Tải ảnh không thành công',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future getDataUploadVideo(BuildContext context) async {
    bool? checkReloadTockenUploadVideo;
    ApiCallResponse? apiResultUploadVideoLession;

    checkReloadTockenUploadVideo = await action_blocks.tokenReload(context);
    if (checkReloadTockenUploadVideo!) {
      apiResultUploadVideoLession = await UploadFileGroup.uploadFileCall.call();

      if ((apiResultUploadVideoLession.succeeded ?? true)) {
        video = getJsonField(
          (apiResultUploadVideoLession.jsonBody ?? ''),
          r'''$.data.id''',
        ).toString().toString();
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future getDataUploadFile(BuildContext context) async {
    bool? checkReloadTokenVideo;
    ApiCallResponse? apiResultq1c;

    checkReloadTokenVideo = await action_blocks.tokenReload(context);
    if (checkReloadTokenVideo!) {
      apiResultq1c = await UploadFileGroup.uploadFileCall.call(
        accessToken: FFAppState().accessToken,
        file: uploadedLocalFile3,
      );

      if ((apiResultq1c.succeeded ?? true)) {
        file = getJsonField(
          (apiResultq1c.jsonBody ?? ''),
          r'''$.data.id''',
        ).toString().toString();
      }
    } else {
      FFAppState().update(() {});
    }
  }

  Future getCreatedLession(BuildContext context) async {
    bool? checkReloadTokenCreatedLession;
    ApiCallResponse? apiResultCreatedLession;

    checkReloadTokenCreatedLession = await action_blocks.tokenReload(context);
    if (checkReloadTokenCreatedLession!) {
      apiResultCreatedLession = await LessonGroup.postLessonCall.call(
        accessToken: FFAppState().accessToken,
        requestDataJson: <String, dynamic>{
          'status': 'published',
          'name': nameTextController.text,
          'description': descriptionTextController.text,
          'content': input,
          'image_cover': image != '' ? image : null,
          'video': video != '' ? video : null,
          'duration_hours': durationHoursTextController.text,
          'test_id': testIdValue,
          'file': file != '' ? file : null,
          'estimate_in_day': estimateInDayTextController.text != ''
              ? estimateInDayTextController.text
              : '',
        },
      );

      if ((apiResultCreatedLession.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Tạo mới bài học thành công',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
        dataListLession = LessonsStruct.maybeFromMap(getJsonField(
          (apiResultCreatedLession.jsonBody ?? ''),
          r'''$.data''',
        ));
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }
}
