import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'author_list_model.dart';
export 'author_list_model.dart';

class AuthorListWidget extends StatefulWidget {
  const AuthorListWidget({super.key});

  @override
  State<AuthorListWidget> createState() => _AuthorListWidgetState();
}

class _AuthorListWidgetState extends State<AuthorListWidget>
    with TickerProviderStateMixin {
  late AuthorListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthorListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checkTokentAuthor = await action_blocks.tokenReload(context);
      if (_model.checkTokentAuthor!) {
        await _model.getListAuthorsSort(context);
        setState(() {});
      } else {
        setState(() {});
      }

      _model.isShow = true;
      setState(() {});
    });

    _model.searchAuthorsTextController ??= TextEditingController();
    _model.searchAuthorsFocusNode ??= FocusNode();

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
              context.safePop();
            },
          ),
          title: Text(
            'Danh sách tác giả',
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
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.searchAuthorsTextController,
                        focusNode: _model.searchAuthorsFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.searchAuthorsTextController',
                          Duration(milliseconds: 500),
                          () async {
                            await _model.getListAuthorsSort(context);
                            setState(() {});
                            await _model.getListAuthors(context);
                            setState(() {});
                          },
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Tìm kiếm...',
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Nunito Sans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                          fillColor: Color(0x15FF5963),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 8.0, 0.0, 8.0),
                          prefixIcon: Icon(
                            Icons.search,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          suffixIcon: _model
                                  .searchAuthorsTextController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.searchAuthorsTextController?.clear();
                                    await _model.getListAuthorsSort(context);
                                    setState(() {});
                                    await _model.getListAuthors(context);
                                    setState(() {});
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 22.0,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                        maxLines: null,
                        validator: _model.searchAuthorsTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  if (_model.searchAuthorsTextController.text != null &&
                      _model.searchAuthorsTextController.text != '')
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 3.0),
                      child: Text(
                        '#Kết quả tìm kiếm theo bộ lọc',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 8.0),
                    child: Text(
                      'Tác giả nổi tiếng',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito Sans',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  if (_model.listDataAuthorsSort.isNotEmpty)
                    Builder(
                      builder: (context) {
                        final itemAuthorsSort =
                            _model.listDataAuthorsSort.toList();

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(itemAuthorsSort.length,
                                    (itemAuthorsSortIndex) {
                              final itemAuthorsSortItem =
                                  itemAuthorsSort[itemAuthorsSortIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'AuthorMarketProfile',
                                      queryParameters: {
                                        'itemAuthors': serializeParam(
                                          itemAuthorsSortItem,
                                          ParamType.DataStruct,
                                        ),
                                        'checkBackPage': serializeParam(
                                          'listAuthor',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              width: 2.0,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                              child: Image.network(
                                                '${FFAppConstants.ApiBaseUrl}/assets/${itemAuthorsSortItem.avatar}?access_token=${FFAppState().accessToken}',
                                                width: 60.0,
                                                height: 60.0,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          itemAuthorsSortItem.alias,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        itemAuthorsSortItem
                                            .domains.first.domainsId.name,
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                ),
                              );
                            })
                                .divide(SizedBox(width: 12.0))
                                .addToEnd(SizedBox(width: 16.0)),
                          ),
                        );
                      },
                    ),
                  Stack(
                    children: [
                      if (!(_model.listDataAuthorsSort.isNotEmpty))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 4.0),
                          child: Container(
                            width: double.infinity,
                            height: 140.0,
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Visibility(
                              visible: _model.isShow == true,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.database,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 30.0,
                                    ),
                                  ),
                                  Text(
                                    'Không có dữ liệu !',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if ((_model.isShow == false) &&
                          !(_model.listDataAuthorsSort.isNotEmpty))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 4.0),
                          child: Container(
                            width: double.infinity,
                            height: 140.0,
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: custom_widgets.LoadingPageWidget(
                                width: double.infinity,
                                height: double.infinity,
                                size: 50.0,
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Text(
                      'Tất cả tác giả',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito Sans',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  if (_model.isShow == true)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                      child: PagedListView<ApiPagingParams, dynamic>(
                        pagingController: _model.setListViewController(
                          (nextPageMarker) =>
                              GroupAuthorsGroup.listAuthorsCall.call(
                            accessToken: FFAppState().accessToken,
                            limit: 20,
                            offset: nextPageMarker.nextPageNumber * 20,
                            filter:
                                '{\"_and\":[${_model.searchAuthorsTextController.text != null && _model.searchAuthorsTextController.text != '' ? '{\"alias\":{\"_icontains\":\"' : ' '}${_model.searchAuthorsTextController.text != null && _model.searchAuthorsTextController.text != '' ? _model.searchAuthorsTextController.text : ' '}${_model.searchAuthorsTextController.text != null && _model.searchAuthorsTextController.text != '' ? '\"}}' : ' '}]}',
                          ),
                        ),
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
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
                          noItemsFoundIndicatorBuilder: (_) =>
                              DataNotFoundWidget(),
                          itemBuilder: (context, _, itemListAuthorsIndex) {
                            final itemListAuthorsItem = _model
                                .listViewPagingController!
                                .itemList![itemListAuthorsIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 1.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'AuthorMarketProfile',
                                    queryParameters: {
                                      'itemAuthors': serializeParam(
                                        itemListAuthorsItem,
                                        ParamType.DataStruct,
                                      ),
                                      'checkBackPage': serializeParam(
                                        'listAuthor',
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
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        offset: Offset(
                                          0.0,
                                          1.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                              child: Image.network(
                                                '${FFAppConstants.ApiBaseUrl}/assets/${itemListAuthorsItem.avatar}?access_token=${FFAppState().accessToken}',
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  itemListAuthorsItem.alias,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  '${formatNumber(
                                                    itemListAuthorsItem
                                                        .orderCount,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType: DecimalType
                                                        .commaDecimal,
                                                  )} lượt bán',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
