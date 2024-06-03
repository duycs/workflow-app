import '/backend/api_requests/api_calls.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/order/invite_user/invite_user_widget.dart';
import '/training/study_program/filter_study_program_market/filter_study_program_market_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'study_program_list_market_model.dart';
export 'study_program_list_market_model.dart';

class StudyProgramListMarketWidget extends StatefulWidget {
  const StudyProgramListMarketWidget({
    super.key,
    required this.checkpage,
  });

  final String? checkpage;

  @override
  State<StudyProgramListMarketWidget> createState() =>
      _StudyProgramListMarketWidgetState();
}

class _StudyProgramListMarketWidgetState
    extends State<StudyProgramListMarketWidget> {
  late StudyProgramListMarketModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudyProgramListMarketModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tokenReloadStudyProgramList =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadStudyProgramList!) {
        setState(() {
          _model.isShow = true;
        });
      } else {
        FFAppState().update(() {});
        return;
      }
    });

    _model.textFieldNameSearchTextController ??= TextEditingController();
    _model.textFieldNameSearchFocusNode ??= FocusNode();
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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Chương trình đã mua',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Nunito Sans',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: true,
          elevation: 1.0,
        ),
        body: Visibility(
          visible: _model.isShow == true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _model.textFieldNameSearchTextController,
                          focusNode: _model.textFieldNameSearchFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textFieldNameSearchTextController',
                            const Duration(milliseconds: 500),
                            () async {
                              setState(() {
                                _model.nameSearch = _model
                                    .textFieldNameSearchTextController.text;
                                _model.isLoad = false;
                                _model.dataList = [];
                              });
                              setState(() =>
                                  _model.listViewPagingController1?.refresh());
                              setState(() {});
                            },
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Tìm kiếm tên chương trình',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
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
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            prefixIcon: const Icon(
                              Icons.search_sharp,
                            ),
                            suffixIcon: _model
                                    .textFieldNameSearchTextController!
                                    .text
                                    .isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.textFieldNameSearchTextController
                                          ?.clear();
                                      setState(() {
                                        _model.nameSearch = _model
                                            .textFieldNameSearchTextController
                                            .text;
                                        _model.isLoad = false;
                                        _model.dataList = [];
                                      });
                                      setState(() => _model
                                          .listViewPagingController1
                                          ?.refresh());
                                      setState(() {});
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 16.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          validator: _model
                              .textFieldNameSearchTextControllerValidator
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
                                  child: WebViewAware(
                                    child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: FilterStudyProgramMarketWidget(
                                        name: _model.nameSearch!,
                                        lessionsName:
                                            _model.lessionsNameSearch!,
                                        dateStart: _model.dateStartSearch!,
                                        dateEnd: _model.dateEndSearch!,
                                        callBack: (name, dateStart, dateEnd,
                                            lessions) async {
                                          setState(() {
                                            _model
                                                .textFieldNameSearchTextController
                                                ?.clear();
                                          });
                                          setState(() {
                                            _model.nameSearch = name;
                                            _model.dateEndSearch = dateEnd;
                                            _model.dateStartSearch = dateStart;
                                            _model.lessionsNameSearch =
                                                lessions;
                                          });
                                          setState(() => _model
                                              .listViewPagingController1
                                              ?.refresh());
                                          setState(() {
                                            _model
                                                .textFieldNameSearchTextController
                                                ?.text = name!;
                                          });
                                          setState(() {});
                                        },
                                      ),
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
                if ('${(_model.nameSearch != null && _model.nameSearch != '') && (_model.nameSearch != ' ') ? ',{\"name\":{\"_icontains\":\"${_model.nameSearch}\"}}' : ' '}${(_model.lessionsNameSearch != null && _model.lessionsNameSearch != '') && (_model.lessionsNameSearch != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"name\":{\"_icontains\":\"${_model.lessionsNameSearch}\"}}}}' : ' '}${(_model.dateStartSearch != null && _model.dateStartSearch != '') && (_model.dateStartSearch != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"date_created\":{\"_gte\":\"${_model.dateStartSearch}\"}}}}' : ' '}${(_model.dateEndSearch != null && _model.dateEndSearch != '') && (_model.dateEndSearch != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"date_created\":{\"_lte\":\"${_model.dateEndSearch}\"}}}}' : ' '}' !=
                    '    ')
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
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
                  ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: PagedListView<ApiPagingParams, dynamic>.separated(
                      pagingController: _model.setListViewController1(
                        (nextPageMarker) =>
                            StudyProgramGroup.studyProgramListCall.call(
                          accessToken: FFAppState().accessToken,
                          offset: nextPageMarker.nextPageNumber * 20,
                          limit: 20,
                          filter: '{\"_and\":[{}${(_model.nameSearch != null && _model.nameSearch != '') && (_model.nameSearch != ' ') ? ',{\"name\":{\"_icontains\":\"${_model.nameSearch}\"}}' : ' '}${(_model.lessionsNameSearch != null && _model.lessionsNameSearch != '') && (_model.lessionsNameSearch != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"name\":{\"_icontains\":\"${_model.lessionsNameSearch}\"}}}}' : ' '}${(_model.dateStartSearch != null && _model.dateStartSearch != '') && (_model.dateStartSearch != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"date_created\":{\"_gte\":\"${_model.dateStartSearch}\"}}}}' : ' '}${(_model.dateEndSearch != null && _model.dateEndSearch != '') && (_model.dateEndSearch != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"date_created\":{\"_lte\":\"${(String var1) {
                              return DateTime.parse(var1)
                                  .add(const Duration(days: 1))
                                  .toString();
                            }(_model.dateEndSearch!)}\"}}}}' : ' '}${',{\"organization_id\":{\"_eq\":\"${getJsonField(
                            FFAppState().staffLogin,
                            r'''$.organization_id''',
                          ).toString()}\"}}'}${',{\"template\":{\"_eq\":\"0\"}}'},{\"copyright_organization_id\":{\"_nnull\":true}}${() {
                            if ((widget.checkpage != null &&
                                    widget.checkpage != '') &&
                                (widget.checkpage == 'private1')) {
                              return ',{\"private\":{\"_eq\":1}}';
                            } else if ((widget.checkpage != null &&
                                    widget.checkpage != '') &&
                                (widget.checkpage == 'private0')) {
                              return ',{\"private\":{\"_eq\":0}}';
                            } else {
                              return ' ';
                            }
                          }()}]}',
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (_, __) => const SizedBox(height: 10.0),
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
                        noItemsFoundIndicatorBuilder: (_) => const Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: DataNotFoundWidget(),
                          ),
                        ),
                        itemBuilder: (context, _, dataListViewIndex) {
                          final dataListViewItem = _model
                              .listViewPagingController1!
                              .itemList![dataListViewIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 4.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: (_model.checkShow != null &&
                                                  _model.checkShow != '') &&
                                              (_model.checkShow ==
                                                  dataListViewItem.id)
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 2.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 12.0, 5.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  '${FFAppConstants.ApiBaseUrl}/assets/${dataListViewItem.imageCover != null && dataListViewItem.imageCover != '' ? dataListViewItem.imageCover : ' '}?access_token=${FFAppState().accessToken}',
                                                  width: 80.0,
                                                  height: 80.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: const BoxDecoration(),
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
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Text(
                                                              '#${(dataListViewIndex + 1).toString()} : ${dataListViewItem.name != null && dataListViewItem.name != '' ? dataListViewItem.name : ' '}',
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
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
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (_model
                                                                      .checkShow ==
                                                                  dataListViewItem
                                                                      .id) {
                                                                setState(() {
                                                                  _model.checkShow =
                                                                      null;
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  _model.checkShow =
                                                                      dataListViewItem
                                                                          .id;
                                                                });
                                                              }
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  (_model.checkShow != null &&
                                                                              _model.checkShow !=
                                                                                  '') &&
                                                                          (dataListViewItem.id ==
                                                                              _model.checkShow)
                                                                      ? 'Thu nhỏ'
                                                                      : 'Xem thêm',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                if ((_model.checkShow !=
                                                                            null &&
                                                                        _model.checkShow !=
                                                                            '') &&
                                                                    (dataListViewItem
                                                                            .id ==
                                                                        _model
                                                                            .checkShow))
                                                                  Icon(
                                                                    Icons
                                                                        .keyboard_arrow_up,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 14.0,
                                                                  ),
                                                                if (dataListViewItem
                                                                        .id !=
                                                                    _model
                                                                        .checkShow)
                                                                  Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 14.0,
                                                                  ),
                                                              ].divide(const SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 8.0)),
                                                    ),
                                                    Text(
                                                      '${'${valueOrDefault<String>(
                                                        dataListViewItem
                                                            .lessions.length
                                                            .toString(),
                                                        '0',
                                                      )} bài học'} - ${'${valueOrDefault<String>(
                                                        dataListViewItem
                                                            .tests.length
                                                            .toString(),
                                                        '0',
                                                      )} bài thi'}',
                                                      maxLines: 2,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
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
                                                        children: [
                                                          Text(
                                                            'Số lượng: ${formatNumber(
                                                              dataListViewItem
                                                                  .limitInvite,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .commaDecimal,
                                                            )}',
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
                                                                ),
                                                          ),
                                                          Text(
                                                            'Đã chia sẻ: ${dataListViewItem.private == 1 ? valueOrDefault<String>(
                                                                formatNumber(
                                                                  dataListViewItem
                                                                          .inviteCount -
                                                                      1,
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .commaDecimal,
                                                                ),
                                                                '0',
                                                              ) : formatNumber(
                                                                dataListViewItem
                                                                    .inviteCount,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .commaDecimal,
                                                              )}',
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
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        if (dataListViewItem
                                                                .inviteCount <
                                                            dataListViewItem
                                                                .limitInvite)
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            InviteUserWidget(
                                                                          programId:
                                                                              dataListViewItem.id,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                            text: 'Chia sẻ',
                                                            icon: const Icon(
                                                              Icons.ios_share,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 32.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
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
                                                                  .primary,
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
                                                                            FontWeight.normal,
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
                                                                          6.0),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                if (dataListViewItem.id == _model.checkShow)
                                  Builder(
                                    builder: (context) {
                                      final dataListTestsView =
                                          dataListViewItem.tests.toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: dataListTestsView.length,
                                        itemBuilder:
                                            (context, dataListTestsViewIndex) {
                                          final dataListTestsViewItem =
                                              dataListTestsView[
                                                  dataListTestsViewIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 12.0, 4.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'TestDetail',
                                                  queryParameters: {
                                                    'id': serializeParam(
                                                      dataListTestsViewItem
                                                          .testsId.id,
                                                      ParamType.String,
                                                    ),
                                                    'name': serializeParam(
                                                      dataListTestsViewItem
                                                          .testsId.name,
                                                      ParamType.String,
                                                    ),
                                                    'description':
                                                        serializeParam(
                                                      dataListTestsViewItem
                                                          .testsId.description,
                                                      ParamType.String,
                                                    ),
                                                    'time': serializeParam(
                                                      dataListTestsViewItem
                                                          .testsId
                                                          .durationMinutes
                                                          .toString(),
                                                      ParamType.String,
                                                    ),
                                                    'checkScroll':
                                                        serializeParam(
                                                      'StudyProgramList',
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
                                                  padding: const EdgeInsets.all(6.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        flex: 7,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              dataListTestsViewItem
                                                                              .testsId
                                                                              .name !=
                                                                          null &&
                                                                      dataListTestsViewItem
                                                                              .testsId
                                                                              .name !=
                                                                          ''
                                                                  ? dataListTestsViewItem
                                                                      .testsId
                                                                      .name
                                                                  : ' '
                                                                      .maybeHandleOverflow(
                                                                      maxChars:
                                                                          30,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Text(
                                                              dataListTestsViewItem
                                                                              .testsId
                                                                              .dateCreated !=
                                                                          null &&
                                                                      dataListTestsViewItem
                                                                              .testsId
                                                                              .dateCreated !=
                                                                          ''
                                                                  ? valueOrDefault<
                                                                      String>(
                                                                      dateTimeFormat(
                                                                        'dd-MM-yyyy',
                                                                        functions
                                                                            .stringToDateTime(valueOrDefault<String>(
                                                                          dataListTestsViewItem
                                                                              .testsId
                                                                              .dateCreated,
                                                                          '0',
                                                                        )),
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      '0',
                                                                    )
                                                                  : ' ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 4.0)),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                              'TestDetail',
                                                              queryParameters: {
                                                                'id':
                                                                    serializeParam(
                                                                  dataListTestsViewItem
                                                                      .testsId
                                                                      .id,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'name':
                                                                    serializeParam(
                                                                  dataListTestsViewItem
                                                                      .testsId
                                                                      .name,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'description':
                                                                    serializeParam(
                                                                  dataListTestsViewItem
                                                                      .testsId
                                                                      .description,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'time':
                                                                    serializeParam(
                                                                  dataListTestsViewItem
                                                                      .testsId
                                                                      .durationMinutes
                                                                      .toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'checkScroll':
                                                                    serializeParam(
                                                                  'StudyProgramList',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    const TransitionInfo(
                                                                  hasTransition:
                                                                      true,
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
                                                          text: 'Bài thi',
                                                          options:
                                                              FFButtonOptions(
                                                            height: 30.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
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
                                                                .error,
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
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
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
                                                      Expanded(
                                                        flex: 1,
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_right,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                              'TestDetail',
                                                              queryParameters: {
                                                                'id':
                                                                    serializeParam(
                                                                  dataListTestsViewItem
                                                                      .testsId
                                                                      .id,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'name':
                                                                    serializeParam(
                                                                  dataListTestsViewItem
                                                                      .testsId
                                                                      .name,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'description':
                                                                    serializeParam(
                                                                  dataListTestsViewItem
                                                                      .testsId
                                                                      .description,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'time':
                                                                    serializeParam(
                                                                  dataListTestsViewItem
                                                                      .testsId
                                                                      .durationMinutes
                                                                      .toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'checkScroll':
                                                                    serializeParam(
                                                                  'StudyProgramList',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    const TransitionInfo(
                                                                  hasTransition:
                                                                      true,
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
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                if (dataListViewItem.id == _model.checkShow)
                                  Builder(
                                    builder: (context) {
                                      final dataListLessionsView =
                                          dataListViewItem.lessions.toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: dataListLessionsView.length,
                                        itemBuilder: (context,
                                            dataListLessionsViewIndex) {
                                          final dataListLessionsViewItem =
                                              dataListLessionsView[
                                                  dataListLessionsViewIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 12.0, 4.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'LessonDetail',
                                                  queryParameters: {
                                                    'idLesson': serializeParam(
                                                      dataListLessionsViewItem
                                                          .lessionsId.id,
                                                      ParamType.String,
                                                    ),
                                                    'checkSrcoll':
                                                        serializeParam(
                                                      'StudyProgramList',
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
                                                  padding: const EdgeInsets.all(6.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          width: 30.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        90.0),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              '${FFAppConstants.ApiBaseUrl}/assets/${dataListLessionsViewItem.lessionsId.imageCover != null && dataListLessionsViewItem.lessionsId.imageCover != '' ? dataListLessionsViewItem.lessionsId.imageCover : ' '}?access_token=${FFAppState().accessToken}',
                                                              width: 300.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 9,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    dataListLessionsViewItem.lessionsId.name !=
                                                                                null &&
                                                                            dataListLessionsViewItem.lessionsId.name !=
                                                                                ''
                                                                        ? dataListLessionsViewItem
                                                                            .lessionsId
                                                                            .name
                                                                        : ' '
                                                                            .maybeHandleOverflow(
                                                                            maxChars:
                                                                                25,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    dataListLessionsViewItem.lessionsId.dateCreated !=
                                                                                null &&
                                                                            dataListLessionsViewItem.lessionsId.dateCreated !=
                                                                                ''
                                                                        ? valueOrDefault<
                                                                            String>(
                                                                            dateTimeFormat(
                                                                              'dd-MM-yyyy',
                                                                              functions.stringToDateTime(valueOrDefault<String>(
                                                                                dataListLessionsViewItem.lessionsId.dateCreated,
                                                                                '0',
                                                                              )),
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            '0',
                                                                          )
                                                                        : ' ',
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'LessonDetail',
                                                                    queryParameters:
                                                                        {
                                                                      'idLesson':
                                                                          serializeParam(
                                                                        dataListLessionsViewItem
                                                                            .lessionsId
                                                                            .id,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'checkSrcoll':
                                                                          serializeParam(
                                                                        'StudyProgramList',
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                text: 'Bài học',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
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
                                                      Expanded(
                                                        flex: 1,
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_right,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                              'LessonDetail',
                                                              queryParameters: {
                                                                'idLesson':
                                                                    serializeParam(
                                                                  dataListLessionsViewItem
                                                                      .lessionsId
                                                                      .id,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'checkSrcoll':
                                                                    serializeParam(
                                                                  'StudyProgramList',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                              ],
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
    );
  }
}
