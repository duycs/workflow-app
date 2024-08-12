import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/training/market/checkbox_lessions/checkbox_lessions_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_program_market_model.dart';
export 'add_program_market_model.dart';

class AddProgramMarketWidget extends StatefulWidget {
  const AddProgramMarketWidget({
    super.key,
    required this.id,
    this.price,
    this.version,
    this.checkPage,
    this.category,
    this.domain,
    this.nameLession,
    this.lessions,
  });

  final String? id;
  final String? price;
  final int? version;
  final String? checkPage;
  final String? category;
  final String? domain;
  final List<String>? nameLession;
  final StudyProgramListStruct? lessions;

  @override
  State<AddProgramMarketWidget> createState() => _AddProgramMarketWidgetState();
}

class _AddProgramMarketWidgetState extends State<AddProgramMarketWidget> {
  late AddProgramMarketModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddProgramMarketModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
      _model.tokenReloadAddWorkflowMarket =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadAddWorkflowMarket!) {
        _model.checkBoxLession = widget!.lessions;
        setState(() {});
        _model.apiResultwkg = await CategoriesGroup.getCategoriesListCall.call(
          accessToken: FFAppState().accessToken,
        );

        if ((_model.apiResultwkg?.succeeded ?? true)) {
          _model.categoryList = CategoriesListDataStruct.maybeFromMap(
                  (_model.apiResultwkg?.jsonBody ?? ''))!
              .data
              .toList()
              .cast<CategoriesListStruct>();
          setState(() {});
          _model.apiResultDomain = await DomainGroup.getDomainsListCall.call(
            accessToken: FFAppState().accessToken,
          );

          if ((_model.apiResultDomain?.succeeded ?? true)) {
            _model.domainList = DomainsListDataStruct.maybeFromMap(
                    (_model.apiResultDomain?.jsonBody ?? ''))!
                .data
                .toList()
                .cast<DomainsListStruct>();
            setState(() {});
            await _model.getPriceList(context);
            setState(() {});
            while (_model.loop < widget!.nameLession!.length) {
              _model.updateCheckBoxLessionStruct(
                (e) => e
                  ..updateLessions(
                    (e) => e[_model.loop]
                      ..updateLessionsId(
                        (e) => e..checkLession = false,
                      ),
                  ),
              );
              setState(() {});
              _model.loop = _model.loop + 1;
              setState(() {});
            }
            _model.loop = 0;
            setState(() {});
          } else {
            _model.checkRefreshTokenBlocks =
                await action_blocks.checkRefreshToken(
              context,
              jsonErrors: (_model.apiResultDomain?.jsonBody ?? ''),
            );
            if (!_model.checkRefreshTokenBlocka!) {
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
            return;
          }

          _model.isLoad = true;
          setState(() {});
        } else {
          _model.checkRefreshTokenBlocka =
              await action_blocks.checkRefreshToken(
            context,
            jsonErrors: (_model.apiResultwkg?.jsonBody ?? ''),
          );
          if (!_model.checkRefreshTokenBlocka!) {
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
          return;
        }
      } else {
        setState(() {});
        return;
      }
    });

    _model.textController ??= TextEditingController(
        text: functions.stringToInt(widget!.price!).toString());
    _model.textFieldFocusNode ??= FocusNode();

    _model.switchOnValue = true;
    _model.switchOffValue = false;
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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Stack(
            children: [
              if (_model.isLoad == true)
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Đưa khóa học lên Market',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.close,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 20.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownDomainValueController ??=
                                            FormFieldController<String>(
                                      _model.dropDownDomainValue ??=
                                          widget!.domain,
                                    ),
                                    options: List<String>.from(_model.domainList
                                        .map((e) => e.id)
                                        .toList()),
                                    optionLabels: _model.domainList
                                        .map((e) => e.name)
                                        .toList(),
                                    onChanged: (val) => setState(
                                        () => _model.dropDownDomainValue = val),
                                    width: double.infinity,
                                    height: 56.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Vui lòng chọn lĩnh vực',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller: _model
                                            .dropDownCategoryValueController ??=
                                        FormFieldController<String>(
                                      _model.dropDownCategoryValue ??=
                                          widget!.category,
                                    ),
                                    options: List<String>.from(_model
                                        .categoryList
                                        .map((e) => e.id)
                                        .toList()),
                                    optionLabels: _model.categoryList
                                        .map((e) => e.name)
                                        .toList(),
                                    onChanged: (val) => setState(() =>
                                        _model.dropDownCategoryValue = val),
                                    width: double.infinity,
                                    height: 56.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Vui lòng chọn danh mục',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ),
                              if ('1' == '2')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 36.0),
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Giá bán',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Nhập giá bán...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      errorStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType: TextInputType.number,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 36.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Thiết lập giá bán:\n(VND)',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownPriceValueController ??=
                                              FormFieldController<String>(
                                            _model
                                                .dropDownPriceValue ??= (widget!
                                                                .price !=
                                                            null &&
                                                        widget!.price != '') &&
                                                    (widget!.price != '0')
                                                ? _model.priceList
                                                    .where((e) =>
                                                        e.price ==
                                                        functions.stringToInt(
                                                            widget!.price!))
                                                    .toList()
                                                    .first
                                                    .id
                                                : ' ',
                                          ),
                                          options: List<String>.from(_model
                                              .priceList
                                              .map((e) => e.id)
                                              .toList()),
                                          optionLabels: _model.priceList
                                              .map((e) => formatNumber(
                                                    e.price,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType: DecimalType
                                                        .commaDecimal,
                                                  ))
                                              .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.dropDownPriceValue = val),
                                          width: double.infinity,
                                          height: 56.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'Chọn giá cho khóa học',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Text(
                                  'Thiết lập bài học được phép học thử',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.checkBoxLession?.lessions
                                          ?.where((e) =>
                                              e.lessionsId.checkLession == true)
                                          .toList()
                                          ?.length ==
                                      widget!.nameLession?.length)
                                    Switch.adaptive(
                                      value: _model.switchOnValue!,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.switchOnValue = newValue!);

                                        if (!newValue!) {
                                          while (_model.loop <
                                              widget!.nameLession!.length) {
                                            _model.updateCheckBoxLessionStruct(
                                              (e) => e
                                                ..updateLessions(
                                                  (e) => e[_model.loop]
                                                    ..updateLessionsId(
                                                      (e) => e
                                                        ..checkLession = false,
                                                    ),
                                                ),
                                            );
                                            setState(() {});
                                            _model.loop = _model.loop + 1;
                                            setState(() {});
                                          }
                                          _model.loop = 0;
                                          setState(() {});
                                          setState(() {
                                            _model.switchOnValue = true;
                                          });
                                        }
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      inactiveTrackColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      inactiveThumbColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                  if (_model.checkBoxLession?.lessions
                                          ?.where((e) =>
                                              e.lessionsId.checkLession == true)
                                          .toList()
                                          ?.length !=
                                      _model.checkBoxLession?.lessions?.length)
                                    Switch.adaptive(
                                      value: _model.switchOffValue!,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.switchOffValue = newValue!);
                                        if (newValue!) {
                                          while (_model.loop <
                                              widget!.nameLession!.length) {
                                            _model.updateCheckBoxLessionStruct(
                                              (e) => e
                                                ..updateLessions(
                                                  (e) => e[_model.loop]
                                                    ..updateLessionsId(
                                                      (e) => e
                                                        ..checkLession = true,
                                                    ),
                                                ),
                                            );
                                            setState(() {});
                                            _model.loop = _model.loop + 1;
                                            setState(() {});
                                          }
                                          _model.loop = 0;
                                          setState(() {});
                                          setState(() {
                                            _model.switchOffValue = false;
                                          });
                                        }
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      inactiveTrackColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      inactiveThumbColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                  Text(
                                    'Chọn tất cả',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                              Builder(
                                builder: (context) {
                                  final programItems = _model
                                          .checkBoxLession?.lessions
                                          ?.toList() ??
                                      [];

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: programItems.length,
                                    itemBuilder: (context, programItemsIndex) {
                                      final programItemsItem =
                                          programItems[programItemsIndex];
                                      return Visibility(
                                        visible: _model.checkBoxLession != null,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model: _model
                                                  .checkboxLessionsModels
                                                  .getModel(
                                                '${programItemsItem.lessionsId.name}${programItemsItem.lessionsId.checkLession.toString()}${programItemsItem.lessionsId.id}',
                                                programItemsIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: CheckboxLessionsWidget(
                                                key: Key(
                                                  'Key6ry_${'${programItemsItem.lessionsId.name}${programItemsItem.lessionsId.checkLession.toString()}${programItemsItem.lessionsId.id}'}',
                                                ),
                                                parameter1: programItemsIndex,
                                                checkLessions: programItemsItem
                                                    .lessionsId.checkLession,
                                                callBack: (check) async {
                                                  setState(() {});
                                                  while (_model.loop <
                                                      widget!.nameLession!
                                                          .length) {
                                                    _model
                                                        .updateCheckBoxLessionStruct(
                                                      (e) => e
                                                        ..updateLessions(
                                                          (e) => e[
                                                              programItemsIndex]
                                                            ..updateLessionsId(
                                                              (e) => e
                                                                ..checkLession =
                                                                    check,
                                                            ),
                                                        ),
                                                    );
                                                    setState(() {});
                                                    _model.loop =
                                                        _model.loop + 1;
                                                    setState(() {});
                                                  }
                                                  _model.loop = 0;
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                programItemsItem
                                                    .lessionsId.name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                text: 'Đóng',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  if (_model.dropDownPriceValue != null &&
                                      _model.dropDownPriceValue != '') {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Xác nhận:'),
                                                  content: Text(
                                                      'Đưa chương trình lên Market!'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Đóng'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Xác nhận'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (!confirmDialogResponse) {
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                  } else {
                                    await actions.showToast(
                                      context,
                                      'Vui lòng nhập giá bán!',
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      FlutterFlowTheme.of(context).error,
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  setState(() {});
                                  if ((_model.dropDownDomainValue != null &&
                                          _model.dropDownDomainValue != '') &&
                                      (_model.dropDownCategoryValue != null &&
                                          _model.dropDownCategoryValue != '') &&
                                      (_model.dropDownDomainValue != ' ') &&
                                      (_model.dropDownCategoryValue != ' ')) {
                                    _model.updatePrice = await action_blocks
                                        .tokenReload(context);
                                    _shouldSetState = true;
                                    if (_model.updatePrice!) {
                                      _model.apiResultUpdatePrice =
                                          await StudyProgramGroup
                                              .updateStudyProgramPriceCall
                                              .call(
                                        accessToken: FFAppState().accessToken,
                                        id: widget!.id,
                                        price: _model.priceList
                                            .where((e) =>
                                                e.id ==
                                                _model.dropDownPriceValue)
                                            .toList()
                                            .first
                                            .price,
                                        authorId: getJsonField(
                                          FFAppState().staffOrganization,
                                          r'''$.authors[0]''',
                                        ).toString(),
                                        version: (widget!.version!) + 1,
                                        category: _model.dropDownCategoryValue,
                                        domain: _model.dropDownDomainValue,
                                        iapApple: _model.priceList
                                            .where((e) =>
                                                e.id ==
                                                _model.dropDownPriceValue)
                                            .toList()
                                            .first
                                            .iapAppleProductId,
                                        iapGoogle: _model.priceList
                                            .where((e) =>
                                                e.id ==
                                                _model.dropDownPriceValue)
                                            .toList()
                                            .first
                                            .iapGoogleProductId,
                                      );

                                      _shouldSetState = true;
                                      if ((_model.apiResultUpdatePrice
                                              ?.succeeded ??
                                          true)) {
                                        _model.addMarket = await action_blocks
                                            .tokenReload(context);
                                        _shouldSetState = true;
                                        if (_model.addMarket!) {
                                          _model.apiResultk6q =
                                              await StudyProgramGroup
                                                  .addProgramMarketCall
                                                  .call(
                                            accessToken:
                                                FFAppState().accessToken,
                                            id: widget!.id,
                                            domainId:
                                                _model.dropDownDomainValue,
                                            categoryId:
                                                _model.dropDownCategoryValue,
                                          );

                                          _shouldSetState = true;
                                          if ((_model.apiResultk6q?.succeeded ??
                                              true)) {
                                            _model.reloadTockenStudyProgramGetOne =
                                                await action_blocks
                                                    .tokenReload(context);
                                            _shouldSetState = true;
                                            if (_model
                                                .reloadTockenStudyProgramGetOne!) {
                                              _model.apiResultProgramsOne =
                                                  await StudyProgramGroup
                                                      .studyProgramGetOneCall
                                                      .call(
                                                accessToken:
                                                    FFAppState().accessToken,
                                                id: getJsonField(
                                                  (_model.apiResultk6q
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.id''',
                                                ).toString(),
                                              );

                                              _shouldSetState = true;
                                              if ((_model.apiResultProgramsOne
                                                      ?.succeeded ??
                                                  true)) {
                                                while (_model.loop <
                                                    _model.checkBoxLession!
                                                        .lessions.length) {
                                                  if ((_model.checkBoxLession
                                                                  ?.lessions?[
                                                              _model.loop])
                                                          ?.lessionsId
                                                          ?.checkLession ==
                                                      true) {
                                                    _model.apiResulti06 =
                                                        await LessonGroup
                                                            .updateLessonStatusMarketCall
                                                            .call(
                                                      accessToken: FFAppState()
                                                          .accessToken,
                                                      id: (LessionDataMarketStatusStruct
                                                                  .maybeFromMap((_model
                                                                          .apiResultProgramsOne
                                                                          ?.jsonBody ??
                                                                      ''))
                                                              ?.data
                                                              ?.lessions?[_model.loop])
                                                          ?.lessionsId
                                                          ?.id,
                                                      status: 'trial',
                                                    );

                                                    _shouldSetState = true;
                                                    if ((_model.apiResulti06
                                                            ?.succeeded ??
                                                        true)) {
                                                      setState(() {});
                                                    }
                                                  } else {
                                                    setState(() {});
                                                  }

                                                  _model.loop = _model.loop + 1;
                                                  setState(() {});
                                                }
                                                _model.loop = 0;
                                                setState(() {});
                                                await actions.showToast(
                                                  context,
                                                  'Đưa chương trình lên Market thành công!',
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                                );
                                                await _model
                                                    .deletePreProgramVersion(
                                                        context);
                                                setState(() {});
                                                if (Navigator.of(context)
                                                    .canPop()) {
                                                  context.pop();
                                                }
                                                context.pushNamed(
                                                  'StudyProgramList',
                                                  queryParameters: {
                                                    'checkpage': serializeParam(
                                                      widget!.checkPage,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              }
                                            } else {
                                              setState(() {});
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          } else {
                                            await actions.showToast(
                                              context,
                                              'Lỗi đẩy chương trình lên market',
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                            );
                                          }
                                        } else {
                                          setState(() {});
                                        }
                                      }
                                    } else {
                                      setState(() {});
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content: Text(
                                              'Vui lòng chọn lĩnh vực và danh mục!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) setState(() {});
                                },
                                text: 'Xác nhận',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              if (_model.isLoad == false)
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.LoadingPageWidget(
                    width: double.infinity,
                    height: double.infinity,
                    size: 50.0,
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
