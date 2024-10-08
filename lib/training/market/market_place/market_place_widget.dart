import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/chip_custom_widget.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/components/rating_staf_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/market/filter_programs/filter_programs_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'market_place_model.dart';
export 'market_place_model.dart';

class MarketPlaceWidget extends StatefulWidget {
  const MarketPlaceWidget({super.key});

  @override
  State<MarketPlaceWidget> createState() => _MarketPlaceWidgetState();
}

class _MarketPlaceWidgetState extends State<MarketPlaceWidget> {
  late MarketPlaceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketPlaceModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.reloadTokenProgramLession =
          await action_blocks.tokenReload(context);
      if (_model.reloadTokenProgramLession!) {
        setState(() {});
        await _model.getProgramsMarketFree(context);
        setState(() {});
        await _model.getProgramsMarketNoFree(context);
        setState(() {});
        await _model.getDomains(context);
        setState(() {});
        await _model.getListAuthors(context);
        setState(() {});
        _model.checkLoad = true;
        setState(() {});
      } else {
        setState(() {});
        return;
      }

      _model.checkLoad = true;
      setState(() {});
    });

    _model.searchMarketTextController ??= TextEditingController();
    _model.searchMarketFocusNode ??= FocusNode();

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
              context.pop();
            },
          ),
          title: Text(
            'Thế giới tri thức',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Nunito Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if ('1' == '2')
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
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
                      Text(
                        'Thế giới tri thức',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Nunito Sans',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Xin chào, ${FFAppState().user.firstName}!',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              'Cùng khám phá tri thức',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          '${FFAppConstants.ApiBaseUrl}/assets/${FFAppState().user.avatar}?access_token=${FFAppState().accessToken}',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/error_image.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.searchMarketTextController,
                      focusNode: _model.searchMarketFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.searchMarketTextController',
                        Duration(milliseconds: 500),
                        () async {
                          await _model.getProgramsMarketFree(context);
                          setState(() {});
                          await _model.getProgramsMarketNoFree(context);
                          setState(() {});
                          setState(
                              () => _model.listViewPagingController?.refresh());

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
                        hintText: 'Tìm kiếm khóa học...',
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyLarge
                            .override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 0.0, 8.0),
                        prefixIcon: Icon(
                          Icons.search,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        suffixIcon: _model
                                .searchMarketTextController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.searchMarketTextController?.clear();
                                  await _model.getProgramsMarketFree(context);
                                  setState(() {});
                                  await _model.getProgramsMarketNoFree(context);
                                  setState(() {});
                                  setState(() => _model.listViewPagingController
                                      ?.refresh());

                                  setState(() {});
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 18.0,
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
                      validator: _model.searchMarketTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 8.0, 3.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Khóa học miễn phí',
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Nunito Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.checkColor = '1';
                          setState(() {});
                          await Future.delayed(
                              const Duration(milliseconds: 10));
                          _model.checkColor = '';
                          setState(() {});

                          context.pushNamed(
                            'ProgramListMarket',
                            queryParameters: {
                              'price': serializeParam(
                                'free',
                                ParamType.String,
                              ),
                              'idAuthor': serializeParam(
                                '',
                                ParamType.String,
                              ),
                              'idDomain': serializeParam(
                                '',
                                ParamType.String,
                              ),
                              'domainToProgramListMarket': serializeParam(
                                '',
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
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Xem thêm',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: _model.checkColor == '1'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: _model.checkColor == '1'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if ((_model.listDataProgramsFree.length > 0) &&
                    (_model.searchMarketTextController.text != null &&
                        _model.searchMarketTextController.text != ''))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 5.0),
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
                if (_model.listDataProgramsFree.isNotEmpty)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 140.0,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                final listProgramsFree =
                                    _model.listDataProgramsFree.toList();

                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children:
                                      List.generate(listProgramsFree.length,
                                          (listProgramsFreeIndex) {
                                    final listProgramsFreeItem =
                                        listProgramsFree[listProgramsFreeIndex];
                                    return Visibility(
                                      visible: listProgramsFreeIndex != 10,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'ProgramMarketDetail',
                                            queryParameters: {
                                              'idProgram': serializeParam(
                                                listProgramsFreeItem.id,
                                                ParamType.String,
                                              ),
                                              'price': serializeParam(
                                                listProgramsFreeItem.price,
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
                                        child: Container(
                                          width: 150.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                '${FFAppConstants.ApiBaseUrl}/assets/${listProgramsFreeItem.imageCover}?access_token=${FFAppState().accessToken}',
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 180.0,
                                                height: 180.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .noColor,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 4.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      listProgramsFreeItem.name,
                                                      maxLines: 2,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Tác giả: ${listProgramsFreeItem.authorId.alias}',
                                                      maxLines: 2,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).divide(
                                    SizedBox(width: 24.0),
                                    filterFn: (listProgramsFreeIndex) {
                                      final listProgramsFreeItem =
                                          listProgramsFree[
                                              listProgramsFreeIndex];
                                      return listProgramsFreeIndex != 10;
                                    },
                                  ),
                                );
                              },
                            ),
                            if (_model.listDataProgramsFree.length == 11)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.checkColor = '2';
                                  setState(() {});
                                  await Future.delayed(
                                      const Duration(milliseconds: 10));
                                  _model.checkColor = '';
                                  setState(() {});

                                  context.pushNamed(
                                    'ProgramListMarket',
                                    queryParameters: {
                                      'price': serializeParam(
                                        'free',
                                        ParamType.String,
                                      ),
                                      'idAuthor': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'idDomain': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'domainToProgramListMarket':
                                          serializeParam(
                                        '',
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
                                  width: 150.0,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Xem tất cả',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color: _model.checkColor == '2'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Icon(
                                        Icons.arrow_right,
                                        color: _model.checkColor == '2'
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        size: 24.0,
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
                Stack(
                  children: [
                    if (!(_model.listDataProgramsFree.isNotEmpty))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                        child: Container(
                          width: double.infinity,
                          height: 140.0,
                          decoration: BoxDecoration(),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Visibility(
                            visible: _model.checkLoad == true,
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
                    if ((_model.checkLoad == false) &&
                        !(_model.listDataProgramsFree.isNotEmpty))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
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
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 8.0, 3.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Khóa học bán chạy',
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Nunito Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.checkColor = '3';
                          setState(() {});
                          await Future.delayed(
                              const Duration(milliseconds: 10));
                          _model.checkColor = '';
                          setState(() {});

                          context.pushNamed(
                            'ProgramListMarket',
                            queryParameters: {
                              'price': serializeParam(
                                'NoFree',
                                ParamType.String,
                              ),
                              'idAuthor': serializeParam(
                                '',
                                ParamType.String,
                              ),
                              'idDomain': serializeParam(
                                '',
                                ParamType.String,
                              ),
                              'domainToProgramListMarket': serializeParam(
                                '',
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
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Xem thêm',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: _model.checkColor == '3'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: _model.checkColor == '3'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if ((_model.searchMarketTextController.text != null &&
                        _model.searchMarketTextController.text != '') &&
                    (_model.listDataProgramsNoFree.length > 0))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 5.0),
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
                if (_model.listDataProgramsNoFree.isNotEmpty)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 220.0,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                final listProgramsNoFree =
                                    _model.listDataProgramsNoFree.toList();

                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children:
                                      List.generate(listProgramsNoFree.length,
                                          (listProgramsNoFreeIndex) {
                                    final listProgramsNoFreeItem =
                                        listProgramsNoFree[
                                            listProgramsNoFreeIndex];
                                    return Visibility(
                                      visible: listProgramsNoFreeIndex != 10,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'ProgramMarketDetail',
                                            queryParameters: {
                                              'idProgram': serializeParam(
                                                listProgramsNoFreeItem.id,
                                                ParamType.String,
                                              ),
                                              'price': serializeParam(
                                                listProgramsNoFreeItem.price,
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
                                        child: Container(
                                          width: 150.0,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 90.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            '${FFAppConstants.ApiBaseUrl}/assets/${listProgramsNoFreeItem.imageCover}?access_token=${FFAppState().accessToken}',
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.png',
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 4.0,
                                                                0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/ti_xung.png',
                                                        width: 35.0,
                                                        height: 30.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                listProgramsNoFreeItem.name,
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Text(
                                                'Tác giả: ${listProgramsNoFreeItem.authorId.alias}',
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 6.0, 0.0, 6.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      '${formatNumber(
                                                        functions.stringToInt(
                                                            listProgramsNoFreeItem
                                                                .price),
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .commaDecimal,
                                                      )} đ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (false)
                                                Expanded(
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 20.0,
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (listProgramsNoFreeItem
                                                                  .reacts
                                                                  .length >
                                                              0)
                                                            Expanded(
                                                              flex: 5,
                                                              child:
                                                                  RatingStafWidget(
                                                                key: Key(
                                                                    'Keyi65_${listProgramsNoFreeIndex}_of_${listProgramsNoFree.length}'),
                                                                list:
                                                                    listProgramsNoFreeItem
                                                                        .reacts,
                                                              ),
                                                            ),
                                                          if (listProgramsNoFreeItem
                                                                  .reacts
                                                                  .length <=
                                                              0)
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                '',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          Expanded(
                                                            flex: 5,
                                                            child: Text(
                                                              '(${listProgramsNoFreeItem.orderCount.toString()})',
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).divide(
                                    SizedBox(width: 24.0),
                                    filterFn: (listProgramsNoFreeIndex) {
                                      final listProgramsNoFreeItem =
                                          listProgramsNoFree[
                                              listProgramsNoFreeIndex];
                                      return listProgramsNoFreeIndex != 10;
                                    },
                                  ),
                                );
                              },
                            ),
                            if (_model.listDataProgramsNoFree.length == 11)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.checkColor = '4';
                                  setState(() {});
                                  await Future.delayed(
                                      const Duration(milliseconds: 10));
                                  _model.checkColor = '';
                                  setState(() {});

                                  context.pushNamed(
                                    'ProgramListMarket',
                                    queryParameters: {
                                      'price': serializeParam(
                                        'NoFree',
                                        ParamType.String,
                                      ),
                                      'idAuthor': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'idDomain': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'domainToProgramListMarket':
                                          serializeParam(
                                        '',
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
                                  width: 150.0,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Xem tất cả',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color: _model.checkColor == '4'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Icon(
                                        Icons.arrow_right,
                                        color: _model.checkColor == '4'
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        size: 24.0,
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
                Stack(
                  children: [
                    if (!(_model.listDataProgramsNoFree.isNotEmpty))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                        child: Container(
                          width: double.infinity,
                          height: 140.0,
                          decoration: BoxDecoration(),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Visibility(
                            visible: _model.checkLoad == true,
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
                    if ((_model.checkLoad == false) &&
                        !(_model.listDataProgramsNoFree.isNotEmpty))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
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
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 8.0, 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Lĩnh vực',
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Nunito Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.checkColor = '5';
                          setState(() {});
                          await Future.delayed(
                              const Duration(milliseconds: 10));
                          _model.checkColor = '';
                          setState(() {});

                          context.pushNamed(
                            'CategoryMarket',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Xem thêm',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: _model.checkColor == '5'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: _model.checkColor == '5'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (_model.listDataDomains.isNotEmpty)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/b52f81d2476b16bfce25838d0f33ba1c.jpg',
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x8E1D2428),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Builder(
                            builder: (context) {
                              final itemDomains =
                                  _model.listDataDomains.toList();

                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      MediaQuery.sizeOf(context).width <
                                              kBreakpointMedium
                                          ? 4
                                          : 8,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 1.0,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: itemDomains.length,
                                itemBuilder: (context, itemDomainsIndex) {
                                  final itemDomainsItem =
                                      itemDomains[itemDomainsIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'ProgramListMarket',
                                        queryParameters: {
                                          'price': serializeParam(
                                            'free1',
                                            ParamType.String,
                                          ),
                                          'idAuthor': serializeParam(
                                            '',
                                            ParamType.String,
                                          ),
                                          'idDomain': serializeParam(
                                            '',
                                            ParamType.String,
                                          ),
                                          'domainToProgramListMarket':
                                              serializeParam(
                                            itemDomainsItem.name,
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
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    3.0, 3.0, 3.0, 3.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.06,
                                              decoration: BoxDecoration(),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  '${FFAppConstants.ApiBaseUrl}/assets/${itemDomainsItem.imageCover}?access_token=${FFAppState().accessToken}',
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
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(3.0, 0.0, 3.0, 3.0),
                                              child: Text(
                                                itemDomainsItem.name,
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                Stack(
                  children: [
                    if (!(_model.listDataDomains.isNotEmpty))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                        child: Container(
                          width: double.infinity,
                          height: 140.0,
                          decoration: BoxDecoration(),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Visibility(
                            visible: _model.checkLoad == true,
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
                    if ((_model.checkLoad == false) &&
                        !(_model.listDataDomains.isNotEmpty))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
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
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 8.0, 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Tác giả nổi tiếng',
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Nunito Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.checkColor = '6';
                          setState(() {});
                          await Future.delayed(
                              const Duration(milliseconds: 10));
                          _model.checkColor = '';
                          setState(() {});

                          context.pushNamed(
                            'AuthorList',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Xem thêm',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: _model.checkColor == '6'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: _model.checkColor == '6'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (_model.listDataAuthors.isNotEmpty)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 135.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                final listAuthors =
                                    _model.listDataAuthors.toList();

                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(listAuthors.length,
                                      (listAuthorsIndex) {
                                    final listAuthorsItem =
                                        listAuthors[listAuthorsIndex];
                                    return Visibility(
                                      visible: listAuthorsIndex != 10,
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
                                                listAuthorsItem,
                                                ParamType.DataStruct,
                                              ),
                                              'checkBackPage': serializeParam(
                                                'HomeListMarket',
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
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          children: [
                                            Opacity(
                                              opacity: 0.5,
                                              child: Container(
                                                width: 130.0,
                                                height: 70.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(8.0),
                                                    topRight:
                                                        Radius.circular(8.0),
                                                  ),
                                                  border: Border.all(
                                                    color: Color(0x7D57636C),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(6.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Container(
                                                      width: 80.0,
                                                      height: 80.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        '${FFAppConstants.ApiBaseUrl}/assets/${listAuthorsItem.avatar}?access_token=${FFAppState().accessToken}',
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    listAuthorsItem.alias,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Text(
                                                    listAuthorsItem.domains
                                                        .first.domainsId.name,
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).divide(
                                    SizedBox(width: 24.0),
                                    filterFn: (listAuthorsIndex) {
                                      final listAuthorsItem =
                                          listAuthors[listAuthorsIndex];
                                      return listAuthorsIndex != 10;
                                    },
                                  ),
                                );
                              },
                            ),
                            if (_model.listDataAuthors.length == 11)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.checkColor = '7';
                                  setState(() {});
                                  await Future.delayed(
                                      const Duration(milliseconds: 10));
                                  _model.checkColor = '';
                                  setState(() {});

                                  context.pushNamed(
                                    'AuthorList',
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
                                  width: 110.0,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Xem thêm',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color: _model.checkColor == '7'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Icon(
                                        Icons.arrow_right,
                                        color: _model.checkColor == '7'
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        size: 20.0,
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
                Stack(
                  children: [
                    if (!(_model.listDataAuthors.isNotEmpty))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                        child: Container(
                          width: double.infinity,
                          height: 140.0,
                          decoration: BoxDecoration(),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Visibility(
                            visible: _model.checkLoad == true,
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
                    if ((_model.checkLoad == false) &&
                        !(_model.listDataAuthors.isNotEmpty))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
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
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Có thể bạn quan tâm',
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Nunito Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
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
                                    child: FilterProgramsWidget(
                                      domain: _model.domain,
                                      author: _model.author,
                                      category: _model.category,
                                      priceMin: _model.priceMin,
                                      priceMax: _model.priceMax,
                                      listDomain: _model.listDataDomains
                                          .map((e) => e.name)
                                          .toList(),
                                      checkPrice: 'checkPriceListList',
                                      checkPrice1: 'checkPriceListList',
                                      priceMin1: '',
                                      priceMax1: '',
                                      checkAuthor: '',
                                      callBack: (domain,
                                          author,
                                          category,
                                          priceMin,
                                          priceMax,
                                          priceMin1,
                                          priceMax1) async {
                                        _model.domain = domain!;
                                        _model.author = author!;
                                        _model.category = category!;
                                        _model.priceMin = priceMin!;
                                        _model.priceMax = priceMax!;
                                        setState(() {});
                                        setState(() => _model
                                            .listViewPagingController
                                            ?.refresh());

                                        setState(() {});
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
                if ((_model.searchMarketTextController.text != null &&
                        _model.searchMarketTextController.text != '') ||
                    ((_model.domain != null && _model.domain != '') &&
                        (_model.domain != 'noData')) ||
                    ((_model.author != null && _model.author != '') &&
                        (_model.author != 'noData')) ||
                    ((_model.category != null && _model.category != '') &&
                        (_model.category != 'noData')) ||
                    ((_model.priceMin != null && _model.priceMin != '') &&
                        (_model.priceMin != 'noData')) ||
                    ((_model.priceMax != null && _model.priceMax != '') &&
                        (_model.priceMax != 'noData')))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 5.0),
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
                if (_model.checkLoad == true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: PagedListView<ApiPagingParams, dynamic>.separated(
                      pagingController: _model.setListViewController(
                        (nextPageMarker) =>
                            GroupMarketLessonGroup.getListMarketLessonCall.call(
                          accessToken: FFAppState().accessToken,
                          limit: 20,
                          offset: nextPageMarker.nextPageNumber * 20,
                          filter:
                              '{\"_and\":[{\"template\":{\"_eq\":\"1\"}}${_model.searchMarketTextController.text != null && _model.searchMarketTextController.text != '' ? ',{\"name\":{\"_icontains\":\"' : ' '}${_model.searchMarketTextController.text != null && _model.searchMarketTextController.text != '' ? _model.searchMarketTextController.text : ' '}${_model.searchMarketTextController.text != null && _model.searchMarketTextController.text != '' ? '\"}}' : ' '}${(_model.domain != null && _model.domain != '') && (_model.domain != 'noData') ? ',{\"domain_id\":{\"name\":{\"_icontains\":\"' : ' '}${(_model.domain != null && _model.domain != '') && (_model.domain != 'noData') ? _model.domain : ' '}${(_model.domain != null && _model.domain != '') && (_model.domain != 'noData') ? '\"}}}' : ' '}${(_model.author != null && _model.author != '') && (_model.author != 'noData') ? ',{\"author_id\":{\"alias\":{\"_icontains\":\"' : ' '}${(_model.author != null && _model.author != '') && (_model.author != 'noData') ? _model.author : ' '}${(_model.author != null && _model.author != '') && (_model.author != 'noData') ? '\"}}}' : ' '}${(_model.category != null && _model.category != '') && (_model.category != 'noData') ? ',{\"category_id\":{\"name\":{\"_icontains\":\"' : ' '}${(_model.category != null && _model.category != '') && (_model.category != 'noData') ? _model.category : ' '}${(_model.category != null && _model.category != '') && (_model.category != 'noData') ? '\"}}}' : ' '}${(_model.priceMin != null && _model.priceMin != '') && (_model.priceMin != 'noData') ? ',{\"price\":{\"_gte\":\"' : ' '}${(_model.priceMin != null && _model.priceMin != '') && (_model.priceMin != 'noData') ? _model.priceMin : ' '}${(_model.priceMin != null && _model.priceMin != '') && (_model.priceMin != 'noData') ? '\"}}' : ' '}${(_model.priceMax != null && _model.priceMax != '') && (_model.priceMax != 'noData') ? ',{\"price\":{\"_lte\":\"' : ' '}${(_model.priceMax != null && _model.priceMax != '') && (_model.priceMax != 'noData') ? _model.priceMax : ' '}${(_model.priceMax != null && _model.priceMax != '') && (_model.priceMax != 'noData') ? '\"}}' : ' '}]}',
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (_, __) => SizedBox(height: 16.0),
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
                        itemBuilder: (context, _, itemProgramListAllIndex) {
                          final itemProgramListAllItem = _model
                              .listViewPagingController!
                              .itemList![itemProgramListAllIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'ProgramMarketDetail',
                                queryParameters: {
                                  'idProgram': serializeParam(
                                    itemProgramListAllItem.id,
                                    ParamType.String,
                                  ),
                                  'price': serializeParam(
                                    itemProgramListAllItem.price,
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
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 90.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      '${FFAppConstants.ApiBaseUrl}/assets/${itemProgramListAllItem.imageCover}?access_token=${FFAppState().accessToken}',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        'assets/images/error_image.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        itemProgramListAllItem.name,
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Text(
                                        'Tác giả: ${itemProgramListAllItem.authorId.alias}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                      Text(
                                        '${itemProgramListAllItem.lessions.length.toString()} bài học',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 6.0, 0.0, 6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (functions.stringToInt(
                                                    itemProgramListAllItem
                                                        .price) ==
                                                0)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: ChipCustomWidget(
                                                  key: Key(
                                                      'Key6ow_${itemProgramListAllIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .green,
                                                  text: 'Miễn phí',
                                                ),
                                              ),
                                            if (functions.stringToInt(
                                                    itemProgramListAllItem
                                                        .price) >
                                                0)
                                              Text(
                                                '${formatNumber(
                                                  functions.stringToInt(
                                                      itemProgramListAllItem
                                                          .price),
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.commaDecimal,
                                                )} đ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          if (itemProgramListAllItem
                                                  .reacts.length >
                                              0)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 2.0),
                                              child: Icon(
                                                Icons.star,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                size: 18.0,
                                              ),
                                            ),
                                          if (itemProgramListAllItem
                                                  .reacts.length >
                                              0)
                                            Text(
                                              itemProgramListAllItem
                                                          .reacts.length >
                                                      0
                                                  ? formatNumber(
                                                      (List<String> listItem) {
                                                        return listItem
                                                                .map(int.parse)
                                                                .reduce((value,
                                                                        element) =>
                                                                    value +
                                                                    element) /
                                                            listItem.length;
                                                      }(itemProgramListAllItem
                                                          .reacts
                                                          .map((e) =>
                                                              e.reactsId.status)
                                                          .toList()),
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .commaDecimal,
                                                    )
                                                  : '0',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 2.0),
                                                    child: Icon(
                                                      Icons.person,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 16.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${itemProgramListAllItem.orderCount.toString()} lượt mua',
                                                    textAlign: TextAlign.end,
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
                                                ].divide(SizedBox(width: 4.0)),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 4.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
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
