import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/procedure_publishing/procedure_pushlished/procedure_pushlished_widget.dart';
import '/tasks/do_action_type_approve/do_action_type_approve_widget.dart';
import '/tasks/do_action_type_image/do_action_type_image_widget.dart';
import '/tasks/do_action_type_to_do_list/do_action_type_to_do_list_widget.dart';
import '/tasks/do_action_type_upload_file/do_action_type_upload_file_widget.dart';
import '/tasks/filter_task_list/filter_task_list_widget.dart';
import '/tasks/task_list_ck_popup/task_list_ck_popup_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'task_list_model.dart';
export 'task_list_model.dart';

class TaskListWidget extends StatefulWidget {
  const TaskListWidget({
    super.key,
    String? checkRouter,
  }) : checkRouter = checkRouter ?? '0';

  final String checkRouter;

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  late TaskListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.caculatorTotalToken = await action_blocks.tokenReload(context);
      if (_model.caculatorTotalToken!) {
        if (widget.checkRouter == 'workflow') {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: ProcedurePushlishedWidget(
                    callback: () async {
                      await _model.getTaskToDo(context);
                      await _model.getTaskToDo(context);
                      await _model.getTaskToDo(context);
                    },
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        }
        await _model.getNumberTask(context);
        setState(() {});
        setState(() {
          _model.isLoad = true;
        });
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

    _model.textFieldNameTextController ??= TextEditingController();
    _model.textFieldNameFocusNode ??= FocusNode();
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 70.0),
            child: FloatingActionButton(
              onPressed: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      onTap: () => _model.unfocusNode.canRequestFocus
                          ? FocusScope.of(context)
                              .requestFocus(_model.unfocusNode)
                          : FocusScope.of(context).unfocus(),
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: ProcedurePushlishedWidget(
                          callback: () async {
                            await _model.getTaskToDo(context);
                            await _model.getNumberTask(context);
                            setState(() =>
                                _model.listViewPagingController1?.refresh());
                          },
                        ),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              backgroundColor: FlutterFlowTheme.of(context).primary,
              elevation: 1.0,
              child: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  'Công việc hôm nay',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Nunito Sans',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: Stack(
          children: [
            if (_model.isLoad == true)
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 90.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller:
                                          _model.textFieldNameTextController,
                                      focusNode: _model.textFieldNameFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textFieldNameTextController',
                                        const Duration(milliseconds: 500),
                                        () async {
                                          setState(() {});
                                          if (_model.textFieldNameTextController
                                                      .text !=
                                                  '') {
                                            setState(() {
                                              _model.filter =
                                                  '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                                FFAppState().staffLogin,
                                                r'''$.id''',
                                              ).toString()}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
                                                FFAppState().staffLogin,
                                                r'''$.organization_id''',
                                              ).toString()}\"}}},{\"name\":{\"_icontains\":\"${_model.textFieldNameTextController.text}\"}},{\"status\":{\"_eq\":\"todo\"}},{\"current\":{\"_eq\":\"1\"}}]}';
                                            });
                                            setState(() {});
                                            setState(() => _model
                                                .listViewPagingController1
                                                ?.refresh());
                                          } else {
                                            setState(() {
                                              _model.filter =
                                                  '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                                FFAppState().staffLogin,
                                                r'''$.id''',
                                              ).toString()}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
                                                FFAppState().staffLogin,
                                                r'''$.organization_id''',
                                              ).toString()}\"}}},{\"status\":{\"_eq\":\"todo\"}},{\"current\":{\"_eq\":\"1\"}}]}';
                                            });
                                            setState(() => _model
                                                .listViewPagingController1
                                                ?.refresh());
                                            setState(() {});
                                          }
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                20.0, 0.0, 0.0, 0.0),
                                        prefixIcon: const Icon(
                                          Icons.search,
                                          size: 24.0,
                                        ),
                                        suffixIcon: _model
                                                .textFieldNameTextController!
                                                .text
                                                .isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model
                                                      .textFieldNameTextController
                                                      ?.clear();
                                                  setState(() {});
                                                  if (_model.textFieldNameTextController
                                                              .text !=
                                                          '') {
                                                    setState(() {
                                                      _model.filter =
                                                          '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                                        FFAppState().staffLogin,
                                                        r'''$.id''',
                                                      ).toString()}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
                                                        FFAppState().staffLogin,
                                                        r'''$.organization_id''',
                                                      ).toString()}\"}}},{\"name\":{\"_icontains\":\"${_model.textFieldNameTextController.text}\"}},{\"status\":{\"_eq\":\"todo\"}},{\"current\":{\"_eq\":\"1\"}}]}';
                                                    });
                                                    setState(() {});
                                                    setState(() => _model
                                                        .listViewPagingController1
                                                        ?.refresh());
                                                  } else {
                                                    setState(() {
                                                      _model.filter =
                                                          '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                                        FFAppState().staffLogin,
                                                        r'''$.id''',
                                                      ).toString()}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
                                                        FFAppState().staffLogin,
                                                        r'''$.organization_id''',
                                                      ).toString()}\"}}},{\"status\":{\"_eq\":\"todo\"}},{\"current\":{\"_eq\":\"1\"}}]}';
                                                    });
                                                    setState(() => _model
                                                        .listViewPagingController1
                                                        ?.refresh());
                                                    setState(() {});
                                                  }

                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
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
                                      cursorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      validator: _model
                                          .textFieldNameTextControllerValidator
                                          .asValidator(context),
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  const AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: FilterTaskListWidget(
                                                  filterSearch: _model
                                                      .textFieldNameTextController
                                                      .text,
                                                  dateStart:
                                                      _model.dateStartFilter,
                                                  dateEnd: _model.dateEndFilter,
                                                  type: _model.typeFilter,
                                                  created: _model.createdFilter,
                                                  workflowName:
                                                      _model.workflowNameFilter,
                                                  callback: (dateStartCallback,
                                                      dateEndCallback,
                                                      typeCallback,
                                                      createdCallback,
                                                      workflowNameCallback) async {
                                                    setState(() {
                                                      _model.dateStartFilter =
                                                          dateStartCallback;
                                                      _model.dateEndFilter =
                                                          dateEndCallback;
                                                      _model.typeFilter =
                                                          typeCallback;
                                                      _model.createdFilter =
                                                          createdCallback!;
                                                      _model.workflowNameFilter =
                                                          workflowNameCallback!;
                                                    });
                                                    setState(() => _model
                                                        .listViewPagingController1
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 1.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'TaskListWait',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        },
                                        text:
                                            'Chờ thực hiện (${_model.totalWait.toString()})',
                                        options: FFButtonOptions(
                                          width: 115.0,
                                          height: 30.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 1.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text:
                                            'Đang thực hiện (${_model.totalTodo.toString()})',
                                        options: FFButtonOptions(
                                          width: 115.0,
                                          height: 30.0,
                                          padding: const EdgeInsets.all(0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 1.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'TaskListDone',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        },
                                        text:
                                            'Hoàn thành (${_model.totalDone?.toString()})',
                                        options: FFButtonOptions(
                                          width: 115.0,
                                          height: 30.0,
                                          padding: const EdgeInsets.all(0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 6.0)),
                                ),
                              ),
                            ),
                            if ((_model.textFieldNameTextController.text !=
                                        '') ||
                                (_model.dateStartFilter != null &&
                                    _model.dateStartFilter != '') ||
                                (_model.dateEndFilter != null &&
                                    _model.dateEndFilter != '') ||
                                (_model.typeFilter != null &&
                                    _model.typeFilter != ''))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Text(
                                  '# Kết quả tìm kiếm theo bộ lọc',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            Expanded(
                              child: PagedListView<ApiPagingParams,
                                  dynamic>.separated(
                                pagingController: _model.setListViewController1(
                                  (nextPageMarker) =>
                                      TaskGroup.getListTaskCall.call(
                                    accessToken: FFAppState().accessToken,
                                    offset: nextPageMarker.nextPageNumber * 20,
                                    limit: 20,
                                    filter: '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                      FFAppState().staffLogin,
                                      r'''$.id''',
                                    ).toString()}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
                                      FFAppState().staffLogin,
                                      r'''$.organization_id''',
                                    ).toString()}\"}}},{\"status\":{\"_eq\":\"todo\"}},{\"current\":{\"_eq\":\"1\"}}${(_model.dateStartFilter != null && _model.dateStartFilter != '') && (_model.dateStartFilter != ' ') ? ',{\"date_created\":{\"_gte\":\"${dateTimeFormat(
                                        'yyyy-MM-dd',
                                        functions.stringToDateTime(
                                            _model.dateStartFilter),
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )}\"}}' : ' '}${(_model.dateEndFilter != null && _model.dateEndFilter != '') && (_model.dateEndFilter == ' ') ? ',{\"date_created\":{\"_lte\":\"${(String var1) {
                                        return DateTime.parse(var1)
                                            .add(const Duration(days: 1))
                                            .toString();
                                      }(dateTimeFormat(
                                        'yyyy-MM-dd',
                                        functions.stringToDateTime(
                                            _model.dateEndFilter),
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ))}\"}}' : ' '}${(_model.typeFilter != ' ') && (_model.typeFilter != null && _model.typeFilter != '') ? ',{\"action_type\":{\"_eq\":\"${() {
                                        if (_model.typeFilter ==
                                            'Nhập văn bản') {
                                          return 'submit_text';
                                        } else if (_model.typeFilter ==
                                            'Upload File') {
                                          return 'upload_file';
                                        } else if (_model.typeFilter ==
                                            'Chụp ảnh') {
                                          return 'image';
                                        } else if (_model.typeFilter ==
                                            'Check List Công việc') {
                                          return 'to_do_list';
                                        } else if (_model.typeFilter ==
                                            'Phê duyệt') {
                                          return ' approve';
                                        } else {
                                          return ' ';
                                        }
                                      }()}\"}}' : ' '}${_model.textFieldNameTextController.text != '' ? ',{\"name\":{\"_icontains\":\"${_model.textFieldNameTextController.text}\"}}' : ' '}${(_model.createdFilter != '') && (_model.createdFilter != '') ? ',{\"created_user_id\":{\"first_name\":{\"_icontains\":\"${_model.createdFilter}\"}}}' : ' '}${(_model.workflowNameFilter != '') && (_model.workflowNameFilter != '') ? ',{\"workflow_id\":{\"name\":{\"_icontains\":\"${_model.workflowNameFilter}\"}}}' : ' '}]}',
                                    sort: 'number',
                                  ),
                                ),
                                padding: EdgeInsets.zero,
                                primary: false,
                                reverse: false,
                                scrollDirection: Axis.vertical,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 16.0),
                                builderDelegate:
                                    PagedChildBuilderDelegate<dynamic>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Customize what your widget looks like when it's loading another page.
                                  newPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  noItemsFoundIndicatorBuilder: (_) => const Center(
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: DataNotFoundWidget(),
                                    ),
                                  ),
                                  itemBuilder: (context, _, dataListIndex) {
                                    final dataListItem = _model
                                        .listViewPagingController1!
                                        .itemList![dataListIndex];
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            4.0, 8.0, 4.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          if (((dataListItem.actionType !=
                                                                      'submit_text') &&
                                                                  (dataListItem
                                                                          .operations
                                                                          .first
                                                                          .operationsId
                                                                          .status ==
                                                                      'done') &&
                                                                  (dataListItem
                                                                          .staffs
                                                                          .where(
                                                                              (e) =>
                                                                                  e
                                                                                      .staffsId.id ==
                                                                                  getJsonField(
                                                                                    FFAppState().staffLogin,
                                                                                    r'''$.id''',
                                                                                  ))
                                                                          .toList()
                                                                          .length >
                                                                      0)) ||
                                                              ((dataListItem.actionType !=
                                                                      'to_do_list') &&
                                                                  (dataListItem.operations
                                                                          .where((e) =>
                                                                              e.operationsId.status ==
                                                                              'done')
                                                                          .toList()
                                                                          .length ==
                                                                      dataListItem
                                                                          .operations
                                                                          .length) &&
                                                                  (dataListItem
                                                                          .staffs
                                                                          .where(
                                                                              (e) =>
                                                                                  e
                                                                                      .staffsId.id ==
                                                                                  getJsonField(
                                                                                    FFAppState().staffLogin,
                                                                                    r'''$.id''',
                                                                                  ))
                                                                          .toList()
                                                                          .length >
                                                                      0)) ||
                                                              ((dataListItem.actionType !=
                                                                      'image') &&
                                                                  (dataListItem
                                                                          .operations
                                                                          .first
                                                                          .operationsId
                                                                          .files
                                                                          .length >
                                                                      0) &&
                                                                  (dataListItem
                                                                          .staffs
                                                                          .where(
                                                                              (e) =>
                                                                                  e
                                                                                      .staffsId.id ==
                                                                                  getJsonField(
                                                                                    FFAppState().staffLogin,
                                                                                    r'''$.id''',
                                                                                  ))
                                                                          .toList()
                                                                          .length >
                                                                      0)) ||
                                                              ((dataListItem.actionType !=
                                                                      'upload_file') &&
                                                                  (dataListItem
                                                                          .operations
                                                                          .first
                                                                          .operationsId
                                                                          .files
                                                                          .length >
                                                                      0) &&
                                                                  (dataListItem.staffs
                                                                          .where((e) =>
                                                                              e.staffsId.id ==
                                                                              getJsonField(
                                                                                FFAppState().staffLogin,
                                                                                r'''$.id''',
                                                                              ))
                                                                          .toList()
                                                                          .length >
                                                                      0)) ||
                                                              ((dataListItem.actionType != 'approve') &&
                                                                  (dataListItem.staffs
                                                                          .where((e) =>
                                                                              e.staffsId.id ==
                                                                              getJsonField(
                                                                                FFAppState().staffLogin,
                                                                                r'''$.id''',
                                                                              ))
                                                                          .toList()
                                                                          .length >
                                                                      0)))
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                dataListItem
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                          Text(
                                                            '#${dataListItem.workflowId.name}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  if (() {
                                                    if ((dataListItem.actionType ==
                                                            'submit_text') &&
                                                        (dataListItem
                                                                .operations
                                                                .first
                                                                .operationsId
                                                                .status ==
                                                            'done')) {
                                                      return true;
                                                    } else if ((dataListItem.actionType ==
                                                            'to_do_list') &&
                                                        (dataListItem.operations.where((e) => e.operationsId.status == 'done').toList().length ==
                                                            dataListItem
                                                                .operations
                                                                .length)) {
                                                      return true;
                                                    } else if ((dataListItem.actionType == 'image') &&
                                                        (dataListItem
                                                                .operations
                                                                .first
                                                                .operationsId
                                                                .files
                                                                .length >
                                                            0)) {
                                                      return true;
                                                    } else if ((dataListItem.actionType ==
                                                            'upload_file') &&
                                                        (dataListItem
                                                                .operations
                                                                .first
                                                                .operationsId
                                                                .files
                                                                .length >
                                                            0)) {
                                                      return true;
                                                    } else if (dataListItem.actionType ==
                                                        'approve') {
                                                      return true;
                                                    } else {
                                                      return false;
                                                    }
                                                  }())
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          var shouldSetState =
                                                              false;
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        content:
                                                                            const Text('Xác nhận hoàn thành task!'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                const Text('Đóng'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                const Text('Xác nhận'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            _model.confirmOperationCopy2Token =
                                                                await action_blocks
                                                                    .tokenReload(
                                                                        context);
                                                            shouldSetState =
                                                                true;
                                                            if (_model
                                                                .confirmOperationCopy2Token!) {
                                                              _model.apiResultConfirmOperationCopy2 =
                                                                  await TaskGroup
                                                                      .confirmOperationCall
                                                                      .call(
                                                                accessToken:
                                                                    FFAppState()
                                                                        .accessToken,
                                                                staffId:
                                                                    FFAppState()
                                                                        .staffid,
                                                                taskId:
                                                                    dataListItem
                                                                        .id,
                                                                submitType: dataListItem
                                                                            .actionType ==
                                                                        'approve'
                                                                    ? 'approve'
                                                                    : 'submit',
                                                              );
                                                              shouldSetState =
                                                                  true;
                                                              if ((_model
                                                                      .apiResultConfirmOperationCopy2
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Submit thành công',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Submit thất bại',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                  ),
                                                                );
                                                              }

                                                              _model.getWorkflowCopyToken =
                                                                  await action_blocks
                                                                      .tokenReload(
                                                                          context);
                                                              shouldSetState =
                                                                  true;
                                                              if (_model
                                                                  .getWorkflowCopyToken!) {
                                                                _model.apiResultGetWorkflowCopy =
                                                                    await ProcedureTemplateGroup
                                                                        .workflowsOneCall
                                                                        .call(
                                                                  accessToken:
                                                                      FFAppState()
                                                                          .accessToken,
                                                                  id: dataListItem
                                                                      .workflowId
                                                                      .id,
                                                                );
                                                                shouldSetState =
                                                                    true;
                                                                if ((_model
                                                                        .apiResultGetWorkflowCopy
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  setState(() {
                                                                    _model.stepList =
                                                                        OneWorkFlowDataStruct.maybeFromMap((_model.apiResultGetWorkflowCopy?.jsonBody ??
                                                                                ''))
                                                                            ?.data;
                                                                  });
                                                                }
                                                                if (_model
                                                                        .stepList!
                                                                        .steps
                                                                        .length >
                                                                    dataListItem
                                                                        .number) {
                                                                  while (_model
                                                                          .loop <
                                                                      _model
                                                                          .stepList!
                                                                          .steps
                                                                          .where((e) =>
                                                                              e.number ==
                                                                              (dataListItem.number + 1))
                                                                          .toList()
                                                                          .first
                                                                          .staffs
                                                                          .length) {
                                                                    _model.apiResultqt8CopyToken =
                                                                        await action_blocks
                                                                            .tokenReload(context);
                                                                    shouldSetState =
                                                                        true;
                                                                    if (_model
                                                                        .apiResultqt8CopyToken!) {
                                                                      _model.apiResultqt8Copy = await TaskGroup
                                                                          .receiveTaskCall
                                                                          .call(
                                                                        accessToken:
                                                                            FFAppState().accessToken,
                                                                        workflowId: dataListItem
                                                                            .workflowId
                                                                            .id,
                                                                        staffId: (_model.stepList?.steps.where((e) => e.number == (dataListItem.number + 1)).toList().first.staffs[_model.loop])
                                                                            ?.staffsId
                                                                            .id,
                                                                        publishedCount:
                                                                            dataListItem.publishedCount,
                                                                      );
                                                                      shouldSetState =
                                                                          true;
                                                                      if (!(_model
                                                                              .apiResultqt8Copy
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Nhận task thất bại',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                const Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                        );
                                                                      }
                                                                    } else {
                                                                      setState(
                                                                          () {});
                                                                      if (shouldSetState) {
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                      return;
                                                                    }

                                                                    setState(
                                                                        () {
                                                                      _model.loop =
                                                                          _model.loop +
                                                                              1;
                                                                    });
                                                                  }
                                                                  setState(() {
                                                                    _model.loop =
                                                                        0;
                                                                  });
                                                                }
                                                                await _model
                                                                    .getNumberTask(
                                                                        context);
                                                                setState(() => _model
                                                                    .listViewPagingController1
                                                                    ?.refresh());
                                                              } else {
                                                                setState(() {});
                                                              }
                                                            } else {
                                                              setState(() {});
                                                              if (shouldSetState) {
                                                                setState(() {});
                                                              }
                                                              return;
                                                            }
                                                          } else {
                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                            return;
                                                          }

                                                          if (shouldSetState) {
                                                            setState(() {});
                                                          }
                                                        },
                                                        text: 'Xác nhận',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 30.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      0.0,
                                                                      6.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  FlutterFlowIconButton(
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: FaIcon(
                                                      FontAwesomeIcons
                                                          .angleRight,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                        'TaskDetail',
                                                        queryParameters: {
                                                          'workflowId':
                                                              serializeParam(
                                                            dataListItem
                                                                .workflowId.id,
                                                            ParamType.String,
                                                          ),
                                                          'publishedCount':
                                                              serializeParam(
                                                            dataListItem
                                                                .publishedCount,
                                                            ParamType.int,
                                                          ),
                                                          'paramBack':
                                                              serializeParam(
                                                            '1',
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (_model.isShow !=
                                                dataListItem.id)
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 6.0, 0.0, 6.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      _model.isShow =
                                                          dataListItem.id;
                                                    });
                                                  },
                                                  child: Text(
                                                    'Xem thêm',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            if (_model.isShow ==
                                                dataListItem.id)
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (dataListItem.createdUserId
                                                              .firstName !=
                                                          null &&
                                                      dataListItem.createdUserId
                                                              .firstName !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  6.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        6.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.person,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Người tạo:',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              dataListItem
                                                                  .createdUserId
                                                                  .firstName,
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ),
                                                  if (dataListItem
                                                          .publishedCount !=
                                                      null)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  6.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        6.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .confirmation_num_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              'Chạy lần thứ:',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            dataListItem
                                                                .publishedCount
                                                                .toString(),
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (dataListItem
                                                              .dateCreated !=
                                                          null &&
                                                      dataListItem
                                                              .dateCreated !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  6.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        6.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.timer,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              'Ngày tạo:',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            dateTimeFormat(
                                                              'HH:mm dd/MM/yyyy',
                                                              functions.stringToDateTime(
                                                                  dataListItem
                                                                      .dateCreated),
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (dataListItem
                                                          .timeOperate !=
                                                      'null')
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  6.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        6.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.av_timer,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              'Bắt đầu (dự kiến):',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            dataListItem
                                                                .timeOperate,
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (dataListItem
                                                          .estimateInSecond !=
                                                      0)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  6.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        6.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .update_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              'T.gian thực hiện (dự kiến):',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                            ),
                                                          ),
                                                          if (valueOrDefault<
                                                              bool>(
                                                            '${dataListItem.dateStart}' !=
                                                                    '',
                                                            false,
                                                          ))
                                                            Text(
                                                              dataListItem.estimateInSecond.toString(),
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (valueOrDefault<bool>(
                                                    '${dataListItem.dateStart}' !=
                                                            '',
                                                    false,
                                                  ))
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  6.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        6.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.date_range,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              'Bắt đầu (thực tế):',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            dateTimeFormat(
                                                              'HH:mm dd/MM/yyyy',
                                                              functions.stringToDateTime(
                                                                  dataListItem
                                                                      .dateStart),
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 6.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        setState(() {
                                                          _model.isShow = '';
                                                        });
                                                      },
                                                      child: Text(
                                                        'Ẩn bớt',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            if (dataListItem.actionType !=
                                                'to_do_list')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 6.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.notes_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Nội dung: ${dataListItem.operations.first.operationsId.content}',
                                                        maxLines: 2,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (dataListItem.actionType ==
                                                'to_do_list')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 6.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.notes_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Nội dung: ',
                                                        maxLines: 2,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (dataListItem.actionType ==
                                                'upload_file')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .doActionTypeUploadFileModels
                                                      .getModel(
                                                    dataListItem
                                                                .operations
                                                                .first
                                                                .operationsId
                                                                .files
                                                                .length >
                                                            0
                                                        ? '${dataListItem.operations.first.operationsId.files.first.directusFilesId.id}${dataListItem.operations.first.operationsId.id}'
                                                        : '${dataListItem.operations.first.operationsId.id}',
                                                    dataListIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child:
                                                      DoActionTypeUploadFileWidget(
                                                    key: Key(
                                                      'Keypbt_${dataListItem.operations.first.operationsId.files.length > 0 ? '${dataListItem.operations.first.operationsId.files.first.directusFilesId.id}${dataListItem.operations.first.operationsId.id}' : '${dataListItem.operations.first.operationsId.id}'}',
                                                    ),
                                                    dataPass: dataListItem,
                                                    callback: (file) async {
                                                      setState(() {
                                                        _model.responseData =
                                                            null;
                                                      });
                                                      while (_model.loop <
                                                          file!.length) {
                                                        setState(() {
                                                          _model
                                                              .updateResponseDataStruct(
                                                            (e) => e
                                                              ..status = 'done'
                                                              ..updateFiles(
                                                                (e) => e.add(
                                                                    FileDataTypeStruct(
                                                                  directusFilesId:
                                                                      FileIDDataTypeStruct(
                                                                    id: file[
                                                                        _model
                                                                            .loop],
                                                                  ),
                                                                )),
                                                              ),
                                                          );
                                                        });
                                                        setState(() {
                                                          _model.loop =
                                                              _model.loop + 1;
                                                        });
                                                      }
                                                      setState(() {
                                                        _model.loop = 0;
                                                      });
                                                      _model.apiResultUpdateoperationToken =
                                                          await action_blocks
                                                              .tokenReload(
                                                                  context);
                                                      if (_model
                                                          .apiResultUpdateoperationToken!) {
                                                        _model.apiResultUpdateoperation =
                                                            await TaskGroup
                                                                .updateOperationCall
                                                                .call(
                                                          accessToken:
                                                              FFAppState()
                                                                  .accessToken,
                                                          requestDataJson:
                                                              _model
                                                                  .responseData
                                                                  ?.toMap(),
                                                          operationId:
                                                              dataListItem
                                                                  .operations
                                                                  .first
                                                                  .operationsId
                                                                  .id,
                                                        );
                                                        if ((_model
                                                                .apiResultUpdateoperation
                                                                ?.succeeded ??
                                                            true)) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Update thành công',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                          setState(() => _model
                                                              .listViewPagingController1
                                                              ?.refresh());
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Update thất bại',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                            ),
                                                          );
                                                        }
                                                      } else {
                                                        setState(() {});
                                                      }

                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                            if (dataListItem.actionType ==
                                                'image')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: DoActionTypeImageWidget(
                                                  key: Key(
                                                      'Keyaan_${dataListIndex}_of_${_model.listViewPagingController1!.itemList!.length}'),
                                                  image: dataListItem,
                                                  callback: (images) async {
                                                    setState(() {
                                                      _model.responseData =
                                                          null;
                                                    });
                                                    while (_model.loop <
                                                        images!.length) {
                                                      setState(() {
                                                        _model
                                                            .updateResponseDataStruct(
                                                          (e) => e
                                                            ..status = 'done'
                                                            ..updateFiles(
                                                              (e) => e.add(
                                                                  FileDataTypeStruct(
                                                                directusFilesId:
                                                                    FileIDDataTypeStruct(
                                                                  id: images[
                                                                      _model
                                                                          .loop],
                                                                ),
                                                              )),
                                                            ),
                                                        );
                                                      });
                                                      setState(() {
                                                        _model.loop =
                                                            _model.loop + 1;
                                                      });
                                                    }
                                                    setState(() {
                                                      _model.loop = 0;
                                                    });
                                                    _model.updateoperationToken =
                                                        await action_blocks
                                                            .tokenReload(
                                                                context);
                                                    if (_model
                                                        .updateoperationToken!) {
                                                      _model.apiResultUpdateoperation2 =
                                                          await TaskGroup
                                                              .updateOperationCall
                                                              .call(
                                                        accessToken:
                                                            FFAppState()
                                                                .accessToken,
                                                        requestDataJson: _model
                                                            .responseData
                                                            ?.toMap(),
                                                        operationId:
                                                            dataListItem
                                                                .operations
                                                                .first
                                                                .operationsId
                                                                .id,
                                                      );
                                                      if ((_model
                                                              .apiResultUpdateoperation2
                                                              ?.succeeded ??
                                                          true)) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Update thành công',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Update thất bại',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                      }

                                                      setState(() => _model
                                                          .listViewPagingController1
                                                          ?.refresh());
                                                    } else {
                                                      setState(() {});
                                                    }

                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                            if (dataListItem.actionType ==
                                                'approve')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child:
                                                    DoActionTypeApproveWidget(
                                                  key: Key(
                                                      'Keyyhw_${dataListIndex}_of_${_model.listViewPagingController1!.itemList!.length}'),
                                                  callback: (result) async {
                                                    _model.confirmOperationCopyToken =
                                                        await action_blocks
                                                            .tokenReload(
                                                                context);
                                                    if (_model
                                                        .confirmOperationCopyToken!) {
                                                      _model.apiResultConfirmOperationCopy =
                                                          await TaskGroup
                                                              .confirmOperationCall
                                                              .call(
                                                        accessToken:
                                                            FFAppState()
                                                                .accessToken,
                                                        staffId: FFAppState()
                                                            .staffid,
                                                        taskId: dataListItem.id,
                                                        submitType: 'reject',
                                                      );
                                                      if ((_model
                                                              .apiResultConfirmOperationCopy
                                                              ?.succeeded ??
                                                          true)) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Submit thành công',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Submit thất bại',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                      }

                                                      setState(() => _model
                                                          .listViewPagingController1
                                                          ?.refresh());
                                                      setState(() {});
                                                    } else {
                                                      setState(() {});
                                                    }

                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final datatodolist =
                                                      dataListItem.operations
                                                          .map((e) => e)
                                                          .toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        datatodolist.length,
                                                    itemBuilder: (context,
                                                        datatodolistIndex) {
                                                      final datatodolistItem =
                                                          datatodolist[
                                                              datatodolistIndex];
                                                      return Visibility(
                                                        visible: dataListItem
                                                                .actionType ==
                                                            'to_do_list',
                                                        child:
                                                            DoActionTypeToDoListWidget(
                                                          key: Key(
                                                              'Key6n7_${datatodolistIndex}_of_${datatodolist.length}'),
                                                          listdata:
                                                              datatodolistItem,
                                                          callback: (status,
                                                              operationId) async {
                                                            _model.updateoperationCopyCopyCopyCopyToken =
                                                                await action_blocks
                                                                    .tokenReload(
                                                                        context);
                                                            if (_model
                                                                .updateoperationCopyCopyCopyCopyToken!) {
                                                              _model.apiResultUpdateoperationCopyCopyCopyCopy =
                                                                  await TaskGroup
                                                                      .updateOperationCall
                                                                      .call(
                                                                accessToken:
                                                                    FFAppState()
                                                                        .accessToken,
                                                                requestDataJson: <String,
                                                                    dynamic>{
                                                                  'status':
                                                                      status,
                                                                },
                                                                operationId:
                                                                    operationId,
                                                              );
                                                              if ((_model
                                                                      .apiResultUpdateoperation
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Xác nhận thành công',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Xác nhận thất bại',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                  ),
                                                                );
                                                              }

                                                              setState(() => _model
                                                                  .listViewPagingController1
                                                                  ?.refresh());
                                                            } else {
                                                              setState(() {});
                                                            }

                                                            setState(() {});
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            if ((dataListItem.actionType ==
                                                    'submit_text') &&
                                                (dataListItem
                                                            .operations
                                                            .first
                                                            .operationsId
                                                            .result !=
                                                        null &&
                                                    dataListItem
                                                            .operations
                                                            .first
                                                            .operationsId
                                                            .result !=
                                                        ''))
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Html(
                                                      data: dataListItem
                                                          .operations
                                                          .first
                                                          .operationsId
                                                          .result,
                                                      onLinkTap:
                                                          (url, _, __, ___) =>
                                                              launchURL(url!),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  if (dataListItem.actionType ==
                                                      'submit_text')
                                                    Builder(
                                                      builder: (context) =>
                                                          FFButtonWidget(
                                                        onPressed: () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      TaskListCkPopupWidget(
                                                                    item: dataListItem
                                                                        .operations
                                                                        .first
                                                                        .operationsId
                                                                        .result,
                                                                    action:
                                                                        (ckString) async {
                                                                      _model.updateoperation22Token =
                                                                          await action_blocks
                                                                              .tokenReload(context);
                                                                      if (_model
                                                                          .updateoperation22Token!) {
                                                                        _model.apiResultUpdateoperation22 = await TaskGroup
                                                                            .updateOperationCall
                                                                            .call(
                                                                          accessToken:
                                                                              FFAppState().accessToken,
                                                                          requestDataJson: <String,
                                                                              dynamic>{
                                                                            'status':
                                                                                'done',
                                                                            'result':
                                                                                ckString,
                                                                          },
                                                                          operationId: dataListItem
                                                                              .operations
                                                                              .first
                                                                              .operationsId
                                                                              .id,
                                                                        );
                                                                        if (!(_model.apiResultUpdateoperation22?.succeeded ??
                                                                            true)) {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'Lưu thất bại!',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: const Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).error,
                                                                            ),
                                                                          );
                                                                        }
                                                                        setState(
                                                                            () {});
                                                                      } else {
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));

                                                          setState(() {});
                                                        },
                                                        text: 'Nhập văn bản',
                                                        icon: const Icon(
                                                          Icons.edit_note,
                                                          size: 24.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (!(isWeb
                ? MediaQuery.viewInsetsOf(context).bottom > 0
                : _isKeyboardVisible))
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                  child: wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => setState(() {}),
                    child: const NavBarWidget(
                      selectedPageIndex: 1,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
