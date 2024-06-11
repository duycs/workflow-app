import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/process_template/domains_search/domains_search_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'process_template_list_model.dart';
export 'process_template_list_model.dart';

class ProcessTemplateListWidget extends StatefulWidget {
  const ProcessTemplateListWidget({super.key});

  @override
  State<ProcessTemplateListWidget> createState() =>
      _ProcessTemplateListWidgetState();
}

class _ProcessTemplateListWidgetState extends State<ProcessTemplateListWidget> {
  late ProcessTemplateListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProcessTemplateListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
      _model.tokenReloadProcessTemplateList =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadProcessTemplateList!) {
        _model.apiResultx0q = await CategoriesGroup.getCategoriesListCall.call(
          accessToken: FFAppState().accessToken,
        );
        if ((_model.apiResultx0q?.succeeded ?? true)) {
          _model.addToCategoriesList(CategoriesListStruct(
            id: '1',
            name: 'Tất cả',
          ));
          setState(() {});
          while (_model.loop <
              CategoriesListDataStruct.maybeFromMap(
                      (_model.apiResultx0q?.jsonBody ?? ''))!
                  .data
                  .length) {
            _model.addToCategoriesList(CategoriesListDataStruct.maybeFromMap(
                    (_model.apiResultx0q?.jsonBody ?? ''))!
                .data[_model.loop]);
            setState(() {});
            _model.loop = _model.loop + 1;
            setState(() {});
          }
          _model.loop = 0;
          setState(() {});
        }
        _model.apiResultlld = await DomainGroup.getDomainsListCall.call(
          accessToken: FFAppState().accessToken,
        );
        if ((_model.apiResultlld?.succeeded ?? true)) {
          _model.addToDomainList(DomainsListStruct(
            id: '1',
            name: 'Tất cả',
          ));
          setState(() {});
          while (_model.loop <
              DomainsListDataStruct.maybeFromMap(
                      (_model.apiResultlld?.jsonBody ?? ''))!
                  .data
                  .length) {
            _model.addToDomainList(DomainsListDataStruct.maybeFromMap(
                    (_model.apiResultlld?.jsonBody ?? ''))!
                .data[_model.loop]);
            setState(() {});
            _model.loop = _model.loop + 1;
            setState(() {});
          }
          _model.loop = 0;
          setState(() {});
        }
        _model.isLoad = true;
        setState(() {});
      } else {
        setState(() {});
        return;
      }
    });

    _model.textNameTextController ??= TextEditingController();
    _model.textNameFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
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
          children: [
            Expanded(
              child: Text(
                'Thư viện quy trình mẫu',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Nunito Sans',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 50.0,
              icon: Icon(
                Icons.margin,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: DomainsSearchWidget(
                        search: _model.domainSearch,
                        callback: (dom) async {
                          _model.domainSearch = dom!.toList().cast<String>();
                          setState(() {});
                          setState(
                              () => _model.gridViewPagingController?.refresh());

                          setState(() {});
                        },
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
            ),
          ],
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: Visibility(
          visible: _model.isLoad == true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _model.textNameTextController,
                        focusNode: _model.textNameFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textNameTextController',
                          const Duration(milliseconds: 500),
                          () async {
                            setState(() {});
                            setState(() =>
                                _model.gridViewPagingController?.refresh());
                          },
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Tìm kiếm...',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
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
                          suffixIcon:
                              _model.textNameTextController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.textNameTextController?.clear();
                                        setState(() {});
                                        setState(() => _model
                                            .gridViewPagingController
                                            ?.refresh());
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                    )
                                  : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              letterSpacing: 0.0,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        validator: _model.textNameTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ],
                ),
              ),
              if ('1' == '3')
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            _model.dropDownValue ??= '1',
                          ),
                          options: List<String>.from(
                              _model.domainList.map((e) => e.id).toList()),
                          optionLabels:
                              _model.domainList.map((e) => e.name).toList(),
                          onChanged: (val) async {
                            setState(() => _model.dropDownValue = val);
                            await _model.callSearchList(context);
                            setState(() {});

                            setState(() {});
                          },
                          width: 300.0,
                          height: 56.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Chọn lĩnh vực ...',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ],
                  ),
                ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                      child: FlutterFlowChoiceChips(
                        options: _model.categoriesList
                            .map((e) => e.name)
                            .toList()
                            .map((label) => ChipData(label))
                            .toList(),
                        onChanged: (val) async {
                          setState(
                              () => _model.choiceChipsValue = val?.firstOrNull);
                          setState(() {});
                          while (_model.loop < _model.categoriesList.length) {
                            if (_model.categoriesList[_model.loop].name ==
                                _model.choiceChipsValue) {
                              _model.categoryId =
                                  _model.categoriesList[_model.loop].id;
                              setState(() {});
                            }
                            _model.loop = _model.loop + 1;
                            setState(() {});
                          }
                          _model.loop = 0;
                          setState(() {});
                          setState(
                              () => _model.gridViewPagingController?.refresh());
                        },
                        selectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                          iconColor: FlutterFlowTheme.of(context).info,
                          iconSize: 14.0,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).noColor,
                          borderWidth: 1.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Nunito Sans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 14.0,
                          elevation: 0.0,
                          borderColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          borderWidth: 1.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        chipSpacing: 8.0,
                        rowSpacing: 12.0,
                        multiselect: false,
                        initialized: _model.choiceChipsValue != null,
                        alignment: WrapAlignment.start,
                        controller: _model.choiceChipsValueController ??=
                            FormFieldController<List<String>>(
                          ['Tất cả'],
                        ),
                        wrapped: true,
                      ),
                    ),
                  ]
                      .addToStart(const SizedBox(width: 16.0))
                      .addToEnd(const SizedBox(width: 16.0)),
                ),
              ),
              if ('${_model.domainSearch.isNotEmpty ? (List<String> strings) {
                      return strings.map((str) => '"$str"').join(',');
                    }(_model.domainSearch.toList()) : ' '}${(_model.categoryId != '') && (_model.categoryId != '1') && (_model.categoryId != ' ') ? _model.categoryId : ' '}${_model.textNameTextController.text != '' ? _model.textNameTextController.text : ' '}' !=
                  '   ')
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 12.0),
                  child: Text(
                    '#Kết quả hiển thị theo bộ lọc',
                    textAlign: TextAlign.start,
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
                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 0.0),
                  child: PagedGridView<ApiPagingParams, dynamic>(
                    pagingController: _model.setGridViewController(
                      (nextPageMarker) =>
                          ProcedureTemplateGroup.workflowsListCall.call(
                        offset: nextPageMarker.nextPageNumber * 20,
                        limit: 20,
                        accessToken: FFAppState().accessToken,
                        filter: '{\"_and\":[{\"status\":{\"_eq\":\"published\"}},{\"template\":{\"_eq\":\"1\"}}${_model.domainSearch.isNotEmpty ? ',{\"domain_id\":{\"_in\":[${(List<String> strings) {
                            return strings.map((str) => '"$str"').join(',');
                          }(_model.domainSearch.toList())}]}}' : ' '}${(_model.categoryId != '') && (_model.categoryId != '1') && (_model.categoryId != ' ') ? ',{\"category_id\":{\"_eq\":\"${_model.categoryId}\"}}' : ' '}${_model.textNameTextController.text != '' ? ',{\"name\":{\"_icontains\":\"${_model.textNameTextController.text}\"}}' : ' '}]}',
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          MediaQuery.sizeOf(context).width < kBreakpointMedium
                              ? 2
                              : 3,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 25.0,
                      childAspectRatio: 1.0,
                    ),
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
                      noItemsFoundIndicatorBuilder: (_) => const Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: DataNotFoundWidget(),
                        ),
                      ),
                      itemBuilder: (context, _, listGridIndex) {
                        final listGridItem = _model
                            .gridViewPagingController!.itemList![listGridIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'ProcessTemplateDetail',
                              queryParameters: {
                                'id': serializeParam(
                                  listGridItem.id,
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
                          child: Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Visibility(
                                        visible: listGridItem.steps.length > 0,
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final listStep =
                                                            listGridItem.steps
                                                                .toList();
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listStep.length,
                                                          itemBuilder: (context,
                                                              listStepIndex) {
                                                            final listStepItem =
                                                                listStep[
                                                                    listStepIndex];
                                                            return Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width: functions.stringToInt((int var1) {
                                                                                return var1 != 0 ? (num.parse((40 / var1.round()).toStringAsFixed(0))).toString() : 0.toString();
                                                                              }(listGridItem.steps.length)) *
                                                                              2,
                                                                          height: functions.stringToInt((int var1) {
                                                                                return var1 != 0 ? (num.parse((40 / var1.round()).toStringAsFixed(0))).toString() : 0.toString();
                                                                              }(listGridItem.steps.length)) *
                                                                              2,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBtnText,
                                                                            boxShadow: const [
                                                                              BoxShadow(
                                                                                blurRadius: 4.0,
                                                                                color: Color(0x6814181B),
                                                                                offset: Offset(
                                                                                  0.0,
                                                                                  2.0,
                                                                                ),
                                                                                spreadRadius: 1.0,
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(100.0),
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).noColor,
                                                                              width: 1.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                (listStepIndex + 1).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      color: () {
                                                                                        if ((int var1) {
                                                                                          return var1 % 5 == 0 ? true : false;
                                                                                        }(listStepIndex)) {
                                                                                          return const Color(0xFF3ABEF9);
                                                                                        } else if ((int var1) {
                                                                                          return var1 % 5 == 1 ? true : false;
                                                                                        }(listStepIndex)) {
                                                                                          return const Color(0xFF26355D);
                                                                                        } else if ((int var1) {
                                                                                          return var1 % 5 == 2 ? true : false;
                                                                                        }(listStepIndex)) {
                                                                                          return const Color(0xFF059212);
                                                                                        } else if ((int var1) {
                                                                                          return var1 % 5 == 3 ? true : false;
                                                                                        }(listStepIndex)) {
                                                                                          return const Color(0xFFFF407D);
                                                                                        } else if ((int var1) {
                                                                                          return var1 % 5 == 4 ? true : false;
                                                                                        }(listStepIndex)) {
                                                                                          return const Color(0xFF7E8EF1);
                                                                                        } else {
                                                                                          return const Color(0x00000000);
                                                                                        }
                                                                                      }(),
                                                                                      fontSize: functions.stringToInt((int var1) {
                                                                                            return var1 != 0 ? (num.parse((14 / var1.round()).toStringAsFixed(0))).toString() : 0.toString();
                                                                                          }(listGridItem.steps.length)) *
                                                                                          2,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: functions.stringToInt((int var1) {
                                                                                    return var1 != 0 ? (num.parse((40 / var1.round()).toStringAsFixed(0))).toString() : 0.toString();
                                                                                  }(listGridItem.steps.length)) *
                                                                                  2,
                                                                              decoration: BoxDecoration(
                                                                                color: () {
                                                                                  if ((int var1) {
                                                                                    return var1 % 5 == 0 ? true : false;
                                                                                  }(listStepIndex)) {
                                                                                    return const Color(0xFF3ABEF9);
                                                                                  } else if ((int var1) {
                                                                                    return var1 % 5 == 1 ? true : false;
                                                                                  }(listStepIndex)) {
                                                                                    return const Color(0xFF26355D);
                                                                                  } else if ((int var1) {
                                                                                    return var1 % 5 == 2 ? true : false;
                                                                                  }(listStepIndex)) {
                                                                                    return const Color(0xFF059212);
                                                                                  } else if ((int var1) {
                                                                                    return var1 % 5 == 3 ? true : false;
                                                                                  }(listStepIndex)) {
                                                                                    return const Color(0xFFFF407D);
                                                                                  } else if ((int var1) {
                                                                                    return var1 % 5 == 4 ? true : false;
                                                                                  }(listStepIndex)) {
                                                                                    return const Color(0xFF7E8EF1);
                                                                                  } else {
                                                                                    return const Color(0x00000000);
                                                                                  }
                                                                                }(),
                                                                                boxShadow: const [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: Color(0x33000000),
                                                                                    offset: Offset(
                                                                                      2.0,
                                                                                      10.0,
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(30.0),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        listStepItem.name != null && listStepItem.name != '' ? listStepItem.name : ' ',
                                                                                        textAlign: TextAlign.start,
                                                                                        maxLines: 2,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Nunito Sans',
                                                                                              color: Colors.white,
                                                                                              fontSize: functions.stringToInt((int var1) {
                                                                                                    return var1 != 0 ? (num.parse((14 / var1.round()).toStringAsFixed(0))).toString() : 0.toString();
                                                                                                  }(listGridItem.steps.length)) *
                                                                                                  2,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
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
                                                                    ],
                                                                  ),
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: ((functions.stringToInt((int var1) {
                                                                                  return var1 != 0 ? (num.parse((40 / var1.round()).toStringAsFixed(0))).toString() : 0.toString();
                                                                                }(listGridItem.steps.length)) /
                                                                                2)
                                                                            .round())
                                                                        .toDouble(),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .noColor,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1.0,
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    listGridItem.name != null &&
                                            listGridItem.name != ''
                                        ? listGridItem.name
                                        : ' '.maybeHandleOverflow(
                                            maxChars: 25,
                                            replacement: '…',
                                          ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
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
                              ],
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
