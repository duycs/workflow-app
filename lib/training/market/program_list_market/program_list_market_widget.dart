import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'program_list_market_model.dart';
export 'program_list_market_model.dart';

class ProgramListMarketWidget extends StatefulWidget {
  const ProgramListMarketWidget({
    super.key,
    String? price,
  }) : price = price ?? '';

  final String price;

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
      await _model.getProgramsList(context);
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
            'Danh sách khóa học',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.searchMarketTextController,
                          focusNode: _model.searchMarketFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.searchMarketTextController',
                            const Duration(milliseconds: 500),
                            () async {
                              await _model.getProgramsList(context);
                              setState(() {});
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
                            suffixIcon: _model
                                    .searchMarketTextController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.searchMarketTextController
                                          ?.clear();
                                      await _model.getProgramsList(context);
                                      setState(() {});
                                      setState(() {});
                                    },
                                    child: const Icon(
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
                      alignment: const AlignmentDirectional(0.0, 0.0),
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
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              if (_model.searchMarketTextController.text != '')
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 4.0),
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
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final itemPrograms = _model.listPrograms.toList();
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: itemPrograms.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                      itemBuilder: (context, itemProgramsIndex) {
                        final itemProgramsItem =
                            itemPrograms[itemProgramsIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'ProgramMarketDetail',
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  '${FFAppConstants.ApiBaseUrl}/assets/${itemProgramsItem.imageCover}?access_token=${FFAppState().accessToken}',
                                  width: 90.0,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await _model.getProgramsList(context);
                                        setState(() {});
                                      },
                                      child: Text(
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
                                    ),
                                    Text(
                                      'Danh mục: ${itemProgramsItem.domainId.name}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
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
                                        if (itemProgramsItem.reacts.isNotEmpty)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 2.0),
                                            child: Icon(
                                              Icons.star,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 18.0,
                                            ),
                                          ),
                                        if (itemProgramsItem.reacts.isNotEmpty)
                                          Text(
                                            itemProgramsItem.reacts.isNotEmpty
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 2.0),
                                                  child: Icon(
                                                    Icons.person,
                                                    color: FlutterFlowTheme.of(
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
                                              ].divide(const SizedBox(width: 4.0)),
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
    );
  }
}
