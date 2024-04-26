import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/training/test/checkbox_groups_test_add/checkbox_groups_test_add_widget.dart';
import '/training/test/question_create_test/question_create_test_widget.dart';
import '/training/test/question_test/question_test_widget.dart';
import '/training/test/radio_group_tests_add/radio_group_tests_add_widget.dart';
import '/training/test/test_long_text_add/test_long_text_add_widget.dart';
import '/training/test/test_number_add/test_number_add_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'test_update_widget.dart' show TestUpdateWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestUpdateModel extends FlutterFlowModel<TestUpdateWidget> {
  ///  Local state fields for this page.

  List<dynamic> uploadImage = [];
  void addToUploadImage(dynamic item) => uploadImage.add(item);
  void removeFromUploadImage(dynamic item) => uploadImage.remove(item);
  void removeAtIndexFromUploadImage(int index) => uploadImage.removeAt(index);
  void insertAtIndexInUploadImage(int index, dynamic item) =>
      uploadImage.insert(index, item);
  void updateUploadImageAtIndex(int index, Function(dynamic) updateFn) =>
      uploadImage[index] = updateFn(uploadImage[index]);

  List<QuestionObjectStruct> questionItem = [];
  void addToQuestionItem(QuestionObjectStruct item) => questionItem.add(item);
  void removeFromQuestionItem(QuestionObjectStruct item) =>
      questionItem.remove(item);
  void removeAtIndexFromQuestionItem(int index) => questionItem.removeAt(index);
  void insertAtIndexInQuestionItem(int index, QuestionObjectStruct item) =>
      questionItem.insert(index, item);
  void updateQuestionItemAtIndex(
          int index, Function(QuestionObjectStruct) updateFn) =>
      questionItem[index] = updateFn(questionItem[index]);

  List<dynamic> questionIdAdd = [];
  void addToQuestionIdAdd(dynamic item) => questionIdAdd.add(item);
  void removeFromQuestionIdAdd(dynamic item) => questionIdAdd.remove(item);
  void removeAtIndexFromQuestionIdAdd(int index) =>
      questionIdAdd.removeAt(index);
  void insertAtIndexInQuestionIdAdd(int index, dynamic item) =>
      questionIdAdd.insert(index, item);
  void updateQuestionIdAddAtIndex(int index, Function(dynamic) updateFn) =>
      questionIdAdd[index] = updateFn(questionIdAdd[index]);

  int loop = 0;

  TestListStruct? questionId;
  void updateQuestionIdStruct(Function(TestListStruct) updateFn) =>
      updateFn(questionId ??= TestListStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập tiêu đề ';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập điểm đạt';
    }

    if (!RegExp('^[1-9][0-9]?\$|^100\$').hasMatch(val)) {
      return 'Điểm đạt không được nhập 0 và lớn hơn 100 ';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập nội dung';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  String? _textController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập thời gian';
    }

    return null;
  }

  // Model for questionTest component.
  late QuestionTestModel questionTestModel;
  // Stores action output result for [Backend Call - API (questionListOne)] action in Button widget.
  ApiCallResponse? apiResultAddQuestion;
  // Stores action output result for [Backend Call - API (TestUpdate)] action in Button widget.
  ApiCallResponse? apiResultCreateTest;
  // Stores action output result for [Action Block - CheckRefreshToken] action in Button widget.
  bool? checkRefreshTokenBlock2;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
    textController4Validator = _textController4Validator;
    questionTestModel = createModel(context, () => QuestionTestModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    questionTestModel.dispose();
  }

  /// Action blocks.
  Future getLinkTest(BuildContext context) async {
    ApiCallResponse? apiResultGetLinkTest;
    bool? checkRefreshTokenBlock;

    apiResultGetLinkTest = await TestGroup.testOneCall.call(
      testsId: widget.id,
      accessToken: FFAppState().accessToken,
    );
    if ((apiResultGetLinkTest?.succeeded ?? true)) {
      questionId =
          TestOneDataStruct.maybeFromMap((apiResultGetLinkTest?.jsonBody ?? ''))
              ?.data;
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetLinkTest?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock!) {
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
      }
    }
  }
}
