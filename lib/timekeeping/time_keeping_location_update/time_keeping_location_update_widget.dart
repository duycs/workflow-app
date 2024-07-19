import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'time_keeping_location_update_model.dart';
export 'time_keeping_location_update_model.dart';

class TimeKeepingLocationUpdateWidget extends StatefulWidget {
  const TimeKeepingLocationUpdateWidget({
    super.key,
    required this.item,
  });

  final AddressListStruct? item;

  @override
  State<TimeKeepingLocationUpdateWidget> createState() =>
      _TimeKeepingLocationUpdateWidgetState();
}

class _TimeKeepingLocationUpdateWidgetState
    extends State<TimeKeepingLocationUpdateWidget> {
  late TimeKeepingLocationUpdateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeKeepingLocationUpdateModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.getListDataCity(context);
      setState(() {});
      await _model.getListDataDistricts(context);
      setState(() {});
      await _model.getListDataWards(context);
      setState(() {});
    });

    _model.textController1 ??=
        TextEditingController(text: widget.item?.detail);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.item?.meterRange.toString());
    _model.textFieldFocusNode2 ??= FocusNode();

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

    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
        ),
        alignment: const AlignmentDirectional(0.0, 1.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      context.pop();
                    },
                  ),
                  Expanded(
                    child: Text(
                      'Địa chỉ mới',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito Sans',
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 4.0),
                        child: Text(
                          'Tỉnh/Thành phố',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController1 ??=
                            FormFieldController<String>(
                          _model.dropDownValue1 ??=
                              widget.item?.wardId.districtId.cityId.id,
                        ),
                        options: List<String>.from(
                            _model.listCity.map((e) => e.id).toList()),
                        optionLabels:
                            _model.listCity.map((e) => e.name).toList(),
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue1 = val),
                        width: 300.0,
                        height: 56.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Chọn tỉnh/thành phố',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 0.0,
                        borderColor: Colors.transparent,
                        borderWidth: 0.0,
                        borderRadius: 8.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 4.0),
                        child: Text(
                          'Quận/Huyện',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController2 ??=
                            FormFieldController<String>(
                          _model.dropDownValue2 ??=
                              widget.item?.wardId.districtId.id,
                        ),
                        options: List<String>.from(
                            _model.listDistricts.map((e) => e.id).toList()),
                        optionLabels: _model.dropDownValue1 != null &&
                                _model.dropDownValue1 != ''
                            ? _model.listDistricts
                                .where((e) => e.cityId == _model.dropDownValue1)
                                .toList()
                                .map((e) => e.name)
                                .toList()
                            : _model.listDistricts.map((e) => e.name).toList(),
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue2 = val),
                        width: 300.0,
                        height: 56.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Chọn quận/huyện',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 0.0,
                        borderColor: Colors.transparent,
                        borderWidth: 0.0,
                        borderRadius: 8.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 4.0),
                        child: Text(
                          'Xã',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController3 ??=
                            FormFieldController<String>(
                          _model.dropDownValue3 ??= widget.item?.wardId.id,
                        ),
                        options: List<String>.from(
                            _model.listWards.map((e) => e.id).toList()),
                        optionLabels: _model.dropDownValue2 != null &&
                                _model.dropDownValue2 != ''
                            ? _model.listWards
                                .where((e) =>
                                    e.districtId == _model.dropDownValue2)
                                .toList()
                                .map((e) => e.name)
                                .toList()
                            : _model.listWards.map((e) => e.name).toList(),
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue3 = val),
                        width: 300.0,
                        height: 56.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Chọn xã',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 0.0,
                        borderColor: Colors.transparent,
                        borderWidth: 0.0,
                        borderRadius: 8.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 4.0),
                        child: Text(
                          'Địa chỉ cụ thể:',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 6.0, 8.0, 6.0),
                          child: TextFormField(
                            controller: _model.textController1,
                            focusNode: _model.textFieldFocusNode1,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Nhập địa chỉ...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                            validator: _model.textController1Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: FlutterFlowPlacePicker(
                          iOSGoogleMapsApiKey: '',
                          androidGoogleMapsApiKey: '',
                          webGoogleMapsApiKey: '',
                          onSelect: (place) async {
                            setState(() => _model.placePickerValue = place);
                          },
                          defaultText: 'Chọn từ bản đồ',
                          icon: Icon(
                            Icons.place,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          buttonOptions: FFButtonOptions(
                            height: 42.0,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 1.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 4.0),
                        child: Text(
                          'Phạm vi áp dụng (m)',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      TextFormField(
                        controller: _model.textController2,
                        focusNode: _model.textFieldFocusNode2,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'VD: 500',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              letterSpacing: 0.0,
                            ),
                        keyboardType: TextInputType.number,
                        validator: _model.textController2Validator
                            .asValidator(context),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                        child: Text(
                          '* Trong vòng bán kính phạm vi áp dụng, nhân viên có thể chấm công hợp lệ',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: FFButtonWidget(
                onPressed: () async {
                  var shouldSetState = false;
                  _model.checkLocationTimeKeepingUpdate =
                      await actions.getCurrentLocationStruct();
                  shouldSetState = true;
                  if ((_model.checkLocationTimeKeepingUpdate != null &&
                          (_model.checkLocationTimeKeepingUpdate)!
                              .isNotEmpty) ==
                      true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Chỉnh sửa thành công',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  } else {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: const Text('Vui lòng bật định vị để tiếp tục.'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                    if (shouldSetState) setState(() {});
                    return;
                  }

                  _model.checkTokenTimeKeepingLocationUpdate =
                      await action_blocks.tokenReload(context);
                  shouldSetState = true;
                  if (!_model.checkTokenTimeKeepingLocationUpdate!) {
                    setState(() {});
                    if (shouldSetState) setState(() {});
                    return;
                  }
                  _model.apiResulttrf =
                      await TimeKeepingGroup.timeKeepingLocationUpdateCall.call(
                    id: widget.item?.id,
                    accessToken: FFAppState().accessToken,
                    requesDataJson: <String, dynamic>{
                      'status': 'published',
                      'detail': _model.textController1.text,
                      'meter_range': _model.textController2.text,
                      'ward_id': <String, dynamic>{
                        'id': 'b591559f-56ea-4744-94cc-fa9d263b44d0',
                        'name': _model.dropDownValue3,
                      },
                      'district_id': <String, dynamic>{
                        'id': '87fa611d-0812-4f2c-ae75-83d9a9fdfcfd',
                        'name': _model.dropDownValue2,
                      },
                      'city_id': <String, dynamic>{
                        'id': '839dfb39-fe33-4c09-b910-c269b4d77d2f',
                        'name': _model.dropDownValue1,
                      },
                      'location': <String, dynamic>{
                        'map': getJsonField(
                          <String, List<dynamic>>{
                            'coordinates':
                                _model.checkLocationTimeKeepingUpdate!,
                          },
                          r'''$.map''',
                        ),
                      },
                    },
                  );

                  shouldSetState = true;
                  if (!(_model.apiResulttrf?.succeeded ?? true)) {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: const Text('Chỉnh sửa thất bại!'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  if (shouldSetState) setState(() {});
                },
                text: 'Chỉnh sửa địa chỉ ',
                icon: const Icon(
                  Icons.save_alt,
                  size: 24.0,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Nunito Sans',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
