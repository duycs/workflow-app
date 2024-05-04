import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'list_branch_profile_model.dart';
export 'list_branch_profile_model.dart';

class ListBranchProfileWidget extends StatefulWidget {
  const ListBranchProfileWidget({super.key});

  @override
  State<ListBranchProfileWidget> createState() =>
      _ListBranchProfileWidgetState();
}

class _ListBranchProfileWidgetState extends State<ListBranchProfileWidget> {
  late ListBranchProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListBranchProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.getLinkBranch(context);
      setState(() {});
      await _model.getDepartmentList(context);
      setState(() {});
      setState(() {
        _model.checkData = true;
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            'Danh sách chi nhánh',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Nunito Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (_model.listBranch.isNotEmpty)
                    Text(
                      '(Tổng ${_model.listBranch.length.toString()} chi nhánh)',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Nunito Sans',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              const Duration(milliseconds: 2000),
                              () async {
                                if (_model.textController.text != '') {
                                  setState(() {
                                    _model.search = _model.textController.text;
                                  });
                                  await _model.getLinkBranch(context);
                                  setState(() {});
                                } else {
                                  setState(() {
                                    _model.search = '';
                                  });
                                  await _model.getLinkBranch(context);
                                  setState(() {});
                                }
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
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              prefixIcon: const Icon(
                                Icons.search,
                                size: 24.0,
                              ),
                              suffixIcon: _model.textController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.textController?.clear();
                                        if (_model.textController.text != '') {
                                          setState(() {
                                            _model.search =
                                                _model.textController.text;
                                          });
                                          await _model.getLinkBranch(context);
                                          setState(() {});
                                        } else {
                                          setState(() {
                                            _model.search = '';
                                          });
                                          await _model.getLinkBranch(context);
                                          setState(() {});
                                        }

                                        setState(() {});
                                      },
                                      child: const Icon(
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
                  if (_model.search != '')
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 16.0),
                      child: Text(
                        '#Kết quả hiển thị theo bộ lọc',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  fontStyle: FontStyle.italic,
                                ),
                      ),
                    ),
                  Stack(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final listItem = _model.listBranch.toList();
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listItem.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 10.0),
                              itemBuilder: (context, listItemIndex) {
                                final listItemItem = listItem[listItemIndex];
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        6.0, 0.0, 6.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: ExpandableNotifier(
                                        initialExpanded: false,
                                        child: ExpandablePanel(
                                          header: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                (listItemIndex + 1).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  listItemItem.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                '(${_model.departmentList.where((e) => e.branchId.id == listItemItem.id).toList().length.toString()} bộ phận)',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ].divide(const SizedBox(width: 8.0)),
                                          ),
                                          collapsed: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final listStaff = listItemItem
                                                      .staffs
                                                      .toList();
                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: listStaff.length,
                                                    separatorBuilder: (_, __) =>
                                                        const SizedBox(height: 2.0),
                                                    itemBuilder: (context,
                                                        listStaffIndex) {
                                                      final listStaffItem =
                                                          listStaff[
                                                              listStaffIndex];
                                                      return Visibility(
                                                        visible: listStaffItem
                                                                .title ==
                                                            'Quản lý chi nhánh',
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        10.0,
                                                                        8.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Quản lý: ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  listStaffItem
                                                                              .title ==
                                                                          'Quản lý chi nhánh'
                                                                      ? listStaffItem
                                                                          .userId
                                                                          .firstName
                                                                      : '',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          expanded: Builder(
                                            builder: (context) {
                                              final departmentList1 = _model
                                                  .departmentList
                                                  .where((e) =>
                                                      e.branchId.id ==
                                                      listItemItem.id)
                                                  .toList()
                                                  .map((e) => e)
                                                  .toList();
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                        departmentList1.length,
                                                        (departmentList1Index) {
                                                  final departmentList1Item =
                                                      departmentList1[
                                                          departmentList1Index];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'listStaffProfileCompany',
                                                          queryParameters: {
                                                            'id':
                                                                serializeParam(
                                                              departmentList1Item
                                                                  .id,
                                                              ParamType.String,
                                                            ),
                                                            'nameBranch':
                                                                serializeParam(
                                                              listItemItem.name,
                                                              ParamType.String,
                                                            ),
                                                            'boPhan':
                                                                serializeParam(
                                                              departmentList1Item
                                                                  .name,
                                                              ParamType.String,
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
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                formatNumber(
                                                                  departmentList1Index +
                                                                      1,
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .commaDecimal,
                                                                ),
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
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          16.0,
                                                                          8.0,
                                                                          16.0),
                                                                  child: Text(
                                                                    departmentList1Item
                                                                        .name,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                ' (${departmentList1Item.staffs.length.toString()} nhân viên)',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                width: 4.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                })
                                                    .divide(
                                                        const SizedBox(height: 8.0))
                                                    .addToStart(
                                                        const SizedBox(height: 12.0))
                                                    .addToEnd(
                                                        const SizedBox(height: 12.0)),
                                              );
                                            },
                                          ),
                                          theme: const ExpandableThemeData(
                                            tapHeaderToExpand: true,
                                            tapBodyToExpand: false,
                                            tapBodyToCollapse: false,
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            hasIcon: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      if ((_model.listBranch.isEmpty) &&
                          (_model.departmentList.isEmpty) &&
                          (_model.checkData == true))
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 1.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.database,
                                color: FlutterFlowTheme.of(context).alternate,
                                size: 55.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Text(
                                  'Không có dữ liệu !',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
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
