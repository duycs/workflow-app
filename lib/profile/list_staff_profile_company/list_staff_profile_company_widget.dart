import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/components/data_not_found_row_new/data_not_found_row_new_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'list_staff_profile_company_model.dart';
export 'list_staff_profile_company_model.dart';

class ListStaffProfileCompanyWidget extends StatefulWidget {
  const ListStaffProfileCompanyWidget({
    super.key,
    this.id,
    this.nameBranch,
    this.boPhan,
    String? checkScroll,
  }) : this.checkScroll = checkScroll ?? '0';

  final String? id;
  final String? nameBranch;
  final String? boPhan;
  final String checkScroll;

  @override
  State<ListStaffProfileCompanyWidget> createState() =>
      _ListStaffProfileCompanyWidgetState();
}

class _ListStaffProfileCompanyWidgetState
    extends State<ListStaffProfileCompanyWidget> {
  late ListStaffProfileCompanyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListStaffProfileCompanyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.reloadTokenListStaffProfileCompanyApp =
          await action_blocks.tokenReload(context);
      if (_model.reloadTokenListStaffProfileCompanyApp!) {
        _model.isSShow = true;
        setState(() {});
      } else {
        setState(() {});
        return;
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
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
              context.pop();
            },
          ),
          title: Text(
            'Danh sách nhân viên',
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
            visible: _model.isSShow == true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Chi nhánh: ',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Nunito Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        Expanded(
                          child: Text(
                            widget!.nameBranch!,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 16.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Bộ phận: ',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Nunito Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        Expanded(
                          child: Text(
                            widget!.boPhan!,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 12.0),
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
                                setState(() => _model.listViewPagingController1
                                    ?.refresh());
                                setState(() => _model.listViewPagingController2
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
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
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
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 24.0,
                              ),
                              suffixIcon: _model.textController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.textController?.clear();
                                        setState(() => _model
                                            .listViewPagingController1
                                            ?.refresh());
                                        setState(() => _model
                                            .listViewPagingController2
                                            ?.refresh());
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: Color(0xFF757575),
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
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_model.textController.text != null &&
                      _model.textController.text != '')
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 16.0),
                      child: Text(
                        '#Kết quả hiển thị theo bộ lọc',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontStyle: FontStyle.italic,
                                ),
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Hình ảnh nhân viên',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito Sans',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 24.0),
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child:
                              PagedListView<ApiPagingParams, dynamic>.separated(
                            pagingController: _model.setListViewController1(
                              (nextPageMarker) =>
                                  StaffGroup.getStaffListCall.call(
                                accessToken: FFAppState().accessToken,
                                limit: 20,
                                offset: nextPageMarker.nextPageNumber * 20,
                                sort: 'sort',
                                filter:
                                    '{\"_and\":[{}${_model.textController.text != null && _model.textController.text != '' ? ',{\"user_id\":{\"first_name\":{\"_icontains\":\"${_model.textController.text}\"}}}' : ' '}${widget!.id != null && widget!.id != '' ? ',{\"department_id\":{\"id\":{\"_eq\":\"${widget!.id}\"}}}' : ' '}${',{\"status\":{\"_eq\":\"active\"}}'}]}',
                              ),
                            ),
                            padding: EdgeInsets.zero,
                            primary: false,
                            reverse: false,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (_, __) => SizedBox(width: 8.0),
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
                                child: DataNotFoundRowNewWidget(),
                              ),
                              itemBuilder: (context, _, imagesIndex) {
                                final imagesItem = _model
                                    .listViewPagingController1!
                                    .itemList![imagesIndex];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x34090F13),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.network(
                                              '${FFAppConstants.ApiBaseUrl}/assets/${imagesItem.userId.avatar}?access_token=${FFAppState().accessToken}',
                                              fit: BoxFit.contain,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.png',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            allowRotation: true,
                                            tag:
                                                '${FFAppConstants.ApiBaseUrl}/assets/${imagesItem.userId.avatar}?access_token=${FFAppState().accessToken}',
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag:
                                          '${FFAppConstants.ApiBaseUrl}/assets/${imagesItem.userId.avatar}?access_token=${FFAppState().accessToken}',
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          '${FFAppConstants.ApiBaseUrl}/assets/${imagesItem.userId.avatar}?access_token=${FFAppState().accessToken}',
                                          width: 100.0,
                                          height: 50.0,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Image.asset(
                                            'assets/images/error_image.png',
                                            width: 100.0,
                                            height: 50.0,
                                            fit: BoxFit.cover,
                                          ),
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
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 8.0),
                    child: Text(
                      'Danh sách nhân viên',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito Sans',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: PagedListView<ApiPagingParams, dynamic>(
                        pagingController: _model.setListViewController2(
                          (nextPageMarker) => StaffGroup.getStaffListCall.call(
                            accessToken: FFAppState().accessToken,
                            limit: 20,
                            offset: nextPageMarker.nextPageNumber * 20,
                            sort: 'sort',
                            filter:
                                '{\"_and\":[{}${_model.textController.text != null && _model.textController.text != '' ? ',{\"user_id\":{\"first_name\":{\"_icontains\":\"${_model.textController.text}\"}}}' : ' '}${widget!.id != null && widget!.id != '' ? ',{\"department_id\":{\"id\":{\"_eq\":\"${widget!.id}\"}}}' : ' '}${',{\"status\":{\"_eq\":\"active\"}}'}]}',
                          ),
                        ),
                        padding: EdgeInsets.zero,
                        primary: false,
                        reverse: false,
                        scrollDirection: Axis.vertical,
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
                            child: DataNotFoundWidget(),
                          ),
                          itemBuilder: (context, _, listStaff1Index) {
                            final listStaff1Item = _model
                                .listViewPagingController2!
                                .itemList![listStaff1Index];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'ProfileUserNew',
                                    queryParameters: {
                                      'staffId': serializeParam(
                                        listStaff1Item.id,
                                        ParamType.String,
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
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1.0,
                                        color: Color(0x32000000),
                                        offset: Offset(
                                          0.0,
                                          1.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(26.0),
                                          child: Image.network(
                                            '${FFAppConstants.ApiBaseUrl}/assets/${listStaff1Item.userId.avatar}?access_token=${FFAppState().accessToken}',
                                            width: 36.0,
                                            height: 36.0,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              width: 36.0,
                                              height: 36.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  listStaff1Item
                                                      .userId.firstName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    listStaff1Item.title,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                              'ProfileUserNew',
                                              queryParameters: {
                                                'staffId': serializeParam(
                                                  listStaff1Item.id,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
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
                                          text: 'Xem',
                                          options: FFButtonOptions(
                                            width: 70.0,
                                            height: 36.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
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
