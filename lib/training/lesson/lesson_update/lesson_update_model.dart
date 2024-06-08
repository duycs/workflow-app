import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'lesson_update_widget.dart' show LessonUpdateWidget;
import 'package:flutter/material.dart';

class LessonUpdateModel extends FlutterFlowModel<LessonUpdateWidget> {
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

  bool isLoad = false;

  String checkContent = '';

  int? checkTime;

  String input = '';

  String output = '';

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
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for test_id widget.
  String? testIdValue;
  FormFieldController<String>? testIdValueController;
  // State field(s) for duration_hours widget.
  FocusNode? durationHoursFocusNode;
  TextEditingController? durationHoursTextController;
  String? Function(BuildContext, String?)? durationHoursTextControllerValidator;
  // State field(s) for estimate_in_day widget.
  FocusNode? estimateInDayFocusNode;
  TextEditingController? estimateInDayTextController;
  String? Function(BuildContext, String?)? estimateInDayTextControllerValidator;
  // State field(s) for RadioButtonStatus widget.
  FormFieldController<String>? radioButtonStatusValueController;
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
    bool? checkRefreshTokenBlock;

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
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultListIdStaff.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock!) {
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
        await testList(context);
      }
    }
  }

  Future updateLesson(BuildContext context) async {
    ApiCallResponse? apiResultUpdateLesson1;
    bool? checkRefreshTokenBlock55;

    apiResultUpdateLesson1 = await LessonGroup.pathLessonCall.call(
      accessToken: FFAppState().accessToken,
      idLesson: getJsonField(
        widget.items,
        r'''$.id''',
      ).toString().toString(),
      requestDataJson: <String, dynamic>{
        'status': radioButtonStatusValue == 'Hoạt động' ? 'published' : 'draft',
        'name': nameTextController.text,
        'description': descriptionTextController.text,
        'content': checkContent != ''
            ? checkContent
            : functions.formatHtml(getJsonField(
                widget.items,
                r'''$.content''',
              ).toString().toString()),
        'image_cover': () {
          if (uploadImage != '') {
            return uploadImage;
          } else if (getJsonField(
                widget.items,
                r'''$.image_cover''',
              ) !=
              null) {
            return getJsonField(
              widget.items,
              r'''$.image_cover''',
            );
          } else {
            return null;
          }
        }(),
        'video': () {
          if (uploadVideo != '') {
            return uploadVideo;
          } else if (getJsonField(
                widget.items,
                r'''$.video''',
              ) !=
              null) {
            return getJsonField(
              widget.items,
              r'''$.video''',
            );
          } else {
            return null;
          }
        }(),
        'duration_hours': durationHoursTextController.text,
        'test_id': testIdValue != 'null' ? testIdValue : null,
        'file': () {
          if (uploadFile != '') {
            return uploadFile;
          } else if (getJsonField(
                widget.items,
                r'''$.file''',
              ) !=
              null) {
            return getJsonField(
              widget.items,
              r'''$.file''',
            );
          } else {
            return null;
          }
        }(),
        'estimate_in_day': (estimateInDayTextController.text != '') &&
                (int.parse(estimateInDayTextController.text) > 0)
            ? estimateInDayTextController.text
            : null,
      },
    );
    if ((apiResultUpdateLesson1.succeeded ?? true)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Sửa bài học thành công!',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );

      context.pushNamed(
        'LessonsList',
        queryParameters: {
          'checkpage': serializeParam(
            widget.checkPage,
            ParamType.String,
          ),
        }.withoutNulls,
        extra: <String, dynamic>{
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );
    } else {
      checkRefreshTokenBlock55 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultUpdateLesson1.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock55!) {
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
        await updateLesson(context);
      }
    }
  }

  Future uploadFileVideo(BuildContext context) async {
    ApiCallResponse? apiResultUploadVideo;
    bool? checkRefreshTokenBlockef;

    apiResultUploadVideo = await UploadFileGroup.uploadFileCall.call(
      accessToken: FFAppState().accessToken,
      file: uploadedLocalFile2,
    );
    if ((apiResultUploadVideo.succeeded ?? true)) {
      uploadVideo = getJsonField(
        (apiResultUploadVideo.jsonBody ?? ''),
        r'''$.data.id''',
      ).toString().toString();
    } else {
      checkRefreshTokenBlockef = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultUploadVideo.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlockef!) {
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
        await uploadFileVideo(context);
      }
    }
  }

  Future uploadFileImage(BuildContext context) async {
    ApiCallResponse? apiResultUploadImage;
    bool? checkRefreshTokenBlockgh;

    apiResultUploadImage = await UploadFileGroup.uploadFileCall.call(
      accessToken: FFAppState().accessToken,
      file: uploadedLocalFile1,
    );
    if ((apiResultUploadImage.succeeded ?? true)) {
      uploadImage = getJsonField(
        (apiResultUploadImage.jsonBody ?? ''),
        r'''$.data.id''',
      ).toString().toString();
    } else {
      checkRefreshTokenBlockgh = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultUploadImage.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlockgh!) {
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
        await uploadFileImage(context);
      }
    }
  }

  Future uploadFileFile(BuildContext context) async {
    ApiCallResponse? apiResultUploadFileFile;
    bool? checkRefreshTokenBlockbn;

    apiResultUploadFileFile = await UploadFileGroup.uploadFileCall.call(
      accessToken: FFAppState().accessToken,
      file: uploadedLocalFile3,
    );
    if ((apiResultUploadFileFile.succeeded ?? true)) {
      uploadFile = getJsonField(
        (apiResultUploadFileFile.jsonBody ?? ''),
        r'''$.data.id''',
      ).toString().toString();
    } else {
      checkRefreshTokenBlockbn = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultUploadFileFile.jsonBody ?? ''),
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
      } else {
        await uploadFileFile(context);
      }
    }
  }

  /// Additional helper methods.
  String? get radioButtonStatusValue => radioButtonStatusValueController?.value;
}
