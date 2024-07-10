import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/rich_text_editor/mobile_editor_display_component/mobile_editor_display_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'lesson_create_widget.dart' show LessonCreateWidget;
import 'package:flutter/material.dart';

class LessonCreateModel extends FlutterFlowModel<LessonCreateWidget> {
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

  int? checkTime;

  String checkContent = '';

  String input = '';

  String testId = '';

  LessonsStruct? listLession;
  void updateListLessionStruct(Function(LessonsStruct) updateFn) {
    updateFn(listLession ??= LessonsStruct());
  }

  String output = '';

  String checkIamge = '';

  dynamic json;

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

  // Model for MobileEditorDisplayComponent component.
  late MobileEditorDisplayComponentModel mobileEditorDisplayComponentModel;

  @override
  void initState(BuildContext context) {
    mobileEditorDisplayComponentModel =
        createModel(context, () => MobileEditorDisplayComponentModel());
  }

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

    mobileEditorDisplayComponentModel.dispose();
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

  Future createLesson(BuildContext context) async {
    ApiCallResponse? apiResultCreateLesson;
    bool? checkRefreshTokenBlock11;

    apiResultCreateLesson = await LessonGroup.postLessonCall.call(
      requestDataJson: <String, dynamic>{
        'status': 'published',
        'name': nameTextController.text,
        'description': descriptionTextController.text,
        'content': checkContent,
        'image_cover':
            uploadImage != '' ? uploadImage : null,
        'video': uploadVideo != '' ? uploadVideo : null,
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
      listLession = LessonsStruct.maybeFromMap(getJsonField(
        (apiResultCreateLesson.jsonBody ?? ''),
        r'''$.data''',
      ));
      await Future.delayed(const Duration(milliseconds: 1000));
      if (widget!.checkPage == 'studyProgram1') {
        context.pushNamed(
          'StudyProgramList',
          queryParameters: {
            'showModal': serializeParam(
              'LessonCreate',
              ParamType.String,
            ),
            'itemLesstion': serializeParam(
              listLession,
              ParamType.DataStruct,
            ),
            'programsItem': serializeParam(
              widget!.programsItem,
              ParamType.JSON,
            ),
            'itemListLession': serializeParam(
              widget!.listItemLession,
              ParamType.DataStruct,
            ),
            'imagesProgram': serializeParam(
              widget!.imageProgram,
              ParamType.FFUploadedFile,
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
        if (Navigator.of(context).canPop()) {
          context.pop();
        }
        context.pushNamed(
          'LessonsList',
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }

      if (widget!.checkPage == 'StudyProgramEdit') {
        context.pushNamed(
          'StudyProgramList',
          queryParameters: {
            'showModal': serializeParam(
              'StudyProgramEdit',
              ParamType.String,
            ),
            'programsItem': serializeParam(
              widget!.programsItem,
              ParamType.JSON,
            ),
            'itemListLession': serializeParam(
              widget!.listItemLession,
              ParamType.DataStruct,
            ),
            'dataProframDeatail': serializeParam(
              widget!.dataProgramDetail,
              ParamType.DataStruct,
            ),
            'itemLesstion': serializeParam(
              listLession,
              ParamType.DataStruct,
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
      }
    } else {
      checkRefreshTokenBlock11 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultCreateLesson.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock11!) {
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
        await createLesson(context);
      }
    }
  }

  Future uploadFIleVideo(BuildContext context) async {
    ApiCallResponse? apiResultUploadVideo;
    bool? checkRefreshTokenBlockgh;

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
      checkRefreshTokenBlockgh = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultUploadVideo.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlockgh!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Lỗi tải Video!',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await uploadFIleVideo(context);
      }
    }
  }

  Future uploadFIleImage(BuildContext context) async {
    ApiCallResponse? apiResultUploadImage;
    bool? checkRefreshTokenBlockbn;

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
      checkRefreshTokenBlockbn = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultUploadImage.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlockbn!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Ảnh vượt quá dung lượng!',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
        checkIamge = '1';
      } else {
        await uploadFIleImage(context);
      }

      return;
    }
  }

  Future uploadFileFile(BuildContext context) async {
    ApiCallResponse? apiResultUploadFileFile;
    bool? checkRefreshTokenBlockef;

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
      checkRefreshTokenBlockef = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultUploadFileFile.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlockef!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Lỗi tải File!',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await uploadFileFile(context);
      }

      return;
    }
  }
}
