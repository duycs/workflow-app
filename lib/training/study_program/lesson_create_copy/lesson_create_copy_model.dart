import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'lesson_create_copy_widget.dart' show LessonCreateCopyWidget;
import 'package:flutter/material.dart';

class LessonCreateCopyModel extends FlutterFlowModel<LessonCreateCopyWidget> {
  ///  Local state fields for this page.

  List<TestListStruct> list = [];
  void addToList(TestListStruct item) => list.add(item);
  void removeFromList(TestListStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, TestListStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(TestListStruct) updateFn) =>
      list[index] = updateFn(list[index]);

  String uploadImage = '';

  String uploadVideo = '';

  String uploadFile = '';

  String checkContent = '';

  int? checkTime;

  String input = '';

  String output = '';

  String testId = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    durationHoursFocusNode?.dispose();
    durationHoursTextController?.dispose();

    estimateInDayFocusNode?.dispose();
    estimateInDayTextController?.dispose();
  }

  /// Action blocks.
  Future testList(BuildContext context) async {
    ApiCallResponse? apiResultListIdStaff;

    apiResultListIdStaff = await TestGroup.testListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}}]}',
    );

    if ((apiResultListIdStaff.succeeded ?? true)) {
      list = TestListDataStruct.maybeFromMap(
              (apiResultListIdStaff.jsonBody ?? ''))!
          .data
          .toList()
          .cast<TestListStruct>();
    }
  }

  Future createLesson(BuildContext context) async {
    ApiCallResponse? apiResultCreateLesson;

    apiResultCreateLesson = await LessonGroup.postLessonCall.call(
      requestDataJson: <String, dynamic>{
        'status': 'published',
        'name': nameTextController.text,
        'description': descriptionTextController.text,
        'image_cover':
            uploadImage != '' ? uploadImage : null,
        'video': uploadVideo != '' ? checkTime : null,
        'duration_hours': durationHoursTextController.text,
        'test_id':
            testIdValue != null && testIdValue != '' ? testIdValue : null,
        'file': uploadFile != '' ? uploadFile : null,
        'estimate_in_day': estimateInDayTextController.text != ''
            ? estimateInDayTextController.text
            : null,
      },
      accessToken: FFAppState().accessToken,
    );

    if ((apiResultCreateLesson.succeeded ?? true)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Tạo bài học thành công!',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  Future uploadFIleVideo(BuildContext context) async {
    ApiCallResponse? apiResultUploadVideo;

    apiResultUploadVideo = await UploadFileGroup.uploadFileCall.call(
      accessToken: FFAppState().accessToken,
      file: uploadedLocalFile2,
    );

    if ((apiResultUploadVideo.succeeded ?? true)) {
      uploadVideo = getJsonField(
        (apiResultUploadVideo.jsonBody ?? ''),
        r'''$.data.id''',
      ).toString().toString();
    }
  }

  Future uploadFIleImage(BuildContext context) async {
    ApiCallResponse? apiResultUploadImage;

    apiResultUploadImage = await UploadFileGroup.uploadFileCall.call(
      accessToken: FFAppState().accessToken,
      file: uploadedLocalFile1,
    );

    if ((apiResultUploadImage.succeeded ?? true)) {
      uploadImage = getJsonField(
        (apiResultUploadImage.jsonBody ?? ''),
        r'''$.data.id''',
      ).toString().toString();
    }
  }

  Future uploadFileFile(BuildContext context) async {
    ApiCallResponse? apiResultUploadFileFile;

    apiResultUploadFileFile = await UploadFileGroup.uploadFileCall.call(
      accessToken: FFAppState().accessToken,
      file: uploadedLocalFile3,
    );

    if ((apiResultUploadFileFile.succeeded ?? true)) {
      uploadFile = getJsonField(
        (apiResultUploadFileFile.jsonBody ?? ''),
        r'''$.data.id''',
      ).toString().toString();
    }
  }
}
