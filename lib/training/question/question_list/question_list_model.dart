import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/question/filter_question/filter_question_widget.dart';
import '/training/question/question_create/question_create_widget.dart';
import '/training/question/question_menu/question_menu_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'question_list_widget.dart' show QuestionListWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionListModel extends FlutterFlowModel<QuestionListWidget> {
  ///  Local state fields for this page.

  List<QuestionObjectStruct> dataList = [];
  void addToDataList(QuestionObjectStruct item) => dataList.add(item);
  void removeFromDataList(QuestionObjectStruct item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, QuestionObjectStruct item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(
          int index, Function(QuestionObjectStruct) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  bool isLoad = false;

  String nameSearch = ' ';

  String status = ' ';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in QuestionList widget.
  bool? tokenReloadQuestionList;
  // Stores action output result for [Backend Call - API (questionList)] action in QuestionList widget.
  ApiCallResponse? apiResultQuestionList;
  // State field(s) for questionName widget.
  FocusNode? questionNameFocusNode;
  TextEditingController? questionNameTextController;
  String? Function(BuildContext, String?)? questionNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    questionNameFocusNode?.dispose();
    questionNameTextController?.dispose();
  }

  /// Action blocks.
  Future getListQuestion(BuildContext context) async {
    bool? tokenReloadGetlistQuestion;
    ApiCallResponse? apiResultQuestionListSearch;

    tokenReloadGetlistQuestion = await action_blocks.tokenReload(context);
    if (tokenReloadGetlistQuestion!) {
      apiResultQuestionListSearch = await QuestionGroup.questionListCall.call(
        accessToken: FFAppState().accessToken,
        filter:
            '{\"_and\":[{}${(nameSearch != null && nameSearch != '') && (nameSearch != ' ') ? ',{\"content\":{\"_icontains\":\"${nameSearch}\"}}' : ' '}${(status != null && status != '') && (status != ' ') ? ',{\"status\":{\"_eq\":\"${status}\"}}' : ' '}${',{\"organization_id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffLogin,
          r'''$.organization_id''',
        ).toString().toString()}\"}}'}]}',
      );
      if ((apiResultQuestionListSearch?.succeeded ?? true)) {
        dataList = (getJsonField(
          (apiResultQuestionListSearch?.jsonBody ?? ''),
          r'''$.data''',
          true,
        )!
                .toList()
                .map<QuestionObjectStruct?>(QuestionObjectStruct.maybeFromMap)
                .toList() as Iterable<QuestionObjectStruct?>)
            .withoutNulls
            .toList()
            .cast<QuestionObjectStruct>();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Lỗi tải dữ liệu!',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    } else {
      return;
    }
  }
}
