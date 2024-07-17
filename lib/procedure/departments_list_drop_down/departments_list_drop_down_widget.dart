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
import 'departments_list_drop_down_model.dart';
export 'departments_list_drop_down_model.dart';

class DepartmentsListDropDownWidget extends StatefulWidget {
  const DepartmentsListDropDownWidget({
    super.key,
    required this.callBack,
    required this.id,
  });

  final Future Function(DepartmentListStruct? item)? callBack;
  final String? id;

  @override
  State<DepartmentsListDropDownWidget> createState() =>
      _DepartmentsListDropDownWidgetState();
}

class _DepartmentsListDropDownWidgetState
    extends State<DepartmentsListDropDownWidget> {
  late DepartmentsListDropDownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DepartmentsListDropDownModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
      _model.tokenReloadDepartmentsListDropDown =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadDepartmentsListDropDown!) {
        _model.apiResultList = await DepartmentGroup.getDepartmentListCall.call(
          accessToken: FFAppState().accessToken,
          filter: '{\"_and\":[${() {
            if (FFAppState().user.role ==
                '82073000-1ba2-43a4-a55c-459d17c23b68') {
              return '{\"organization_id\":{\"_eq\":\"';
            } else if (FFAppState().user.role ==
                'a8d33527-375b-4599-ac70-6a3fcad1de39') {
              return '{\"branch_id\":{\"id\":{\"_eq\":\"';
            } else {
              return ' ';
            }
          }()}${() {
            if (FFAppState().user.role ==
                '82073000-1ba2-43a4-a55c-459d17c23b68') {
              return getJsonField(
                FFAppState().staffLogin,
                r'''$.organization_id''',
              ).toString().toString();
            } else if (FFAppState().user.role ==
                'a8d33527-375b-4599-ac70-6a3fcad1de39') {
              return getJsonField(
                FFAppState().staffBranch,
                r'''$.id''',
              ).toString().toString();
            } else {
              return ' ';
            }
          }()}${() {
            if (FFAppState().user.role ==
                '82073000-1ba2-43a4-a55c-459d17c23b68') {
              return '\"}}';
            } else if (FFAppState().user.role ==
                'a8d33527-375b-4599-ac70-6a3fcad1de39') {
              return '\"}}}';
            } else {
              return ' ';
            }
          }()},{\"status\":{\"_eq\":\"published\"}}]}',
        );

        if ((_model.apiResultList?.succeeded ?? true)) {
          _model.data = DepartmentListDataStruct.maybeFromMap(
                  (_model.apiResultList?.jsonBody ?? ''))!
              .data
              .toList()
              .cast<DepartmentListStruct>();
          setState(() {});
        }
      } else {
        setState(() {});
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      controller: _model.dropDownValueController ??=
          FormFieldController<String>(
        _model.dropDownValue ??= widget.id,
      ),
      options: List<String>.from(_model.data.map((e) => e.id).toList()),
      optionLabels: _model.data.map((e) => e.name).toList(),
      onChanged: (val) async {
        setState(() => _model.dropDownValue = val);
        await widget.callBack?.call(
          _model.data.where((e) => e.id == _model.dropDownValue).toList().first,
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
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Nunito Sans',
            letterSpacing: 0.0,
          ),
      hintText: 'Bộ phận',
      searchHintText: 'Bộ phận',
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 24.0,
      ),
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 1.0,
      borderColor: FlutterFlowTheme.of(context).alternate,
      borderWidth: 1.0,
      borderRadius: 4.0,
      margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
      hidesUnderline: true,
      isOverButton: true,
      isSearchable: true,
      isMultiSelect: false,
    );
  }
}
