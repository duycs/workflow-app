import '/components/rating_staf_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/training/market/filter_programs/filter_programs_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
      await _model.getProgramsMarketFree(context);
      setState(() {});
      await _model.getProgramsMarketNoFree(context);
      setState(() {});
      await _model.getDomains(context);
      setState(() {});
      await _model.getListAuthors(context);
      setState(() {});
      await _model.getProgramsMarketAll(context);
      setState(() {});
    });

    _model.searchMarketTextController ??= TextEditingController();
    _model.searchMarketFocusNode ??= FocusNode();
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
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
                                'Halo, ${FFAppState().user.firstName}!',
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
                                'Khám phá tri thức, mở cửa tương lai!',
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
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            '${FFAppConstants.ApiBaseUrl}/assets/${FFAppState().user.avatar}?access_token=${FFAppState().accessToken}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.searchMarketTextController,
                        focusNode: _model.searchMarketFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.searchMarketTextController',
                          const Duration(milliseconds: 500),
                          () async {
                            await _model.getProgramsMarketFree(context);
                            setState(() {});
                            await _model.getProgramsMarketNoFree(context);
                            setState(() {});
                            await _model.getProgramsMarketAll(context);
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
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
                          fillColor: const Color(0x15FF5963),
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 8.0, 0.0, 8.0),
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
                                    await _model
                                        .getProgramsMarketNoFree(context);
                                    setState(() {});
                                    await _model.getProgramsMarketAll(context);
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
                  if (_model.listDataProgramsFree.isNotEmpty)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 8.0, 3.0),
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
                                  kTransitionInfoKey: const TransitionInfo(
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
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 20.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  if ((_model.listDataProgramsFree.isNotEmpty) &&
                      (_model.searchMarketTextController.text != ''))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 5.0),
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
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 140.0,
                        decoration: const BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final listProgramsFree =
                                _model.listDataProgramsFree.toList();
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: listProgramsFree.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 24.0),
                              itemBuilder: (context, listProgramsFreeIndex) {
                                final listProgramsFreeItem =
                                    listProgramsFree[listProgramsFreeIndex];
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
                                          listProgramsFreeItem.id,
                                          ParamType.String,
                                        ),
                                        'price': serializeParam(
                                          listProgramsFreeItem.price,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
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
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 180.0,
                                          height: 180.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .noColor,
                                                FlutterFlowTheme.of(context)
                                                    .primaryText
                                              ],
                                              stops: const [0.0, 1.0],
                                              begin: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: const AlignmentDirectional(0, 1.0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 4.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                listProgramsFreeItem.name,
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                listProgramsFreeItem
                                                    .authorId.alias,
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                          fontStyle:
                                                              FontStyle.italic,
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
                            );
                          },
                        ),
                      ),
                    ),
                  if (_model.listDataProgramsNoFree.isNotEmpty)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 8.0, 3.0),
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
                                  kTransitionInfoKey: const TransitionInfo(
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
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 20.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  if ((_model.searchMarketTextController.text != '') &&
                      (_model.listDataProgramsNoFree.isNotEmpty))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 5.0),
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
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 220.0,
                        decoration: const BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final listProgramsNoFree =
                                _model.listDataProgramsNoFree.toList();
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: listProgramsNoFree.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 24.0),
                              itemBuilder: (context, listProgramsNoFreeIndex) {
                                final listProgramsNoFreeItem =
                                    listProgramsNoFree[listProgramsNoFreeIndex];
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
                                          listProgramsNoFreeItem.id,
                                          ParamType.String,
                                        ),
                                        'price': serializeParam(
                                          listProgramsNoFreeItem.price,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 150.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 90.0,
                                                decoration: const BoxDecoration(),
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      '${FFAppConstants.ApiBaseUrl}/assets/${listProgramsNoFreeItem.imageCover}?access_token=${FFAppState().accessToken}',
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 4.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          listProgramsNoFreeItem.authorId.alias,
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                        RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: formatNumber(
                                                  functions.stringToInt(
                                                      listProgramsNoFreeItem
                                                          .price),
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.commaDecimal,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                              ),
                                              const TextSpan(
                                                text: 'đ',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                              const TextSpan(
                                                text: ' ',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                              TextSpan(
                                                text: formatNumber(
                                                  double.tryParse((double.parse(
                                                              listProgramsNoFreeItem
                                                                  .price) /
                                                          0.7)
                                                      .toStringAsFixed(0)),
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.commaDecimal,
                                                ),
                                                style: const TextStyle(
                                                  color: Color(0xFFFF0000),
                                                  fontSize: 11.0,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                              const TextSpan(
                                                text: 'đ',
                                                style: TextStyle(
                                                  color: Color(0xFFFF0000),
                                                  fontSize: 11.0,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: double.infinity,
                                            height: 20.0,
                                            decoration: const BoxDecoration(),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  if (listProgramsNoFreeItem
                                                          .reacts.isNotEmpty)
                                                    Expanded(
                                                      flex: 5,
                                                      child: RatingStafWidget(
                                                        key: Key(
                                                            'Keyi65_${listProgramsNoFreeIndex}_of_${listProgramsNoFree.length}'),
                                                        list:
                                                            listProgramsNoFreeItem
                                                                .reacts,
                                                      ),
                                                    ),
                                                  if (listProgramsNoFreeItem
                                                          .reacts.isEmpty)
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        '',
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
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
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  if (_model.listDataDomains.isNotEmpty)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 8.0, 4.0),
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
                              context.pushNamed(
                                'CategoryMarket',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
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
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
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
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                            color: const Color(0x8E1D2428),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(3.0, 3.0, 3.0, 3.0),
                                              child: Container(
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.06,
                                                decoration: const BoxDecoration(),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    '${FFAppConstants.ApiBaseUrl}/assets/${itemDomainsItem.imageCover}?access_token=${FFAppState().accessToken}',
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        3.0, 0.0, 3.0, 3.0),
                                                child: Text(
                                                  itemDomainsItem.name,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                  if (_model.listDataAuthors.isNotEmpty)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 8.0, 4.0),
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
                              context.pushNamed(
                                'AuthorList',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
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
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
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
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: 100.0,
                        height: 135.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Builder(
                          builder: (context) {
                            final listAuthors = _model.listDataAuthors.toList();
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: listAuthors.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 24.0),
                              itemBuilder: (context, listAuthorsIndex) {
                                final listAuthorsItem =
                                    listAuthors[listAuthorsIndex];
                                return InkWell(
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
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  child: Stack(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    children: [
                                      Opacity(
                                        opacity: 0.5,
                                        child: Container(
                                          width: 130.0,
                                          height: 70.0,
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(8.0),
                                            ),
                                            border: Border.all(
                                              color: const Color(0x7D57636C),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Container(
                                                width: 80.0,
                                                height: 80.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  '${FFAppConstants.ApiBaseUrl}/assets/${listAuthorsItem.avatar}?access_token=${FFAppState().accessToken}',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              listAuthorsItem.alias,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            Text(
                                              listAuthorsItem
                                                  .domains.first.domainsId.name,
                                              maxLines: 2,
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
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 10.0, 0.0),
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Builder(
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
                                      alignment: const AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: FilterProgramsWidget(
                                          domain: _model.domain,
                                          author: _model.author,
                                          category: _model.category,
                                          priceMin: _model.priceMin,
                                          priceMax: _model.priceMax,
                                          listDomain: _model.listDataDomains
                                              .map((e) => e.name)
                                              .toList(),
                                          checkPrice: '',
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
                                            await _model
                                                .getProgramsMarketAll(context);
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if ((_model.searchMarketTextController.text != '') ||
                      ((_model.domain != '') &&
                          (_model.domain != 'noData')) ||
                      ((_model.author != '') &&
                          (_model.author != 'noData')) ||
                      ((_model.category != '') &&
                          (_model.category != 'noData')) ||
                      ((_model.priceMin != '') &&
                          (_model.priceMin != 'noData')) ||
                      ((_model.priceMax != '') &&
                          (_model.priceMax != 'noData')))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 5.0),
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
                  if (_model.listDataProgramsAll.isNotEmpty)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final itemProgramListAll =
                              _model.listDataProgramsAll.toList();
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: itemProgramListAll.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                            itemBuilder: (context, itemProgramListAllIndex) {
                              final itemProgramListAllItem =
                                  itemProgramListAll[itemProgramListAllIndex];
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
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 90.0,
                                        height: 100.0,
                                        decoration: const BoxDecoration(),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            '${FFAppConstants.ApiBaseUrl}/assets/${itemProgramListAllItem.imageCover}?access_token=${FFAppState().accessToken}',
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
                                            CrossAxisAlignment.start,
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
                                            itemProgramListAllItem
                                                .authorId.alias,
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              if (itemProgramListAllItem
                                                      .reacts.isNotEmpty)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 2.0),
                                                  child: Icon(
                                                    Icons.star,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 18.0,
                                                  ),
                                                ),
                                              if (itemProgramListAllItem
                                                      .reacts.isNotEmpty)
                                                Text(
                                                  itemProgramListAllItem
                                                              .reacts.isNotEmpty
                                                      ? formatNumber(
                                                          (List<String>
                                                              listItem) {
                                                            return listItem
                                                                    .map(int
                                                                        .parse)
                                                                    .reduce((value,
                                                                            element) =>
                                                                        value +
                                                                        element) /
                                                                listItem.length;
                                                          }(itemProgramListAllItem
                                                              .reacts
                                                              .map((e) => e
                                                                  .reactsId
                                                                  .status)
                                                              .toList()),
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .commaDecimal,
                                                        )
                                                      : '0',
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
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 16.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    2.0),
                                                        child: Icon(
                                                          Icons.person,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 16.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${itemProgramListAllItem.orderCount.toString()} lượt mua',
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
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
                                                    ].divide(
                                                        const SizedBox(width: 4.0)),
                                                  ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 4.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 12.0)),
                                ),
                              );
                            },
                          );
                        },
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
