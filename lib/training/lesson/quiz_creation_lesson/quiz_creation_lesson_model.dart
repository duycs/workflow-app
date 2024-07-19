import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/test/checkbox_groups_test_add/checkbox_groups_test_add_widget.dart';
import '/training/test/question_create_test/question_create_test_widget.dart';
import '/training/test/question_test/question_test_widget.dart';
import '/training/test/radio_button_add/radio_button_add_widget.dart';
import '/training/test/test_long_text_add/test_long_text_add_widget.dart';
import '/training/test/test_number_add/test_number_add_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'quiz_creation_lesson_widget.dart' show QuizCreationLessonWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuizCreationLessonModel
    extends FlutterFlowModel<QuizCreationLessonWidget> {
  ///  Local state fields for this component.

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

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập tiêu đề';
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
      return 'Điểm đạt phải lơn 0 và nhỏ hơn hoặc bằng 100 ';
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
      return ' Vui lòng nhập thời gian';
    }

    return null;
  }

  // Model for questionTest component.
  late QuestionTestModel questionTestModel;
  // Stores action output result for [Backend Call - API (questionListOne)] action in Button widget.
  ApiCallResponse? apiResultAddQuestion;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? reloadTokenCreateTest;
  // Stores action output result for [Backend Call - API (CreateTest)] action in Button widget.
  ApiCallResponse? apiResultCreatedTest;

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
}
