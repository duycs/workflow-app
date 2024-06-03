import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
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
  });

  final String? id;
  final String? price;
  final int? version;
  final String? checkPage;
  final String? category;
  final String? domain;

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
                  duration: const Duration(milliseconds: 4000),
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
                duration: const Duration(milliseconds: 4000),
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
        text: functions.stringToInt(widget.price!).toString());
    _model.textFieldFocusNode ??= FocusNode();

    _model.switchValue = true;
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: _model.isLoad == true,
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(
              maxHeight: 750.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 20.0),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.dropDownDomainValueController ??=
                                        FormFieldController<String>(
                                  _model.dropDownDomainValue ??= widget.domain,
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
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FlutterFlowDropDown<String>(
                              controller:
                                  _model.dropDownCategoryValueController ??=
                                      FormFieldController<String>(
                                _model.dropDownCategoryValue ??=
                                    widget.category,
                              ),
                              options: List<String>.from(_model.categoryList
                                  .map((e) => e.id)
                                  .toList()),
                              optionLabels: _model.categoryList
                                  .map((e) => e.name)
                                  .toList(),
                              onChanged: (val) => setState(
                                  () => _model.dropDownCategoryValue = val),
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
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
                                      color: FlutterFlowTheme.of(context).error,
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
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
                              keyboardType: TextInputType.number,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Switch.adaptive(
                                  value: _model.switchValue!,
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.switchValue = newValue);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).alternate,
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
                          ),
                          FlutterFlowCheckboxGroup(
                            options: const [
                              'Bài học 1',
                              'Bài học 2',
                              'Bài học 3',
                              'Bài học 4'
                            ],
                            onChanged: (val) => setState(
                                () => _model.checkboxGroupValues = val),
                            controller: _model.checkboxGroupValueController ??=
                                FormFieldController<List<String>>(
                              [],
                            ),
                            activeColor: FlutterFlowTheme.of(context).primary,
                            checkColor: FlutterFlowTheme.of(context).info,
                            checkboxBorderColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                            checkboxBorderRadius: BorderRadius.circular(4.0),
                            initialized: _model.checkboxGroupValues != null,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
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
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              var shouldSetState = false;
                              if (_model.textController.text != '') {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                title: const Text('Xác nhận:'),
                                                content: const Text(
                                                    'Đưa chương trình lên Market!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: const Text('Đóng'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: const Text('Xác nhận'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ) ??
                                        false;
                                if (!confirmDialogResponse) {
                                  if (shouldSetState) setState(() {});
                                  return;
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Vui lòng nhập giá bán!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                                if (shouldSetState) setState(() {});
                                return;
                              }

                              setState(() {});
                              if ((_model.dropDownDomainValue != null &&
                                      _model.dropDownDomainValue != '') &&
                                  (_model.dropDownCategoryValue != null &&
                                      _model.dropDownCategoryValue != '') &&
                                  (_model.dropDownDomainValue != ' ') &&
                                  (_model.dropDownCategoryValue != ' ')) {
                                _model.updatePrice =
                                    await action_blocks.tokenReload(context);
                                shouldSetState = true;
                                if (_model.updatePrice!) {
                                  _model.apiResultUpdatePrice =
                                      await StudyProgramGroup
                                          .updateStudyProgramPriceCall
                                          .call(
                                    accessToken: FFAppState().accessToken,
                                    id: widget.id,
                                    price: int.tryParse(
                                        _model.textController.text),
                                    authorId: getJsonField(
                                      FFAppState().staffOrganization,
                                      r'''$.authors[0]''',
                                    ).toString(),
                                    version: (widget.version!) + 1,
                                    category: _model.dropDownCategoryValue,
                                    domain: _model.dropDownDomainValue,
                                  );
                                  shouldSetState = true;
                                  if ((_model.apiResultUpdatePrice?.succeeded ??
                                      true)) {
                                    _model.addMarket = await action_blocks
                                        .tokenReload(context);
                                    shouldSetState = true;
                                    if (_model.addMarket!) {
                                      _model.apiResultk6q =
                                          await StudyProgramGroup
                                              .addProgramMarketCall
                                              .call(
                                        accessToken: FFAppState().accessToken,
                                        id: widget.id,
                                        domainId: _model.dropDownDomainValue,
                                        categoryId:
                                            _model.dropDownCategoryValue,
                                      );
                                      shouldSetState = true;
                                      if ((_model.apiResultk6q?.succeeded ??
                                          true)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Đưa chương trình lên Market thành công!',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        await _model
                                            .deletePreProgramVersion(context);
                                        setState(() {});

                                        context.pushNamed(
                                          'StudyProgramList',
                                          queryParameters: {
                                            'checkpage': serializeParam(
                                              widget.checkPage,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Lỗi đẩy chương trình lên market',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
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
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: const Text(
                                            'Vui lòng chọn lĩnh vực và danh mục!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                if (shouldSetState) setState(() {});
                                return;
                              }

                              if (shouldSetState) setState(() {});
                            },
                            text: 'Xác nhận',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
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
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 12.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
