import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/market/filter_programs/filter_programs_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'program_list_market_model.dart';
export 'program_list_market_model.dart';

class ProgramListMarketWidget extends StatefulWidget {
  const ProgramListMarketWidget({
    super.key,
    String? price,
    String? idAuthor,
    String? idDomain,
    String? domainToProgramListMarket,
  })  : this.price = price ?? '',
        this.idAuthor = idAuthor ?? '',
        this.idDomain = idDomain ?? '',
        this.domainToProgramListMarket = domainToProgramListMarket ?? '';

  final String price;
  final String idAuthor;
  final String idDomain;
  final String domainToProgramListMarket;

  @override
  State<ProgramListMarketWidget> createState() =>
      _ProgramListMarketWidgetState();
}

class _ProgramListMarketWidgetState extends State<ProgramListMarketWidget> {
  late ProgramListMarketModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgramListMarketModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.reloadTokenProgramsList = await action_blocks.tokenReload(context);
      if (_model.reloadTokenProgramsList!) {
        _model.checkLoad = true;
        setState(() {});
      } else {
        setState(() {});
        return;
      }

      await _model.getListDomains(context);
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
              context.safePop();
            },
          ),
          title: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text(widget!.idDomain),
                    content: Text(widget!.idAuthor),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              'Danh sách khóa học',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Nunito Sans',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.searchMarketTextController,
                          focusNode: _model.searchMarketFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.searchMarketTextController',
                            Duration(milliseconds: 500),
                            () async {
                              setState(() =>
                                  _model.listViewPagingController?.refresh());
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
                            hintText: 'Tìm kiếm khóa học...',
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyLarge.override(
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
                            fillColor: Color(0x15FF5963),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
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
                                      _model.searchMarketTextController
                                          ?.clear();
                                      setState(() => _model
                                          .listViewPagingController
                                          ?.refresh());
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22.0,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
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
                                    priceMin: _model.priceMinDomain,
                                    priceMax: _model.priceMaxDomain,
                                    listDomain: _model.listDataDomain
                                        .map((e) => e.name)
                                        .toList(),
                                    checkPrice: widget!.price,
                                    checkPrice1: 'checkPriceList',
                                    priceMin1: _model.priceMin,
                                    priceMax1: _model.priceMax,
                                    checkAuthor: widget!.idAuthor,
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
                                      _model.priceMin = priceMin1!;
                                      _model.priceMax = priceMax1!;
                                      _model.priceMinDomain = priceMin!;
                                      _model.priceMaxDomain = priceMax!;
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
              if ((widget!.price == 'free') || (widget!.price == 'NoFree'))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 4.0),
                  child: Text(
                    () {
                      if (widget!.price == 'free') {
                        return 'Khoá học miễn phí';
                      } else if (widget!.price == 'NoFree') {
                        return 'Khoá học bán chạy';
                      } else {
                        return '';
                      }
                    }(),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
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
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 4.0),
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
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                  child: PagedListView<ApiPagingParams, dynamic>.separated(
                    pagingController: _model.setListViewController(
                      (nextPageMarker) =>
                          GroupMarketLessonGroup.getListMarketLessonCall.call(
                        accessToken: FFAppState().accessToken,
                        limit: 20,
                        offset: nextPageMarker.nextPageNumber * 20,
                        filter: '{\"_and\":[{\"template\":{\"_eq\":\"1\"}}${() {
                          if (widget!.price == 'free') {
                            return ',{\"price\":{\"_eq\":\"0\"}}';
                          } else if (((widget!.price == 'NoFree') &&
                                  (_model.priceMin == null ||
                                      _model.priceMin == '')) ||
                              ((widget!.price == 'NoFree') &&
                                  (_model.priceMin == 'noData'))) {
                            return ',{\"price\":{\"_gt\":\"0\"}}';
                          } else {
                            return ' ';
                          }
                        }()}${_model.searchMarketTextController.text != null && _model.searchMarketTextController.text != '' ? ',{\"name\":{\"_icontains\":\"' : ' '}${_model.searchMarketTextController.text != null && _model.searchMarketTextController.text != '' ? _model.searchMarketTextController.text : ' '}${_model.searchMarketTextController.text != null && _model.searchMarketTextController.text != '' ? '\"}}' : ' '}${widget!.domainToProgramListMarket != null && widget!.domainToProgramListMarket != '' ? ',{\"domain_id\":{\"name\":{\"_icontains\":\"' : ' '}${widget!.domainToProgramListMarket != null && widget!.domainToProgramListMarket != '' ? widget!.domainToProgramListMarket : ' '}${widget!.domainToProgramListMarket != null && widget!.domainToProgramListMarket != '' ? '\"}}}' : ' '}${(_model.domain != null && _model.domain != '') && (_model.domain != 'noData') ? ',{\"domain_id\":{\"name\":{\"_icontains\":\"' : ' '}${(_model.domain != null && _model.domain != '') && (_model.domain != 'noData') ? _model.domain : ' '}${(_model.domain != null && _model.domain != '') && (_model.domain != 'noData') ? '\"}}}' : ' '}${(_model.author != null && _model.author != '') && (_model.author != 'noData') ? ',{\"author_id\":{\"alias\":{\"_icontains\":\"' : ' '}${(_model.author != null && _model.author != '') && (_model.author != 'noData') ? _model.author : ' '}${(_model.author != null && _model.author != '') && (_model.author != 'noData') ? '\"}}}' : ' '}${(_model.category != null && _model.category != '') && (_model.category != 'noData') ? ',{\"category_id\":{\"name\":{\"_icontains\":\"' : ' '}${(_model.category != null && _model.category != '') && (_model.category != 'noData') ? _model.category : ' '}${(_model.category != null && _model.category != '') && (_model.category != 'noData') ? '\"}}}' : ' '}${(_model.priceMinDomain != null && _model.priceMinDomain != '') && (_model.priceMinDomain != 'noData') && (widget!.price == 'free1') ? ',{\"price\":{\"_gte\":\"' : ' '}${(_model.priceMinDomain != null && _model.priceMinDomain != '') && (_model.priceMinDomain != 'noData') && (widget!.price == 'free1') ? _model.priceMinDomain : ' '}${(_model.priceMinDomain != null && _model.priceMinDomain != '') && (_model.priceMinDomain != 'noData') && (widget!.price == 'free1') ? '\"}}' : ' '}${(_model.priceMaxDomain != null && _model.priceMaxDomain != '') && (_model.priceMaxDomain != 'noData') && (widget!.price == 'free1') ? ',{\"price\":{\"_lte\":\"' : ' '}${(_model.priceMaxDomain != null && _model.priceMaxDomain != '') && (_model.priceMaxDomain != 'noData') && (widget!.price == 'free1') ? _model.priceMaxDomain : ' '}${(_model.priceMaxDomain != null && _model.priceMaxDomain != '') && (_model.priceMaxDomain != 'noData') && (widget!.price == 'free1') ? '\"}}' : ' '}${(_model.priceMin != null && _model.priceMin != '') && (_model.priceMin != 'noData') && (widget!.price != 'free1') ? ',{\"price\":{\"_gte\":\"' : ' '}${(_model.priceMin != null && _model.priceMin != '') && (_model.priceMin != 'noData') && (widget!.price != 'free1') ? _model.priceMin : ' '}${(_model.priceMin != null && _model.priceMin != '') && (_model.priceMin != 'noData') && (widget!.price != 'free1') ? '\"}}' : ' '}${(_model.priceMax != null && _model.priceMax != '') && (_model.priceMax != 'noData') && (widget!.price != 'free1') ? ',{\"price\":{\"_lte\":\"' : ' '}${(_model.priceMax != null && _model.priceMax != '') && (_model.priceMax != 'noData') && (widget!.price != 'free1') ? _model.priceMax : ' '}${(_model.priceMax != null && _model.priceMax != '') && (_model.priceMax != 'noData') && (widget!.price != 'free1') ? '\"}}' : ' '}${(widget!.idAuthor != null && widget!.idAuthor != '') && (widget!.idDomain != null && widget!.idDomain != '') ? ',{\"author_id\":{\"id\":{\"_eq\":\"${widget!.idAuthor}\"}}},{\"domain_id\":{\"id\":{\"_eq\":\"${widget!.idDomain}\"}}}' : ' '}]}',
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (_, __) => SizedBox(height: 8.0),
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
                      noItemsFoundIndicatorBuilder: (_) => DataNotFoundWidget(),
                      itemBuilder: (context, _, itemProgramsIndex) {
                        final itemProgramsItem = _model
                            .listViewPagingController!
                            .itemList![itemProgramsIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
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
                                    itemProgramsItem.id,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      '${FFAppConstants.ApiBaseUrl}/assets/${itemProgramsItem.imageCover}?access_token=${FFAppState().accessToken}',
                                      width: 90.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                      alignment: Alignment(0.0, 0.0),
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        'assets/images/error_image.png',
                                        width: 90.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                        alignment: Alignment(0.0, 0.0),
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
                                        itemProgramsItem.name,
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
                                        itemProgramsItem.authorId.alias,
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
                                        '${itemProgramsItem.lessions.length.toString()} bài học',
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
                                        'Lĩnh vực: ${itemProgramsItem.domainId.name}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          if (itemProgramsItem.reacts.length >
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
                                          if (itemProgramsItem.reacts.length >
                                              0)
                                            Text(
                                              itemProgramsItem.reacts.length > 0
                                                  ? formatNumber(
                                                      (List<String> listItem) {
                                                        return listItem
                                                                .map(int.parse)
                                                                .reduce((value,
                                                                        element) =>
                                                                    value +
                                                                    element) /
                                                            listItem.length;
                                                      }(itemProgramsItem.reacts
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
                                                    '${itemProgramsItem.orderCount.toString()} lượt mua',
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
    );
  }
}
