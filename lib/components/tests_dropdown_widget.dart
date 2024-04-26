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
import 'tests_dropdown_model.dart';
export 'tests_dropdown_model.dart';

class TestsDropdownWidget extends StatefulWidget {
  const TestsDropdownWidget({
    super.key,
    required this.testCallBack,
    this.value,
  });

  final Future Function(TestListStruct? testId)? testCallBack;
  final String? value;

  @override
  State<TestsDropdownWidget> createState() => _TestsDropdownWidgetState();
}

class _TestsDropdownWidgetState extends State<TestsDropdownWidget> {
  late TestsDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestsDropdownModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tokenReloadTestsDropdown =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadTestsDropdown!) {
        _model.apiResultTestList = await TestGroup.testListCall.call(
          filter: '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffLogin,
            r'''$.organization_id''',
          ).toString().toString()}\"}}]}',
          accessToken: FFAppState().accessToken,
        );
        if ((_model.apiResultTestList?.succeeded ?? true)) {
          setState(() {
            _model.dataListTest = TestListDataStruct.maybeFromMap(
                    (_model.apiResultTestList?.jsonBody ?? ''))!
                .data
                .toList()
                .cast<TestListStruct>();
          });
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
      child: FlutterFlowDropDown<String>(
        controller: _model.dropDownValueController ??=
            FormFieldController<String>(
          _model.dropDownValue ??=
              widget.value != null && widget.value != '' ? widget.value : ' ',
        ),
        options:
            List<String>.from(_model.dataListTest.map((e) => e.id).toList()),
        optionLabels: _model.dataListTest.map((e) => e.name).toList(),
        onChanged: (val) async {
          setState(() => _model.dropDownValue = val);
          await widget.testCallBack?.call(
            _model.dataListTest
                .where((e) => e.id == _model.dropDownValue)
                .toList()
                .first,
          );
        },
        width: 300.0,
        height: 56.0,
        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: 'Readex Pro',
              letterSpacing: 0.0,
            ),
        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              letterSpacing: 0.0,
            ),
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              color: FlutterFlowTheme.of(context).secondaryText,
              letterSpacing: 0.0,
            ),
        hintText: 'Bài thi',
        searchHintText: 'Tìm kiếm bài thi',
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 24.0,
        ),
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 0.0,
        borderColor: FlutterFlowTheme.of(context).alternate,
        borderWidth: 1.0,
        borderRadius: 8.0,
        margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
        hidesUnderline: true,
        isOverButton: true,
        isSearchable: true,
        isMultiSelect: false,
      ),
    );
  }
}
