import '/backend/api_requests/api_calls.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/tasks/filter_task_list_wait/filter_task_list_wait_widget.dart';
import '/tasks/wait_action_type_approve/wait_action_type_approve_widget.dart';
import '/tasks/wait_action_type_image/wait_action_type_image_widget.dart';
import '/tasks/wait_action_type_submit_text/wait_action_type_submit_text_widget.dart';
import '/tasks/wait_action_type_to_do_list/wait_action_type_to_do_list_widget.dart';
import '/tasks/wait_action_type_upload_file/wait_action_type_upload_file_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'task_list_wait_model.dart';
export 'task_list_wait_model.dart';

class TaskListWaitWidget extends StatefulWidget {
  const TaskListWaitWidget({super.key});

  @override
  State<TaskListWaitWidget> createState() => _TaskListWaitWidgetState();
}

class _TaskListWaitWidgetState extends State<TaskListWaitWidget> {
  late TaskListWaitModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskListWaitModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getTaskFailToken = await action_blocks.tokenReload(context);
      if (_model.getTaskFailToken!) {
        await _model.getNumberTask(context);
        setState(() {});
        _model.isLoad = true;
        setState(() {});
      } else {
        setState(() {});
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

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  'Nhiệm vụ đang chờ',
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
            Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 75.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      const Duration(milliseconds: 500),
                                      () async {
                                        setState(() => _model
                                            .listViewPagingController
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
                                              .textController!.text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.textController?.clear();
                                                setState(() => _model
                                                    .listViewPagingController
                                                    ?.refresh());
                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                    validator: _model.textControllerValidator
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
                                            backgroundColor: Colors.transparent,
                                            alignment: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: FilterTaskListWaitWidget(
                                                filterSearch:
                                                    _model.textController.text,
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
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text:
                                          'Chờ thực hiện (${_model.totalWait.toString()})',
                                      options: FFButtonOptions(
                                        width: 115.0,
                                        height: 30.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
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
                                          'TaskList',
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
                                      },
                                      text:
                                          'Đang thực hiện (${_model.taskToDo.toString()})',
                                      options: FFButtonOptions(
                                        width: 115.0,
                                        height: 30.0,
                                        padding: const EdgeInsets.all(0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
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
                                            kTransitionInfoKey: const TransitionInfo(
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
                                          'Hoàn thành (${_model.taskDone.toString()})',
                                      options: FFButtonOptions(
                                        width: 115.0,
                                        height: 30.0,
                                        padding: const EdgeInsets.all(0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
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
                          if ((_model.textController.text != '') ||
                              ((_model.dateStartFilter != null &&
                                      _model.dateStartFilter != '') &&
                                  (_model.dateStartFilter != '') &&
                                  (_model.dateStartFilter != ' ')) ||
                              ((_model.dateEndFilter != null &&
                                      _model.dateEndFilter != '') &&
                                  (_model.dateEndFilter != '') &&
                                  (_model.dateEndFilter != ' ')) ||
                              ((_model.typeFilter != null &&
                                      _model.typeFilter != '') &&
                                  (_model.typeFilter != '') &&
                                  (_model.typeFilter != ' ')))
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
                                      fontStyle: FontStyle.italic,
                                    ),
                              ),
                            ),
                          Expanded(
                            child: PagedListView<ApiPagingParams,
                                dynamic>.separated(
                              pagingController: _model.setListViewController(
                                (nextPageMarker) =>
                                    TaskGroup.getListTaskCall.call(
                                  accessToken: FFAppState().accessToken,
                                  limit: 20,
                                  offset: nextPageMarker.nextPageNumber * 20,
                                  filter: '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                    FFAppState().staffLogin,
                                    r'''$.id''',
                                  ).toString()}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
                                    FFAppState().staffLogin,
                                    r'''$.organization_id''',
                                  ).toString()}\"}}},{\"status\":{\"_eq\":\"todo\"}},{\"current\":{\"_eq\":\"0\"}}${(_model.dateStartFilter != null && _model.dateStartFilter != '') && (_model.dateStartFilter != ' ') ? ',{\"date_created\":{\"_gte\":\"${dateTimeFormat(
                                      'yyyy-MM-dd',
                                      functions.stringToDateTime(
                                          _model.dateStartFilter),
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )}\"}}' : ' '}${(_model.dateEndFilter != null && _model.dateEndFilter != '') && (_model.dateEndFilter != ' ') ? ((String var1) {
                                      return DateTime.parse(var1)
                                          .add(const Duration(days: 1))
                                          .toString();
                                    }(',{\"date_created\":{\"_lte\":\"${dateTimeFormat(
                                      'yyyy-MM-dd',
                                      functions.stringToDateTime(
                                          _model.dateEndFilter),
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )}\"}}')) : ' '}${(_model.typeFilter != null && _model.typeFilter != '') && (_model.typeFilter != ' ') ? ',{\"action_type\":{\"_eq\":\"${() {
                                      if (_model.typeFilter == 'Nhập văn bản') {
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
                                        return 'approve';
                                      } else {
                                        return ' ';
                                      }
                                    }()}\"}}' : ' '}${_model.textController.text != '' ? ',{\"name\":{\"_icontains\":\"${_model.textController.text}\"}}' : ' '}${(_model.createdFilter != '') && (_model.createdFilter == '') ? ',{\"created_user_id\":{\"first_name\":{\"_icontains\":\"${_model.createdFilter}\"}}}' : ' '}${(_model.workflowNameFilter != '') && (_model.workflowNameFilter == '') ? ',{\"workflow_id\":{\"name\":{\"_icontains\":\"${_model.workflowNameFilter}\"}}}' : ' '}]}',
                                  sort: '-date_created',
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
                                noItemsFoundIndicatorBuilder: (_) => const Center(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: DataNotFoundWidget(),
                                  ),
                                ),
                                itemBuilder: (context, _, dataListIndex) {
                                  final dataListItem = _model
                                      .listViewPagingController!
                                      .itemList![dataListIndex];
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 8.0, 4.0, 16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          dataListItem.name,
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
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
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.angleRight,
                                                    color: FlutterFlowTheme.of(
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
                                                          '3',
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.isShow != dataListItem.id)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 6.0, 0.0, 6.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.isShow =
                                                      dataListItem.id;
                                                  setState(() {});
                                                },
                                                child: Text(
                                                  'Xem thêm',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          if (_model.isShow == dataListItem.id)
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
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 6.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          Icons.person,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        Text(
                                                          'Người tạo:',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                fontSize: 14.0,
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
                                                      ].divide(
                                                          const SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                if (dataListItem
                                                        .publishedCount !=
                                                    null)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 6.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .confirmation_num_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        Text(
                                                          'Chạy lần thứ:',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                fontSize: 14.0,
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
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                if (dataListItem.dateCreated !=
                                                        null &&
                                                    dataListItem.dateCreated !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 6.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          Icons.timer,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        Text(
                                                          'Ngày tạo:',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                fontSize: 14.0,
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
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                if ((dataListItem.timeOperate !=
                                                            null &&
                                                        dataListItem
                                                                .timeOperate !=
                                                            '') &&
                                                    ('1' == '2'))
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 6.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          Icons.av_timer,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        Text(
                                                          'Bắt đầu (dự kiến):',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                fontSize: 14.0,
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
                                                                .timeOperate,
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
                                                      ].divide(
                                                          const SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                if (dataListItem
                                                        .estimateInSecond !=
                                                    0)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 6.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          Icons.update_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        Text(
                                                          'T.gian thực hiện (dự kiến):',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                fontSize: 14.0,
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
                                                            dataListItem.estimateInSecond.toString(),
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
                                                      ].divide(
                                                          const SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 6.0),
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
                                                      _model.isShow = null;
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      'Ẩn bớt',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontStyle: FontStyle
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
                                                  .fromSTEB(8.0, 0.0, 8.0, 6.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.notes_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 20.0,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Nội dung: ${dataListItem.operations.first.operationsId.content}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 8.0)),
                                              ),
                                            ),
                                          if (dataListItem.status == 'done')
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 6.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.notes_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 20.0,
                                                  ),
                                                  Text(
                                                    'Nội dung:',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(width: 8.0)),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: Visibility(
                                                visible:
                                                    (dataListItem.actionType ==
                                                            'to_do_list') &&
                                                        (dataListItem.operations
                                                                .length >
                                                            0),
                                                child:
                                                    WaitActionTypeToDoListWidget(
                                                  key: Key(
                                                      'Key84y_${dataListIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                                  listData:
                                                      dataListItem.operations,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(),
                                            child: Visibility(
                                              visible:
                                                  (dataListItem.actionType ==
                                                          'approved') &&
                                                      (dataListItem.operations
                                                              .length >
                                                          0),
                                              child:
                                                  WaitActionTypeApproveWidget(
                                                key: Key(
                                                    'Keyetv_${dataListIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            decoration: const BoxDecoration(),
                                            child: Visibility(
                                              visible:
                                                  (dataListItem.actionType ==
                                                          'image') &&
                                                      (dataListItem.operations
                                                              .length >
                                                          0),
                                              child: WaitActionTypeImageWidget(
                                                key: Key(
                                                    'Key3y6_${dataListIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            decoration: const BoxDecoration(),
                                            child: Visibility(
                                              visible:
                                                  (dataListItem.actionType ==
                                                          'upload_file') &&
                                                      (dataListItem.operations
                                                              .length >
                                                          0),
                                              child:
                                                  WaitActionTypeUploadFileWidget(
                                                key: Key(
                                                    'Key0qe_${dataListIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(),
                                            child: Visibility(
                                              visible:
                                                  (dataListItem.actionType ==
                                                          'submit_text') &&
                                                      (dataListItem.operations
                                                              .length >
                                                          0),
                                              child:
                                                  WaitActionTypeSubmitTextWidget(
                                                key: Key(
                                                    'Keys6z_${dataListIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                              ),
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
