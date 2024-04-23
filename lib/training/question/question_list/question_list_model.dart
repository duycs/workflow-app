import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'question_list_widget.dart' show QuestionListWidget;
import 'package:flutter/material.dart';

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
        filter: questionNameTextController.text != ''
            ? '{\"_and\":[{\"content\":{\"_icontains\":\"${questionNameTextController.text}\"}}${',{\"organization_id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffLogin,
                r'''$.organization_id''',
              ).toString().toString()}\"}}'}]}'
            : '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffLogin,
                r'''$.organization_id''',
              ).toString().toString()}\"}}]}',
      );
      if ((apiResultQuestionListSearch.succeeded ?? true)) {
        dataList = (getJsonField(
          (apiResultQuestionList?.jsonBody ?? ''),
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
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    } else {
      return;
    }
  }
}
