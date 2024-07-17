import '/backend/api_requests/api_calls.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/operation/filter_operation/filter_operation_widget.dart';
import '/operation/operation_create/operation_create_widget.dart';
import '/operation/operation_detail/operation_detail_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'operation_list_model.dart';
export 'operation_list_model.dart';

class OperationListWidget extends StatefulWidget {
  const OperationListWidget({super.key});

  @override
  State<OperationListWidget> createState() => _OperationListWidgetState();
}

class _OperationListWidgetState extends State<OperationListWidget>
    with TickerProviderStateMixin {
  late OperationListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OperationListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tokenReloadOperationListList =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadOperationListList!) {
        _model.isLoad = true;
        setState(() {});
      } else {
        FFAppState().update(() {});
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

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
          child: Builder(
            builder: (context) => FloatingActionButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: const AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      child: GestureDetector(
                        onTap: () => _model.unfocusNode.canRequestFocus
                            ? FocusScope.of(context)
                                .requestFocus(_model.unfocusNode)
                            : FocusScope.of(context).unfocus(),
                        child: OperationCreateWidget(
                          callBack: () async {
                            _model.seachName = '';
                            _model.seachUserCreate = '';
                            _model.searchAction = '';
                            _model.searchDateStart = '';
                            _model.searchDateEnd = '';
                            _model.searchStatus = '';
                            setState(() {});
                            setState(() {
                              _model.textController?.clear();
                            });
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            setState(() =>
                                _model.listViewOnePagingController?.refresh());
                            setState(() =>
                                _model.listViewTwoPagingController?.refresh());
                            setState(() => _model.listViewThreePagingController
                                ?.refresh());

                            setState(() {});
                          },
                        ),
                      ),
                    );
                  },
                ).then((value) => setState(() {}));
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
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
          ),
          title: Text(
            'Danh sách hành động',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Nunito Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Visibility(
            visible: _model.isLoad == true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
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
                              _model.seachName = _model.textController.text;
                              setState(() {});
                              setState(() => _model.listViewOnePagingController
                                  ?.refresh());
                              setState(() => _model.listViewTwoPagingController
                                  ?.refresh());
                              setState(() => _model
                                  .listViewThreePagingController
                                  ?.refresh());

                              setState(() {});
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
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            prefixIcon: const Icon(
                              Icons.search,
                            ),
                            suffixIcon: _model.textController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.textController?.clear();
                                      _model.seachName =
                                          _model.textController.text;
                                      setState(() {});
                                      setState(() => _model
                                          .listViewOnePagingController
                                          ?.refresh());
                                      setState(() => _model
                                          .listViewTwoPagingController
                                          ?.refresh());
                                      setState(() => _model
                                          .listViewThreePagingController
                                          ?.refresh());

                                      setState(() {});
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 22,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 10.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        icon: Icon(
                          Icons.tune_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: FilterOperationWidget(
                                    name: _model.seachName,
                                    dateStart: _model.searchDateStart,
                                    dateEnd: _model.searchDateEnd,
                                    userCreate: _model.seachUserCreate,
                                    action: _model.searchAction,
                                    status: _model.searchStatus,
                                    callBack: (name, dateStart, dateEnd,
                                        userCeated, status, actionType) async {
                                      _model.seachName = name!;
                                      _model.seachUserCreate = userCeated!;
                                      _model.searchAction = actionType!;
                                      _model.searchStatus = status!;
                                      _model.searchDateStart = dateStart!;
                                      _model.searchDateEnd = dateEnd!;
                                      setState(() {});
                                      setState(() {
                                        _model.textController?.clear();
                                      });
                                      setState(() => _model
                                          .listViewOnePagingController
                                          ?.refresh());
                                      setState(() => _model
                                          .listViewTwoPagingController
                                          ?.refresh());
                                      setState(() => _model
                                          .listViewThreePagingController
                                          ?.refresh());
                                      setState(() {
                                        _model.textController?.text = name;
                                        _model.textController?.selection =
                                            TextSelection.collapsed(
                                                offset: _model.textController!
                                                    .text.length);
                                      });

                                      setState(() {});
                                    },
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ],
                  ),
                ),
                if ((_model.seachName != '') ||
                    (_model.seachUserCreate != '') ||
                    (_model.searchAction != '') ||
                    (_model.searchDateStart != '') ||
                    (_model.searchDateEnd != '') ||
                    (_model.searchStatus != ''))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 0.0, 0.0),
                    child: Text(
                      '#Kết quả hiển thị theo bộ lọc',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Nunito Sans',
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: const Alignment(-1.0, 0),
                          child: TabBar(
                            labelColor: FlutterFlowTheme.of(context).primary,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                            indicatorColor:
                                FlutterFlowTheme.of(context).primary,
                            padding: const EdgeInsets.all(4.0),
                            tabs: const [
                              Tab(
                                text: 'Tất cả',
                              ),
                              Tab(
                                text: 'Tạo mới',
                              ),
                              Tab(
                                text: 'Mặc định',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [
                                () async {
                                  setState(() => _model
                                      .listViewOnePagingController
                                      ?.refresh());
                                },
                                () async {
                                  setState(() => _model
                                      .listViewTwoPagingController
                                      ?.refresh());
                                },
                                () async {
                                  setState(() => _model
                                      .listViewThreePagingController
                                      ?.refresh());
                                }
                              ][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Stack(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                children: [
                                  if (_model.isLoad == true)
                                    PagedListView<ApiPagingParams,
                                        dynamic>.separated(
                                      pagingController:
                                          _model.setListViewOneController(
                                        (nextPageMarker) => OperationGroup
                                            .operationListCall
                                            .call(
                                          accessToken: FFAppState().accessToken,
                                          limit: 20,
                                          offset:
                                              nextPageMarker.nextPageNumber *
                                                  20,
                                          filter: '{\"_or\":[{\"_and\":[{}${',{\"organization_id\":{\"_eq\":\"${getJsonField(
                                            FFAppState().staffLogin,
                                            r'''$.organization_id''',
                                          ).toString()}\"}}'}${(_model.seachName != '') && (_model.seachName != ' ') ? ',{\"name\":{\"_icontains\":\"${_model.seachName}\"}}' : ' '}${(_model.searchStatus != '') && (_model.searchStatus != ' ') ? ',{\"status\":{\"_eq\":\"${_model.searchStatus}\"}}' : ' '}${(_model.searchAction != '') && (_model.searchAction != ' ') ? ',{\"action_type\":{\"_eq\":\"${_model.searchAction}\"}}' : ' '}${(_model.searchDateStart != '') && (_model.searchDateStart != ' ') ? ',{\"date_created\":{\"_gte\":\"${_model.searchDateStart}\"}}' : ''}${(_model.searchDateEnd != '') && (_model.searchDateEnd != ' ') ? ',{\"date_created\":{\"_lte\":\"${(String var1) {
                                              return DateTime.parse(var1)
                                                  .add(const Duration(days: 1))
                                                  .toString();
                                            }(_model.searchDateEnd)}\"}}' : ' '}${(_model.seachUserCreate != '') && (_model.seachUserCreate != ' ') ? ',{\"user_created\":{\"first_name\":{\"_icontains\":\"${_model.seachUserCreate}\"}}}' : ''},{ \"flow_id\":{\"_null\": true}}]}${',{\"_and\":[{}${(_model.seachName != '') && (_model.seachName != ' ') ? ',{\"name\":{\"_icontains\":\"${_model.seachName}\"}}' : ' '}${(_model.searchStatus != '') && (_model.searchStatus != ' ') ? ',{\"status\":{\"_eq\":\"${_model.searchStatus}\"}}' : ' '}${(_model.searchAction != '') && (_model.searchAction != ' ') ? ',{\"action_type\":{\"_eq\":\"${_model.searchAction}\"}}' : ' '}${(_model.searchDateStart != '') && (_model.searchDateStart != ' ') ? ',{\"date_created\":{\"_gte\":\"${_model.searchDateStart}\"}}' : ''}${(_model.searchDateEnd != '') && (_model.searchDateEnd != ' ') ? ',{\"date_created\":{\"_lte\":\"${(String var1) {
                                              return DateTime.parse(var1)
                                                  .add(const Duration(days: 1))
                                                  .toString();
                                            }(_model.searchDateEnd)}\"}}' : ' '},{ \"flow_id\":{\"_nnull\": true}}${(_model.seachUserCreate != '') && (_model.seachUserCreate != ' ') ? ',{\"user_created\":{\"first_name\":{\"_icontains\":\"${_model.seachUserCreate}\"}}}' : ''}]}'}]}',
                                        ),
                                      ),
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      reverse: false,
                                      scrollDirection: Axis.vertical,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 10.0),
                                      builderDelegate:
                                          PagedChildBuilderDelegate<dynamic>(
                                        // Customize what your widget looks like when it's loading the first page.
                                        firstPageProgressIndicatorBuilder:
                                            (_) => Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
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
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                        noItemsFoundIndicatorBuilder: (_) =>
                                            const Center(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: DataNotFoundWidget(),
                                          ),
                                        ),
                                        itemBuilder:
                                            (context, _, itemOperationIndex) {
                                          final itemOperationItem = _model
                                              .listViewOnePagingController!
                                              .itemList![itemOperationIndex];
                                          return Builder(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
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
                                                            OperationDetailWidget(
                                                          operationDetail:
                                                              itemOperationItem,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          '#${(itemOperationIndex + 1).toString()} ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: itemOperationItem.name !=
                                                                              'null'
                                                                          ? itemOperationItem
                                                                              .name
                                                                          : ' ',
                                                                      style:
                                                                          const TextStyle(),
                                                                    )
                                                                  ],
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
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          if ((itemOperationItem
                                                                          .flowId !=
                                                                      null &&
                                                                  itemOperationItem
                                                                          .flowId !=
                                                                      '') &&
                                                              (itemOperationItem
                                                                      .flowId !=
                                                                  'null'))
                                                            Icon(
                                                              Icons
                                                                  .settings_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Người tạo:  ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
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
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: itemOperationItem
                                                                            .userCreated
                                                                            .firstName !=
                                                                        'null'
                                                                    ? itemOperationItem
                                                                        .userCreated
                                                                        .firstName
                                                                    : ' ',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          'Nội dung: ${itemOperationItem.description != 'null' ? itemOperationItem.content : ''}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Mô tả:  ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
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
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: itemOperationItem
                                                                            .description !=
                                                                        'null'
                                                                    ? itemOperationItem
                                                                        .description
                                                                    : ' ',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  'Kiểu hành động: ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
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
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: () {
                                                                if (itemOperationItem
                                                                        .actionType ==
                                                                    'submit_text') {
                                                                  return 'Nhập văn bản';
                                                                } else if (itemOperationItem
                                                                        .actionType ==
                                                                    'image') {
                                                                  return 'Chụp ảnh';
                                                                } else if (itemOperationItem
                                                                        .actionType ==
                                                                    'upload_file') {
                                                                  return 'Upload file';
                                                                } else if (itemOperationItem
                                                                        .actionType ==
                                                                    'to_do_list') {
                                                                  return 'Ckecklist công việc';
                                                                } else {
                                                                  return 'Phê duyệt';
                                                                }
                                                              }(),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                        ),
                                                      ),
                                                      const Divider(
                                                        height: 12.0,
                                                        thickness: 1.0,
                                                        color:
                                                            Color(0x5657636C),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Ngày tạo: ${dateTimeFormat(
                                                                'dd/MM/yyyy',
                                                                functions.stringToDateTime(
                                                                    itemOperationItem
                                                                        .dateCreated),
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )}',
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
                                                          ),
                                                          Container(
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: itemOperationItem
                                                                          .status ==
                                                                      'draft'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Text(
                                                                itemOperationItem
                                                                            .status ==
                                                                        'draft'
                                                                    ? 'Không hoạt động'
                                                                    : 'Hoạt động ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: itemOperationItem.status ==
                                                                              'draft'
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .tertiary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                      fontSize:
                                                                          13.0,
                                                                      letterSpacing:
                                                                          0.0,
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
                                ],
                              ),
                              Stack(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                children: [
                                  PagedListView<ApiPagingParams,
                                      dynamic>.separated(
                                    pagingController:
                                        _model.setListViewTwoController(
                                      (nextPageMarker) =>
                                          OperationGroup.operationListCall.call(
                                        accessToken: FFAppState().accessToken,
                                        limit: 20,
                                        offset:
                                            nextPageMarker.nextPageNumber * 20,
                                        filter: '{\"_and\":[{}${',{\"organization_id\":{\"_eq\":\"${getJsonField(
                                          FFAppState().staffLogin,
                                          r'''$.organization_id''',
                                        ).toString()}\"}}'}${(_model.seachName != '') && (_model.seachName != ' ') ? ',{\"name\":{\"_icontains\":\"${_model.seachName}\"}}' : ' '}${(_model.searchStatus != '') && (_model.searchStatus != ' ') ? ',{\"status\":{\"_eq\":\"${_model.searchStatus}\"}}' : ' '}${(_model.searchAction != '') && (_model.searchAction != ' ') ? ',{\"action_type\":{\"_eq\":\"${_model.searchAction}\"}}' : ' '}${(_model.searchDateStart != '') && (_model.searchDateStart != ' ') ? ',{\"date_created\":{\"_gte\":\"${_model.searchDateStart}\"}}' : ''}${(_model.searchDateEnd != '') && (_model.searchDateEnd != ' ') ? ',{\"date_created\":{\"_lte\":\"${(String var1) {
                                            return DateTime.parse(var1)
                                                .add(const Duration(days: 1))
                                                .toString();
                                          }(_model.searchDateEnd)}\"}}' : ' '}${(_model.seachUserCreate != '') && (_model.seachUserCreate != ' ') ? ',{\"user_created\":{\"first_name\":{\"_icontains\":\"${_model.seachUserCreate}\"}}}' : ''},{ \"flow_id\":{\"_null\": true}}]}',
                                      ),
                                    ),
                                    padding: EdgeInsets.zero,
                                    reverse: false,
                                    scrollDirection: Axis.vertical,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 8.0),
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
                                              FlutterFlowTheme.of(context)
                                                  .primary,
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
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                      noItemsFoundIndicatorBuilder: (_) =>
                                          const SizedBox(
                                        width: double.infinity,
                                        child: DataNotFoundWidget(),
                                      ),
                                      itemBuilder:
                                          (context, _, itemUserCreatedIndex) {
                                        final itemUserCreatedItem = _model
                                            .listViewTwoPagingController!
                                            .itemList![itemUserCreatedIndex];
                                        return Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
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
                                                          OperationDetailWidget(
                                                        operationDetail:
                                                            itemUserCreatedItem,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
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
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  '#${(itemUserCreatedIndex + 1).toString()} ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: itemUserCreatedItem
                                                                          .name !=
                                                                      'null'
                                                                  ? itemUserCreatedItem
                                                                      .name
                                                                  : ' ',
                                                              style:
                                                                  const TextStyle(),
                                                            )
                                                          ],
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
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  'Người tạo:  ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
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
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: itemUserCreatedItem
                                                                          .userCreated
                                                                          .firstName !=
                                                                      'null'
                                                                  ? itemUserCreatedItem
                                                                      .userCreated
                                                                      .firstName
                                                                  : ' ',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
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
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Text(
                                                        'Nội dung: ${itemUserCreatedItem.content != 'null' ? itemUserCreatedItem.content : ''}',
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
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: 'Mô tả:  ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
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
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: itemUserCreatedItem
                                                                          .description !=
                                                                      'null'
                                                                  ? itemUserCreatedItem
                                                                      .description
                                                                  : ' ',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
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
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'Kiểu hành động: ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
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
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: () {
                                                              if (itemUserCreatedItem
                                                                      .actionType ==
                                                                  'submit_text') {
                                                                return 'Nhập văn bản';
                                                              } else if (itemUserCreatedItem
                                                                      .actionType ==
                                                                  'image') {
                                                                return 'Chụp ảnh';
                                                              } else if (itemUserCreatedItem
                                                                      .actionType ==
                                                                  'upload_file') {
                                                                return 'Upload file';
                                                              } else if (itemUserCreatedItem
                                                                      .actionType ==
                                                                  'to_do_list') {
                                                                return 'Ckecklist công việc';
                                                              } else {
                                                                return 'Phê duyệt';
                                                              }
                                                            }(),
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                          )
                                                        ],
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      ),
                                                    ),
                                                    const Divider(
                                                      height: 12.0,
                                                      thickness: 1.0,
                                                      color: Color(0x5657636C),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            dateTimeFormat(
                                                              'dd/MM/yyyy',
                                                              functions.stringToDateTime(
                                                                  itemUserCreatedItem
                                                                      .dateCreated),
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
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
                                                        ),
                                                        Container(
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: itemUserCreatedItem
                                                                        .status ==
                                                                    'draft'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent3
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Text(
                                                              itemUserCreatedItem
                                                                          .status ==
                                                                      'draft'
                                                                  ? 'Không hoạt động'
                                                                  : 'Hoạt động',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: itemUserCreatedItem.status ==
                                                                            'draft'
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .tertiary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
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
                                ],
                              ),
                              Stack(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                children: [
                                  PagedListView<ApiPagingParams,
                                      dynamic>.separated(
                                    pagingController:
                                        _model.setListViewThreeController(
                                      (nextPageMarker) =>
                                          OperationGroup.operationListCall.call(
                                        filter: '{\"_and\":[{}${(_model.seachName != '') && (_model.seachName != ' ') ? ',{\"name\":{\"_icontains\":\"${_model.seachName}\"}}' : ' '}${(_model.searchStatus != '') && (_model.searchStatus != ' ') ? ',{\"status\":{\"_eq\":\"${_model.searchStatus}\"}}' : ' '}${(_model.searchAction != '') && (_model.searchAction != ' ') ? ',{\"action_type\":{\"_eq\":\"${_model.searchAction}\"}}' : ' '}${(_model.searchDateStart != '') && (_model.searchDateStart != ' ') ? ',{\"date_created\":{\"_gte\":\"${_model.searchDateStart}\"}}' : ''}${(_model.searchDateEnd != '') && (_model.searchDateEnd != ' ') ? ',{\"date_created\":{\"_lte\":\"${(String var1) {
                                            return DateTime.parse(var1)
                                                .add(const Duration(days: 1))
                                                .toString();
                                          }(_model.searchDateEnd)}\"}}' : ' '},{ \"flow_id\":{\"_nnull\": true}}]}',
                                        accessToken: FFAppState().accessToken,
                                        offset:
                                            nextPageMarker.nextPageNumber * 20,
                                        limit: 20,
                                      ),
                                    ),
                                    padding: EdgeInsets.zero,
                                    reverse: false,
                                    scrollDirection: Axis.vertical,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 8.0),
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
                                              FlutterFlowTheme.of(context)
                                                  .primary,
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
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                      noItemsFoundIndicatorBuilder: (_) =>
                                          const Center(
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: DataNotFoundWidget(),
                                        ),
                                      ),
                                      itemBuilder:
                                          (context, _, itemDefaultIndex) {
                                        final itemDefaultItem = _model
                                            .listViewThreePagingController!
                                            .itemList![itemDefaultIndex];
                                        return Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
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
                                                          OperationDetailWidget(
                                                        operationDetail:
                                                            itemDefaultItem,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
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
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text:
                                                                        '#${(itemDefaultIndex + 1).toString()} ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: itemDefaultItem.name !=
                                                                            'null'
                                                                        ? itemDefaultItem
                                                                            .name
                                                                        : ' ',
                                                                    style:
                                                                        const TextStyle(),
                                                                  )
                                                                ],
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
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .settings_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Text(
                                                        'Nội dung: ${itemDefaultItem.content != 'null' ? itemDefaultItem.content : ' '}',
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
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: 'Mô tả:  ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
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
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: itemDefaultItem
                                                                          .description !=
                                                                      'null'
                                                                  ? itemDefaultItem
                                                                      .description
                                                                  : ' ',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
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
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'Kiểu hành động: ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
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
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: () {
                                                              if (itemDefaultItem
                                                                      .actionType !=
                                                                  'submit_text') {
                                                                return 'Nhập văn bản';
                                                              } else if (itemDefaultItem
                                                                      .actionType ==
                                                                  'image') {
                                                                return 'Chụp ảnh';
                                                              } else if (itemDefaultItem
                                                                      .actionType ==
                                                                  'upload_file') {
                                                                return 'Upload file';
                                                              } else if (itemDefaultItem
                                                                      .actionType ==
                                                                  'to_do_list') {
                                                                return 'Ckecklist công việc';
                                                              } else {
                                                                return 'Phê duyệt';
                                                              }
                                                            }(),
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                          )
                                                        ],
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      ),
                                                    ),
                                                    const Divider(
                                                      height: 12.0,
                                                      thickness: 1.0,
                                                      color: Color(0x5657636C),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            dateTimeFormat(
                                                              'dd/MM/yyyy',
                                                              functions.stringToDateTime(
                                                                  itemDefaultItem
                                                                      .dateCreated),
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
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
                                                        ),
                                                        Container(
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: itemDefaultItem
                                                                        .status ==
                                                                    'draft'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent3
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Text(
                                                              itemDefaultItem
                                                                          .status ==
                                                                      'draft'
                                                                  ? 'Không hoạt động'
                                                                  : 'Hoạt động',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: itemDefaultItem.status ==
                                                                            'draft'
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .tertiary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
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
                                ],
                              ),
                            ],
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
      ),
    );
  }
}
