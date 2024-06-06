import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/department/filter_status_department/filter_status_department_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'department_list_model.dart';
export 'department_list_model.dart';

class DepartmentListWidget extends StatefulWidget {
  const DepartmentListWidget({super.key});

  @override
  State<DepartmentListWidget> createState() => _DepartmentListWidgetState();
}

class _DepartmentListWidgetState extends State<DepartmentListWidget> {
  late DepartmentListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DepartmentListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.getDepartmentList(context);
      setState(() {});
      _model.dataParam =
          _model.list.map((e) => e.code).toList().toList().cast<String>();
      setState(() {});
      _model.tokenReloadDepartmentListList =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadDepartmentListList!) {
        _model.isShow = true;
        setState(() {});
      } else {
        setState(() {});
        return;
      }
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.nameSearchTextController ??= TextEditingController();
    _model.nameSearchFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        floatingActionButton: Visibility(
          visible: !(isWeb
              ? MediaQuery.viewInsetsOf(context).bottom > 0
              : _isKeyboardVisible),
          child: FloatingActionButton(
            onPressed: () async {
              context.pushNamed(
                'DepartmentCreate',
                queryParameters: {
                  'checkCode': serializeParam(
                    _model.dataParam,
                    ParamType.String,
                    true,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 8.0,
            child: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
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
              context.pushNamed(
                'Profile',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
          ),
          title: Text(
            'Danh sách bộ phận',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Nunito Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Visibility(
            visible: _model.isShow == true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.nameSearchTextController,
                              focusNode: _model.nameSearchFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.nameSearchTextController',
                                Duration(milliseconds: 500),
                                () async {
                                  setState(() => _model.listViewPagingController
                                      ?.refresh());
                                },
                              ),
                              autofocus: false,
                              textInputAction: TextInputAction.search,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Tìm kiếm...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 24.0,
                                ),
                                suffixIcon: _model.nameSearchTextController!
                                        .text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.nameSearchTextController
                                              ?.clear();
                                          setState(() => _model
                                              .listViewPagingController
                                              ?.refresh());
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          size: 18.0,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model
                                  .nameSearchTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) => FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 10.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              Icons.tune_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: FilterStatusDepartmentWidget(
                                        status: _model.status,
                                        branchId: _model.branchId,
                                        callBack: (status, branchId) async {
                                          _model.status = status!;
                                          _model.branchId = branchId!;
                                          setState(() {});
                                          setState(() => _model
                                              .listViewPagingController
                                              ?.refresh());
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  if ((_model.nameSearchTextController.text != null &&
                          _model.nameSearchTextController.text != '') ||
                      (_model.status != null && _model.status != ''))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 8.0),
                      child: Text(
                        '#Kết quả tìm kiếm theo bộ lọc',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 16.0),
                      child: PagedListView<ApiPagingParams, dynamic>.separated(
                        pagingController: _model.setListViewController(
                          (nextPageMarker) =>
                              DepartmentGroup.getDepartmentListCall.call(
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
                                ).toString();
                              } else if (FFAppState().user.role ==
                                  'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                                return getJsonField(
                                  FFAppState().staffBranch,
                                  r'''$.id''',
                                ).toString();
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
                            }()}${_model.nameSearchTextController.text != null && _model.nameSearchTextController.text != '' ? ',{\"name\":{\"_icontains\":\"' : ' '}${_model.nameSearchTextController.text != null && _model.nameSearchTextController.text != '' ? _model.nameSearchTextController.text : ' '}${_model.nameSearchTextController.text != null && _model.nameSearchTextController.text != '' ? '\"}}' : ' '}${(_model.status != null && _model.status != '') && (_model.status != 'noData') ? ',{\"status\":{\"_eq\":\"' : ' '}${(_model.status != null && _model.status != '') && (_model.status != 'noData') ? _model.status : ' '}${(_model.status != null && _model.status != '') && (_model.status != 'noData') ? '\"}}' : ' '}${(_model.branchId != null && _model.branchId != '') && (_model.branchId != 'noData') ? ',{\"branch_id\":{\"id\":{\"_eq\":\"' : ' '}${(_model.branchId != null && _model.branchId != '') && (_model.branchId != 'noData') ? _model.branchId : ' '}${(_model.branchId != null && _model.branchId != '') && (_model.branchId != 'noData') ? '\"}}}' : ' '}]}',
                            limit: 20,
                            offset: nextPageMarker.nextPageNumber * 20,
                            accessToken: FFAppState().accessToken,
                          ),
                        ),
                        padding: EdgeInsets.zero,
                        primary: false,
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        separatorBuilder: (_, __) => SizedBox(height: 10.0),
                        builderDelegate: PagedChildBuilderDelegate<dynamic>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                          // Customize what your widget looks like when it's loading another page.
                          newPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                          noItemsFoundIndicatorBuilder: (_) => Center(
                            child: Container(
                              width: double.infinity,
                              child: DataNotFoundWidget(),
                            ),
                          ),
                          itemBuilder: (context, _, listItemsIndex) {
                            final listItemsItem = _model
                                .listViewPagingController!
                                .itemList![listItemsIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'DepartmentDetail',
                                    queryParameters: {
                                      'items': serializeParam(
                                        listItemsItem.toMap(),
                                        ParamType.JSON,
                                      ),
                                      'checkCode': serializeParam(
                                        _model.dataParam,
                                        ParamType.String,
                                        true,
                                      ),
                                      'programs': serializeParam(
                                        listItemsItem.programs,
                                        ParamType.DataStruct,
                                        true,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          '${(listItemsIndex + 1).toString()}. ${listItemsItem.name}',
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Text(
                                                'Mã bộ phận: ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  listItemsItem.code,
                                                  textAlign: TextAlign.end,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                'Tổng số lượng nhân sự:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                listItemsItem.staffs.length
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                'Trạng thái: ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Container(
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        '${listItemsItem.status}' ==
                                                                'published'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .accent2
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Text(
                                                      '${listItemsItem.status}' ==
                                                              'published'
                                                          ? 'Hoạt động'
                                                          : 'Không hoạt động',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: '${listItemsItem.status}' ==
                                                                    'published'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
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
