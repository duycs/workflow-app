import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lessions_dropdown_model.dart';
export 'lessions_dropdown_model.dart';

class LessionsDropdownWidget extends StatefulWidget {
  const LessionsDropdownWidget({
    super.key,
    required this.lessionsCallBack,
  });

  final Future Function(LessonsStruct? lessionsId)? lessionsCallBack;

  @override
  State<LessionsDropdownWidget> createState() => _LessionsDropdownWidgetState();
}

class _LessionsDropdownWidgetState extends State<LessionsDropdownWidget> {
  late LessionsDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessionsDropdownModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tokenReloadLessionsDropdown =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadLessionsDropdown!) {
        _model.apiResultLessonList = await LessonGroup.getLessonListCall.call(
          accessToken: FFAppState().accessToken,
          filter: '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffLogin,
            r'''$.organization_id''',
          ).toString().toString()}\"}}]}',
        );
        if ((_model.apiResultLessonList?.succeeded ?? true)) {
          _model.dataList = LessonsListDataStruct.maybeFromMap(
                  (_model.apiResultLessonList?.jsonBody ?? ''))!
              .data
              .toList()
              .cast<LessonsStruct>();
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

    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
        child: FlutterFlowDropDown<String>(
          controller: _model.dropDownValueController ??=
              FormFieldController<String>(
            _model.dropDownValue ??= '',
          ),
          options: List<String>.from(_model.dataList.map((e) => e.id).toList()),
          optionLabels: _model.dataList.map((e) => e.name).toList(),
          onChanged: (val) async {
            setState(() => _model.dropDownValue = val);
            await widget.lessionsCallBack?.call(
              _model.dataList
                  .where((e) => e.id == _model.dropDownValue)
                  .toList()
                  .first,
            );
            setState(() {
              _model.dropDownValueController?.reset();
            });
          },
          width: 300.0,
          searchHintTextStyle:
              FlutterFlowTheme.of(context).labelMedium.override(
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
          hintText: 'Bài học',
          searchHintText: 'Tìm kiếm tên bài học',
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          elevation: 1.0,
          borderColor: FlutterFlowTheme.of(context).primaryBackground,
          borderWidth: 1.0,
          borderRadius: 8.0,
          margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
          hidesUnderline: true,
          isOverButton: true,
          isSearchable: true,
          isMultiSelect: false,
        ),
      ),
    );
  }
}
