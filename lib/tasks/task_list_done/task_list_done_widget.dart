import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/tasks/done_action_type_to_do_list/done_action_type_to_do_list_widget.dart';
import '/tasks/filter_task_list_done/filter_task_list_done_widget.dart';
import '/tasks/popup_see_more/popup_see_more_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'task_list_done_model.dart';
export 'task_list_done_model.dart';

class TaskListDoneWidget extends StatefulWidget {
  const TaskListDoneWidget({super.key});

  @override
  State<TaskListDoneWidget> createState() => _TaskListDoneWidgetState();
}

class _TaskListDoneWidgetState extends State<TaskListDoneWidget> {
  late TaskListDoneModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskListDoneModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.taskListDoneCaculatorTotalToken =
          await action_blocks.tokenReload(context);
      if (_model.taskListDoneCaculatorTotalToken!) {
        await _model.getNumberTask(context);
        setState(() {});
        _model.isLoad = true;
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
                  'Nhiệm vụ đã hoàn thành',
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
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 75.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
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
                                        Duration(milliseconds: 500),
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
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 0.0, 0.0, 0.0),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          size: 24.0,
                                        ),
                                        suffixIcon: _model
                                                .textController!.text.isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model.textController
                                                      ?.clear();
                                                  setState(() => _model
                                                      .listViewPagingController
                                                      ?.refresh());
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
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
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
                                                child: FilterTaskListDoneWidget(
                                                  filterSearch: _model
                                                      .textController.text,
                                                  dateStart:
                                                      _model.dateStartFilter,
                                                  dateEnd: _model.dateEndFilter,
                                                  type: _model.typeFilter,
                                                  created: _model.createdFilter,
                                                  workflowName:
                                                      _model.workflowNameFilter,
                                                  callback: (dateStarCallback,
                                                      dateEndCallback,
                                                      typeCallback,
                                                      createdCallback,
                                                      workflowNameFilter) async {
                                                    _model.dateStartFilter =
                                                        dateStarCallback;
                                                    _model.dateEndFilter =
                                                        dateEndCallback;
                                                    _model.typeFilter =
                                                        typeCallback;
                                                    _model.createdFilter =
                                                        createdCallback!;
                                                    _model.workflowNameFilter =
                                                        workflowNameFilter!;
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 1.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'TaskListWait',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
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
                                            'Chờ thực hiện (${_model.taskWait.toString()})',
                                        options: FFButtonOptions(
                                          width: 115.0,
                                          height: 30.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                fontWeight: FontWeight.w500,
                                              ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 1.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'TaskList',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
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
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                fontWeight: FontWeight.w500,
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 1.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text:
                                            'Hoàn thành (${_model.totalDone.toString()})',
                                        options: FFButtonOptions(
                                          width: 115.0,
                                          height: 30.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
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
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 6.0)),
                                ),
                              ),
                            ),
                            if ((_model.textController.text != null &&
                                    _model.textController.text != '') ||
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
                                padding: EdgeInsetsDirectional.fromSTEB(
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
                                    ).toString()}\"}}},{\"_or\":[{\"status\":{\"_eq\":\"done\"}},{\"status\":{\"_eq\":\"approved\"}}]},{\"submit_staff_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                      FFAppState().staffLogin,
                                      r'''$.id''',
                                    ).toString()}\"}}}${_model.textController.text != null && _model.textController.text != '' ? ',{\"name\":{\"_icontains\":\"${_model.textController.text}\"}}' : ' '}${(_model.dateStartFilter != null && _model.dateStartFilter != '') && (_model.dateStartFilter != ' ') ? ',{\"date_created\":{\"_gte\":\"${_model.dateStartFilter}\"}}' : ' '}${(_model.dateEndFilter != null && _model.dateEndFilter != '') && (_model.dateEndFilter != ' ') ? ((String var1) {
                                        return DateTime.parse(var1)
                                            .add(Duration(days: 1))
                                            .toString();
                                      }(',{\"date_created\":{\"_lte\":\"${dateTimeFormat(
                                        'yyyy-MM-dd',
                                        functions.stringToDateTime(
                                            _model.dateEndFilter),
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )}\"}}')) : ' '}${(_model.typeFilter != null && _model.typeFilter != '') && (_model.typeFilter != ' ') ? ',{\"action_type\":{\"_eq\":\"${() {
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
                                          return 'approve';
                                        } else {
                                          return ' ';
                                        }
                                      }()}\"}}' : ' '}${(_model.createdFilter != null && _model.createdFilter != '') && (_model.createdFilter != '') ? ',{\"created_user_id\":{\"first_name\":{\"_icontains\":\"${_model.createdFilter}\"}}}' : ' '}${(_model.workflowNameFilter != null && _model.workflowNameFilter != '') && (_model.workflowNameFilter != '') ? ',{\"workflow_id\":{\"name\":{\"_icontains\":\"${_model.workflowNameFilter}\"}}}' : ' '}]}',
                                    sort: '-date_end',
                                  ),
                                ),
                                padding: EdgeInsets.zero,
                                primary: false,
                                reverse: false,
                                scrollDirection: Axis.vertical,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 16.0),
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
                                  noItemsFoundIndicatorBuilder: (_) => Center(
                                    child: Container(
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 8.0, 4.0, 16.0),
                                        child: SingleChildScrollView(
                                          primary: false,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .stretch,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    dataListItem
                                                                        .name,
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '#${dataListItem.workflowId.name}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
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
                                                              FontAwesomeIcons
                                                                  .angleRight,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 18.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                'TaskDetail',
                                                                queryParameters:
                                                                    {
                                                                  'workflowId':
                                                                      serializeParam(
                                                                    dataListItem
                                                                        .workflowId
                                                                        .id,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'publishedCount':
                                                                      serializeParam(
                                                                    dataListItem
                                                                        .publishedCount,
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                  'paramBack':
                                                                      serializeParam(
                                                                    '2',
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (_model.isShow !=
                                                  dataListItem.id)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 6.0, 0.0, 6.0),
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
                                                      _model.isShow =
                                                          dataListItem.id;
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      'Xem thêm',
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
                                              if (_model.isShow ==
                                                  dataListItem.id)
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if (dataListItem
                                                                .createdUserId
                                                                .firstName !=
                                                            null &&
                                                        dataListItem
                                                                .createdUserId
                                                                .firstName !=
                                                            '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    4.0,
                                                                    8.0,
                                                                    4.0),
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
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    if (dataListItem
                                                            .publishedCount !=
                                                        null)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    4.0,
                                                                    8.0,
                                                                    4.0),
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
                                                                    .publishedCount
                                                                    .toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
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
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    4.0,
                                                                    8.0,
                                                                    4.0),
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
                                                                dateTimeFormat(
                                                                  'HH:mm dd/MM/yyyy',
                                                                  functions.stringToDateTime(
                                                                      dataListItem
                                                                          .dateCreated),
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    if (dataListItem
                                                                .timeOperate !=
                                                            null &&
                                                        dataListItem
                                                                .timeOperate !=
                                                            '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    4.0,
                                                                    8.0,
                                                                    4.0),
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
                                                                    .timeOperate,
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    if (dataListItem
                                                            .estimateInSecond ==
                                                        0)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    4.0,
                                                                    8.0,
                                                                    4.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .update_rounded,
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
                                                                    .estimateInSecond
                                                                    .toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    if (dataListItem
                                                                .dateStart !=
                                                            null &&
                                                        dataListItem
                                                                .dateStart !=
                                                            '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    4.0,
                                                                    8.0,
                                                                    4.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(
                                                              Icons.date_range,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                            Text(
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
                                                            Expanded(
                                                              child: Text(
                                                                dateTimeFormat(
                                                                  'HH:mm dd/MM/yyyy',
                                                                  functions.stringToDateTime(
                                                                      dataListItem
                                                                          .dateStart),
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    if (dataListItem.dateEnd !=
                                                            null &&
                                                        dataListItem.dateEnd !=
                                                            '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    4.0,
                                                                    8.0,
                                                                    4.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(
                                                              Icons.date_range,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                            Text(
                                                              'Hoàn thành (thực tế):',
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
                                                                dateTimeFormat(
                                                                  'HH:mm dd/MM/yyyy',
                                                                  functions.stringToDateTime(
                                                                      dataListItem
                                                                          .dateEnd),
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  6.0,
                                                                  0.0,
                                                                  6.0),
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 13.0,
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 4.0, 8.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.notes_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          'Nội dung: ${dataListItem.content}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              if (dataListItem.actionType ==
                                                  'to_do_list')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 4.0, 8.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.notes_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                      Text(
                                                        'Nội dung:',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              if (dataListItem.actionType ==
                                                  'to_do_list')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final dataChecklist =
                                                          dataListItem
                                                              .operations
                                                              .toList();
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            dataChecklist
                                                                .length,
                                                            (dataChecklistIndex) {
                                                          final dataChecklistItem =
                                                              dataChecklist[
                                                                  dataChecklistIndex];
                                                          return DoneActionTypeToDoListWidget(
                                                            key: Key(
                                                                'Key7m0_${dataChecklistIndex}_of_${dataChecklist.length}'),
                                                            listData:
                                                                dataChecklistItem,
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              if (dataListItem.actionType ==
                                                  'upload_file')
                                                Builder(
                                                  builder: (context) {
                                                    final listFile =
                                                        dataListItem.operations
                                                            .toList();
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          listFile.length,
                                                          (listFileIndex) {
                                                        final listFileItem =
                                                            listFile[
                                                                listFileIndex];
                                                        return Builder(
                                                          builder: (context) {
                                                            final fileItems =
                                                                listFileItem
                                                                    .operationsId
                                                                    .files
                                                                    .toList();
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  fileItems
                                                                      .length,
                                                                  (fileItemsIndex) {
                                                                final fileItemsItem =
                                                                    fileItems[
                                                                        fileItemsIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (functions.checkFileLast((String
                                                                              tail) {
                                                                            return tail.split('.').last;
                                                                          }(fileItemsItem
                                                                              .directusFilesId
                                                                              .filenameDownload)) ==
                                                                          'video')
                                                                        Container(
                                                                          width:
                                                                              35.0,
                                                                          height:
                                                                              35.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/images111.png',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      if (functions.checkFileLast((String
                                                                              tail) {
                                                                            return tail.split('.').last;
                                                                          }(fileItemsItem
                                                                              .directusFilesId
                                                                              .filenameDownload)) ==
                                                                          'exc')
                                                                        Container(
                                                                          width:
                                                                              35.0,
                                                                          height:
                                                                              35.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/excel.png',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      if (functions.checkFileLast((String
                                                                              tail) {
                                                                            return tail.split('.').last;
                                                                          }(fileItemsItem
                                                                              .directusFilesId
                                                                              .filenameDownload)) ==
                                                                          'img')
                                                                        Container(
                                                                          width:
                                                                              35.0,
                                                                          height:
                                                                              35.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/9967614.png',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      if (functions.checkFileLast((String
                                                                              tail) {
                                                                            return tail.split('.').last;
                                                                          }(fileItemsItem
                                                                              .directusFilesId
                                                                              .filenameDownload)) ==
                                                                          'word')
                                                                        Container(
                                                                          width:
                                                                              35.0,
                                                                          height:
                                                                              35.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/images.png',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      if (functions.checkFileLast((String
                                                                              tail) {
                                                                            return tail.split('.').last;
                                                                          }(fileItemsItem
                                                                              .directusFilesId
                                                                              .filenameDownload)) ==
                                                                          'pptx')
                                                                        Container(
                                                                          width:
                                                                              35.0,
                                                                          height:
                                                                              35.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/ppt.png',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      if (functions.checkFileLast((String
                                                                              tail) {
                                                                            return tail.split('.').last;
                                                                          }(fileItemsItem
                                                                              .directusFilesId
                                                                              .filenameDownload)) ==
                                                                          'pdf')
                                                                        Container(
                                                                          width:
                                                                              35.0,
                                                                          height:
                                                                              35.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/pdf.png',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          fileItemsItem
                                                                              .directusFilesId
                                                                              .filenameDownload,
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      if ((functions.checkFileLast((String tail) {
                                                                                return tail.split('.').last;
                                                                              }(fileItemsItem.directusFilesId.filenameDownload)) ==
                                                                              'pdf') ||
                                                                          (functions.checkFileLast((String tail) {
                                                                                return tail.split('.').last;
                                                                              }(fileItemsItem.directusFilesId.filenameDownload)) ==
                                                                              'img'))
                                                                        Builder(
                                                                          builder: (context) =>
                                                                              FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                20.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.remove_red_eye,
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              size: 24.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (dialogContext) {
                                                                                  return Dialog(
                                                                                    elevation: 0,
                                                                                    insetPadding: EdgeInsets.zero,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                    child: GestureDetector(
                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                      child: PopupSeeMoreWidget(
                                                                                        fileName: fileItemsItem.directusFilesId.filenameDownload,
                                                                                        fileId: fileItemsItem.directusFilesId.id,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() {}));
                                                                            },
                                                                          ),
                                                                        ),
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            20.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            40.0,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .download_sharp,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          _model.downloadFileToken =
                                                                              await action_blocks.tokenReload(context);
                                                                          if (_model
                                                                              .downloadFileToken!) {
                                                                            await actions.downloadFile(
                                                                              '${FFAppConstants.ApiBaseUrl}/assets/${fileItemsItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                              dataListItem.name,
                                                                              fileItemsItem.directusFilesId.filenameDownload,
                                                                            );
                                                                          } else {
                                                                            setState(() {});
                                                                          }

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              if (dataListItem.actionType ==
                                                  'image')
                                                Builder(
                                                  builder: (context) {
                                                    final listImage =
                                                        dataListItem.operations
                                                            .toList();
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          listImage.length,
                                                          (listImageIndex) {
                                                        final listImageItem =
                                                            listImage[
                                                                listImageIndex];
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final listImageGrid =
                                                                  listImageItem
                                                                      .operationsId
                                                                      .files
                                                                      .toList();
                                                              return GridView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                gridDelegate:
                                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      2,
                                                                  crossAxisSpacing:
                                                                      12.0,
                                                                  mainAxisSpacing:
                                                                      10.0,
                                                                  childAspectRatio:
                                                                      1.0,
                                                                ),
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    listImageGrid
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        listImageGridIndex) {
                                                                  final listImageGridItem =
                                                                      listImageGrid[
                                                                          listImageGridIndex];
                                                                  return Stack(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                    children: [
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await Navigator
                                                                              .push(
                                                                            context,
                                                                            PageTransition(
                                                                              type: PageTransitionType.fade,
                                                                              child: FlutterFlowExpandedImageView(
                                                                                image: Image.network(
                                                                                  '${FFAppConstants.ApiBaseUrl}/assets/${listImageGridItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                                  fit: BoxFit.contain,
                                                                                ),
                                                                                allowRotation: false,
                                                                                tag: '${FFAppConstants.ApiBaseUrl}/assets/${listImageGridItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                                useHeroAnimation: true,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                        child:
                                                                            Hero(
                                                                          tag:
                                                                              '${FFAppConstants.ApiBaseUrl}/assets/${listImageGridItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                          transitionOnUserGestures:
                                                                              true,
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              '${FFAppConstants.ApiBaseUrl}/assets/${listImageGridItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                              width: 300.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        borderRadius:
                                                                            20.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            40.0,
                                                                        fillColor:
                                                                            Color(0xF3E0E3E7),
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .download_sharp,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          _model.downloadIamgeToken =
                                                                              await action_blocks.tokenReload(context);
                                                                          if (_model
                                                                              .downloadIamgeToken!) {
                                                                            await actions.downloadFile(
                                                                              '${FFAppConstants.ApiBaseUrl}/assets/${listImageGridItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                              dataListItem.name,
                                                                              listImageGridItem.directusFilesId.filenameDownload,
                                                                            );
                                                                          } else {
                                                                            setState(() {});
                                                                          }

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              if (dataListItem.status == 'done')
                                                Html(
                                                  data: dataListItem
                                                      .operations
                                                      .first
                                                      .operationsId
                                                      .result,
                                                  onLinkTap:
                                                      (url, _, __, ___) =>
                                                          launchURL(url!),
                                                ),
                                            ],
                                          ),
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
            ),
            if (!(isWeb
                ? MediaQuery.viewInsetsOf(context).bottom > 0
                : _isKeyboardVisible))
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                  child: wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => setState(() {}),
                    child: NavBarWidget(
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
