import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'staffs_list_dropdown_model.dart';
export 'staffs_list_dropdown_model.dart';

class StaffsListDropdownWidget extends StatefulWidget {
  const StaffsListDropdownWidget({
    super.key,
    required this.callBack,
    this.value,
    bool? type,
  }) : this.type = type ?? false;

  final Future Function(String? item)? callBack;
  final String? value;
  final bool type;

  @override
  State<StaffsListDropdownWidget> createState() =>
      _StaffsListDropdownWidgetState();
}

class _StaffsListDropdownWidgetState extends State<StaffsListDropdownWidget> {
  late StaffsListDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StaffsListDropdownModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultList = await StaffGroup.getStaffListCall.call(
        accessToken: FFAppState().accessToken,
        filter: '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffLogin,
          r'''$.organization_id''',
        ).toString().toString()}\"}}]}',
      );

      if ((_model.apiResultList?.succeeded ?? true)) {
        _model.staffList = StaffListDataStruct.maybeFromMap(
                (_model.apiResultList?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<StaffListStruct>();
        setState(() {});
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
        _model.dropDownValue ??= widget!.value,
      ),
      options: List<String>.from(_model.staffList.map((e) => e.id).toList()),
      optionLabels: _model.staffList.map((e) => e.userId.firstName).toList(),
      onChanged: (val) async {
        setState(() => _model.dropDownValue = val);
        setState(() {});
        await widget.callBack?.call(
          _model.dropDownValue,
        );
      },
      width: double.infinity,
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
      hintText: 'Nhân viên',
      searchHintText: 'Tìm kiếm nhân viên',
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
      margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
      hidesUnderline: true,
      isOverButton: true,
      isSearchable: true,
      isMultiSelect: false,
    );
  }
}
