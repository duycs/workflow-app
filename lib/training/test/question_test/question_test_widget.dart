import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'question_test_model.dart';
export 'question_test_model.dart';

class QuestionTestWidget extends StatefulWidget {
  const QuestionTestWidget({
    super.key,
    this.callBack,
  });

  final Future Function(QuestionObjectStruct? item)? callBack;

  @override
  State<QuestionTestWidget> createState() => _QuestionTestWidgetState();
}

class _QuestionTestWidgetState extends State<QuestionTestWidget> {
  late QuestionTestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionTestModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.reloadTokenQuestion = await action_blocks.tokenReload(context);
      if (_model.reloadTokenQuestion!) {
        _model.apiResultQuestionList =
            await QuestionGroup.questionListCall.call(
          accessToken: FFAppState().accessToken,
          filter: '{\"_and\":[{},{\"organization_id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffLogin,
            r'''$.organization_id''',
          ).toString().toString()}\"}},{\"status\":{\"_eq\":\"published\"}}]}',
        );
        if ((_model.apiResultQuestionList?.succeeded ?? true)) {
          _model.questionList = QuestionObjectListDataStruct.maybeFromMap(
                  (_model.apiResultQuestionList?.jsonBody ?? ''))!
              .data
              .toList()
              .cast<QuestionObjectStruct>();
          setState(() {});
        }
      } else {
        setState(() {});
        return;
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowDropDown<String>(
      controller: _model.questionValueController ??=
          FormFieldController<String>(
        _model.questionValue ??= '',
      ),
      options: List<String>.from(_model.questionList.map((e) => e.id).toList()),
      optionLabels: _model.questionList.map((e) => e.content).toList(),
      onChanged: (val) async {
        setState(() => _model.questionValue = val);
        await widget.callBack?.call(
          _model.questionList
              .where((e) => e.id == _model.questionValue)
              .toList()
              .first,
        );
      },
      width: double.infinity,
      height: 50.0,
      searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
            fontFamily: 'Nunito Sans',
            letterSpacing: 0.0,
          ),
      searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Nunito Sans',
            letterSpacing: 0.0,
          ),
      textStyle: FlutterFlowTheme.of(context).labelMedium.override(
            fontFamily: 'Nunito Sans',
            fontSize: 13.0,
            letterSpacing: 0.0,
          ),
      hintText: 'Tìm kiếm câu hỏi từ thư viện',
      searchHintText: 'Tìm kiếm câu hỏi',
      icon: Icon(
        Icons.expand_more,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 20.0,
      ),
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2.0,
      borderColor: FlutterFlowTheme.of(context).alternate,
      borderWidth: 1.0,
      borderRadius: 8.0,
      margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
      hidesUnderline: true,
      isOverButton: true,
      isSearchable: true,
      isMultiSelect: false,
    );
  }
}
