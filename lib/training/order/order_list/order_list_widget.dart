import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/order/filter_order_list/filter_order_list_widget.dart';
import '/training/order/order_detail/order_detail_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'order_list_model.dart';
export 'order_list_model.dart';

class OrderListWidget extends StatefulWidget {
  const OrderListWidget({super.key});

  @override
  State<OrderListWidget> createState() => _OrderListWidgetState();
}

class _OrderListWidgetState extends State<OrderListWidget> {
  late OrderListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tokenReloadOrderList = await action_blocks.tokenReload(context);
      if (_model.tokenReloadOrderList!) {
        _model.isLoad = true;
        setState(() {});
        setState(() => _model.listViewPagingController?.refresh());
      } else {
        setState(() {});
        return;
      }
    });

    _model.searchTextController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
            'Lịch sử mua khóa học',
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
            visible: _model.isLoad == true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.searchTextController,
                            focusNode: _model.searchFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.searchTextController',
                              Duration(milliseconds: 500),
                              () async {
                                if (_model.searchTextController.text != null &&
                                    _model.searchTextController.text != '') {
                                  setState(() => _model.listViewPagingController
                                      ?.refresh());
                                } else {
                                  setState(() => _model.listViewPagingController
                                      ?.refresh());
                                }
                              },
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Tìm kiếm đơn hàng...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 8.0, 0.0, 8.0),
                              prefixIcon: Icon(
                                Icons.search_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 18.0,
                              ),
                              suffixIcon: _model
                                      .searchTextController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.searchTextController?.clear();
                                        if (_model.searchTextController.text !=
                                                null &&
                                            _model.searchTextController.text !=
                                                '') {
                                          setState(() => _model
                                              .listViewPagingController
                                              ?.refresh());
                                        } else {
                                          setState(() => _model
                                              .listViewPagingController
                                              ?.refresh());
                                        }

                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: Color(0xFF757575),
                                        size: 16.0,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                            maxLines: null,
                            validator: _model.searchTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FlutterFlowIconButton(
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
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () => FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: FilterOrderListWidget(
                                      status: _model.statusFilter,
                                      private: _model.privateFilter,
                                      dateStart: _model.dateStartFilter,
                                      dateEnd: _model.dateEndFilter,
                                      code: _model.codeFilter,
                                      name: _model.nameFilter,
                                      author: _model.authorFilter,
                                      callback: (statusCb,
                                          privateCb,
                                          dateStartCb,
                                          dateEndCb,
                                          codeCb,
                                          nameCb,
                                          authorCb) async {
                                        _model.statusFilter = statusCb!;
                                        _model.privateFilter = privateCb!;
                                        _model.codeFilter = codeCb;
                                        _model.nameFilter = nameCb;
                                        _model.authorFilter = authorCb;
                                        _model.dateStartFilter = dateStartCb;
                                        _model.dateEndFilter = dateEndCb;
                                        setState(() {});
                                        setState(() => _model
                                            .listViewPagingController
                                            ?.refresh());
                                      },
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                if (((_model.searchTextController.text != null &&
                            _model.searchTextController.text != '') &&
                        (_model.searchTextController.text != '') &&
                        (_model.searchTextController.text != ' ')) ||
                    ((_model.statusFilter != null &&
                            _model.statusFilter != '') &&
                        (_model.statusFilter != '') &&
                        (_model.statusFilter != ' ')) ||
                    ((_model.privateFilter != null &&
                            _model.privateFilter != '') &&
                        (_model.privateFilter != '') &&
                        (_model.privateFilter != ' ')) ||
                    ((_model.codeFilter != null && _model.codeFilter != '') &&
                        (_model.codeFilter != '') &&
                        (_model.codeFilter != ' ')) ||
                    ((_model.authorFilter != null &&
                            _model.authorFilter != '') &&
                        (_model.authorFilter != '') &&
                        (_model.authorFilter != ' ')) ||
                    ((_model.dateStartFilter != null &&
                            _model.dateStartFilter != '') &&
                        (_model.dateStartFilter != '') &&
                        (_model.dateStartFilter != ' ')) ||
                    ((_model.dateEndFilter != null &&
                            _model.dateEndFilter != '') &&
                        (_model.dateEndFilter != '') &&
                        (_model.dateEndFilter != ' ')))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 4.0),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: PagedListView<ApiPagingParams, dynamic>.separated(
                    pagingController: _model.setListViewController(
                      (nextPageMarker) => OrderGroup.getListOrderCall.call(
                        accessToken: FFAppState().accessToken,
                        limit: 20,
                        offset: nextPageMarker.nextPageNumber * 20,
                        filter:
                            '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
                          FFAppState().staffLogin,
                          r'''$.organization_id''',
                        ).toString()}\"}},{\"customer_id\":{\"id\":{\"_eq\":\"${getJsonField(
                          FFAppState().staffLogin,
                          r'''$.id''',
                        ).toString()}\"}}}${(_model.searchTextController.text != null && _model.searchTextController.text != '') && (_model.searchTextController.text != ' ') ? ',{\"program_order_items\":{\"program_id\":{\"name\":{\"_icontains\":\"${_model.searchTextController.text}\"}}}}' : ' '}${(_model.statusFilter != null && _model.statusFilter != '') && (_model.statusFilter != '') && (_model.statusFilter != '') ? ',{\"status\":{\"_eq\":\"${_model.statusFilter == 'Nháp' ? 'draft' : 'published'}\"}}' : ' '}${(_model.privateFilter != null && _model.privateFilter != '') && (_model.privateFilter != '') && (_model.privateFilter != '') ? ',{\"private\":{\"_eq\":\"${_model.privateFilter == 'Cá nhân' ? '1' : '0'}\"}}' : ' '}${(_model.codeFilter != null && _model.codeFilter != '') && (_model.codeFilter != '') && (_model.codeFilter != '') ? ',{\"code\":{\"_icontains\":\"${_model.codeFilter}\"}}' : ' '}${(_model.authorFilter != null && _model.authorFilter != '') && (_model.authorFilter != '') && (_model.authorFilter != '') ? ',{\"program_order_items\":{\"program_id\":{\"author_id\":{\"alias\":{\"_icontains\":\"${_model.authorFilter}\"}}}}}' : ' '}${(_model.dateStartFilter != null && _model.dateStartFilter != '') && (_model.dateStartFilter != '') && (_model.dateStartFilter != '') ? ',{\"date_created\":{\"_gte\":\"${_model.dateStartFilter}\"}}' : ' '}${(_model.dateEndFilter != null && _model.dateEndFilter != '') && (_model.dateEndFilter != '') && (_model.dateEndFilter != '') ? ',{\"date_created\":{\"_lte\":\"${(String var1) {
                                return DateTime.parse(var1)
                                    .add(Duration(days: 1))
                                    .toString();
                              }(_model.dateEndFilter)}\"}}' : ' '}]}',
                        sort: '-date_created',
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
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
                      noItemsFoundIndicatorBuilder: (_) => Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: DataNotFoundWidget(),
                      ),
                      itemBuilder: (context, _, dataListIndex) {
                        final dataListItem = _model
                            .listViewPagingController!.itemList![dataListIndex];
                        return Visibility(
                          visible: dataListItem.programOrderItems.isNotEmpty,
                          child: Builder(
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
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () =>
                                            FocusScope.of(dialogContext)
                                                .unfocus(),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          child: OrderDetailWidget(
                                            image: dataListItem
                                                .programOrderItems
                                                .first
                                                .programId
                                                .imageCover,
                                            name: dataListItem.programOrderItems
                                                .first.programId.name,
                                            rating: 0.0,
                                            author: dataListItem
                                                .programOrderItems
                                                .first
                                                .programId
                                                .authorId
                                                .alias,
                                            quantity: valueOrDefault<int>(
                                              dataListItem.totalItem,
                                              0,
                                            ),
                                            status: dataListItem.status,
                                            price: valueOrDefault<String>(
                                              dataListItem.programOrderItems
                                                  .first.programId.price,
                                              '0',
                                            ),
                                            numLessions: valueOrDefault<int>(
                                              dataListItem
                                                  .programOrderItems
                                                  .first
                                                  .programId
                                                  .lessions
                                                  .length,
                                              0,
                                            ),
                                            totalPrice: valueOrDefault<String>(
                                              dataListItem.totalPrice,
                                              '0',
                                            ),
                                            private:
                                                dataListItem.private.toString(),
                                            code: dataListItem.code,
                                            orderId: dataListItem.id,
                                            programId: dataListItem
                                                .programOrderItems
                                                .first
                                                .programId
                                                .id,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                width: 100.0,
                                                height: 110.0,
                                                decoration: BoxDecoration(),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    '${FFAppConstants.ApiBaseUrl}/assets/${dataListItem.programOrderItems.first.programId.imageCover}?access_token=${FFAppState().accessToken}',
                                                    width: 100.0,
                                                    height: 110.0,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                      'assets/images/error_image.png',
                                                      width: 100.0,
                                                      height: 110.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 4.0, 0.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: dataListItem
                                                                  .status ==
                                                              'draft'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    2.0,
                                                                    5.0,
                                                                    2.0),
                                                        child: Text(
                                                          dataListItem.status ==
                                                                  'draft'
                                                              ? 'Nháp'
                                                              : 'Hoàn tất',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: dataListItem
                                                                            .status ==
                                                                        'draft'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              '#${(dataListIndex + 1).toString()}: ',
                                                          style: TextStyle(),
                                                        ),
                                                        TextSpan(
                                                          text: dataListItem
                                                              .programOrderItems
                                                              .first
                                                              .programId
                                                              .name,
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16.0,
                                                          ),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    maxLines: 2,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons.videocam_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20.0,
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          '${dataListItem.programOrderItems.first.programId.lessions.length.toString()} bài học',
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '${dataListItem.totalItem.toString()} bản',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons.date_range,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20.0,
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          '${dateTimeFormat(
                                                            "dd/MM/yyyy",
                                                            functions
                                                                .stringToDateTime(
                                                                    dataListItem
                                                                        .dateCreated),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        '${formatNumber(
                                                          functions.stringToInt(
                                                              dataListItem
                                                                  .totalPrice),
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .commaDecimal,
                                                        )}',
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons.person,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20.0,
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          dataListItem
                                                              .programOrderItems
                                                              .first
                                                              .programId
                                                              .authorId
                                                              .alias,
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      4.0,
                                                                      8.0,
                                                                      4.0),
                                                          child: Text(
                                                            dataListItem.private ==
                                                                    0
                                                                ? 'Tổ chức'
                                                                : 'Cá nhân',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                    Divider(
                                      height: 1.0,
                                      thickness: 1.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
