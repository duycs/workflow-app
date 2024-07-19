import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/lesson/filter_lesson_home_page/filter_lesson_home_page_widget.dart';
import '/training/lesson/no_data/no_data_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'lesson_lists_homepage_model.dart';
export 'lesson_lists_homepage_model.dart';

class LessonListsHomepageWidget extends StatefulWidget {
  const LessonListsHomepageWidget({super.key});

  @override
  State<LessonListsHomepageWidget> createState() =>
      _LessonListsHomepageWidgetState();
}

class _LessonListsHomepageWidgetState extends State<LessonListsHomepageWidget> {
  late LessonListsHomepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonListsHomepageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tokenReloadLessonListsHomepageList =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadLessonListsHomepageList!) {
        setState(() {});
      } else {
        setState(() {});
        return;
      }

      if ((FFAppState().staffid != null && FFAppState().staffid != '') &&
          (FFAppState().staffid != '${null}')) {
        await _model.getListLessonRow(context);
        setState(() {});
        await _model.getListLessonRow2(context);
        setState(() {});
        await _model.getListLessonRow3(context);
        setState(() {});
        await _model.getListLesson(context);
        setState(() {});
      }
      _model.isLoad = true;
      setState(() {});
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.nameSearchTextController ??= TextEditingController();
    _model.nameSearchFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
          title: Text(
            'Tài liệu đào tạo',
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
        body: Stack(
          children: [
            SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.nameSearchTextController,
                        focusNode: _model.nameSearchFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.nameSearchTextController',
                          Duration(milliseconds: 500),
                          () async {
                            await _model.getListLessonRow(context);
                            setState(() {});
                            await _model.getListLessonRow2(context);
                            setState(() {});
                            await _model.getListLessonRow3(context);
                            setState(() {});
                            setState(() =>
                                _model.listViewPagingController?.refresh());
                          },
                        ),
                        autofocus: false,
                        textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.search,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Tìm kiếm...',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
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
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 24.0,
                          ),
                          suffixIcon: _model
                                  .nameSearchTextController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.nameSearchTextController?.clear();
                                    await _model.getListLessonRow(context);
                                    setState(() {});
                                    await _model.getListLessonRow2(context);
                                    setState(() {});
                                    await _model.getListLessonRow3(context);
                                    setState(() {});
                                    setState(() => _model
                                        .listViewPagingController
                                        ?.refresh());
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
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              letterSpacing: 0.0,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        validator: _model.nameSearchTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 5.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Bài học chưa học',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            if (_model.listLessonRow.isNotEmpty)
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
                                    'LessonList_Homepage',
                                    queryParameters: {
                                      'statusLove': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'lessonNewCreate': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'statusLesson': serializeParam(
                                        'draft',
                                        ParamType.String,
                                      ),
                                      'lesonHistory': serializeParam(
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
                                            color: _model.checkColor == '5'
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
                                      color: _model.checkColor == '5'
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      if ((_model.nameSearchTextController.text != null &&
                              _model.nameSearchTextController.text != '') &&
                          (FFAppState().staffid != null &&
                              FFAppState().staffid != '') &&
                          (_model.metaRow!.filterCount > 0))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 2.0, 16.0, 0.0),
                          child: Text(
                            '#Kết quả tìm kiếm theo bộ lọc',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ),
                      if (_model.listLessonRow.isNotEmpty)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 4.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: Builder(
                                      builder: (context) {
                                        final listRow1 =
                                            _model.listLessonRow.toList();

                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: List.generate(
                                              listRow1.length, (listRow1Index) {
                                            final listRow1Item =
                                                listRow1[listRow1Index];
                                            return Visibility(
                                              visible: listRow1Index != 10,
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'LessonDetail_HomePage',
                                                    queryParameters: {
                                                      'listItems':
                                                          serializeParam(
                                                        listRow1Item.lessionId
                                                            .toMap(),
                                                        ParamType.JSON,
                                                      ),
                                                      'status': serializeParam(
                                                        listRow1Item.status,
                                                        ParamType.String,
                                                      ),
                                                      'id': serializeParam(
                                                        listRow1Item.id,
                                                        ParamType.String,
                                                      ),
                                                      'programId':
                                                          serializeParam(
                                                        listRow1Item
                                                            .programId.id,
                                                        ParamType.String,
                                                      ),
                                                      'checkReload':
                                                          serializeParam(
                                                        'Home',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
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
                                                  width: 125.0,
                                                  height: 148.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(6.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 65.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              '${FFAppConstants.ApiBaseUrl}/assets/${listRow1Item.lessionId.imageCover}?access_token=${FFAppState().accessToken}',
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
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
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            listRow1Item
                                                                .lessionId.name,
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 2,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      2.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: Text(
                                                            () {
                                                              if ((listRow1Item.dateStart != null && listRow1Item.dateStart != '') &&
                                                                  (listRow1Item.lessionId.estimateInDay !=
                                                                      0) &&
                                                                  (listRow1Item.programId.estimateInDay !=
                                                                      0)) {
                                                                return () {
                                                                  if ((String item1,
                                                                          int item2,
                                                                          String
                                                                              item3,
                                                                          int
                                                                              item4) {
                                                                    return (DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3).add(Duration(days: item4))))
                                                                            .inDays >=
                                                                        0;
                                                                  }(
                                                                      listRow1Item
                                                                          .dateCreated,
                                                                      listRow1Item
                                                                          .programId
                                                                          .estimateInDay,
                                                                      listRow1Item
                                                                          .dateStart,
                                                                      listRow1Item
                                                                          .lessionId
                                                                          .estimateInDay)) {
                                                                    return () {
                                                                      if ((String item1,
                                                                              int
                                                                                  item2,
                                                                              String
                                                                                  item3) {
                                                                        return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays >
                                                                            0;
                                                                      }(
                                                                          listRow1Item
                                                                              .dateStart,
                                                                          listRow1Item
                                                                              .lessionId
                                                                              .estimateInDay,
                                                                          dateTimeFormat(
                                                                            'yyyy-MM-dd',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))) {
                                                                        return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                          return DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3))
                                                                              .inDays
                                                                              .toString();
                                                                        }(listRow1Item.dateStart, listRow1Item.lessionId.estimateInDay, dateTimeFormat(
                                                                              'yyyy-MM-dd',
                                                                              getCurrentTimestamp,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ))} ngày';
                                                                      } else if ((String item1,
                                                                              int
                                                                                  item2,
                                                                              String
                                                                                  item3) {
                                                                        return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <=
                                                                            0;
                                                                      }(
                                                                          listRow1Item
                                                                              .dateStart,
                                                                          listRow1Item
                                                                              .lessionId
                                                                              .estimateInDay,
                                                                          dateTimeFormat(
                                                                            'yyyy-MM-dd',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))) {
                                                                        return 'Hết hạn';
                                                                      } else {
                                                                        return null!;
                                                                      }
                                                                    }();
                                                                  } else if ((String
                                                                              item1,
                                                                          int item2,
                                                                          String
                                                                              item3,
                                                                          int
                                                                              item4) {
                                                                    return (DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3).add(Duration(days: item4))))
                                                                            .inDays <
                                                                        0;
                                                                  }(
                                                                      listRow1Item
                                                                          .dateCreated,
                                                                      listRow1Item
                                                                          .programId
                                                                          .estimateInDay,
                                                                      listRow1Item
                                                                          .dateStart,
                                                                      listRow1Item
                                                                          .lessionId
                                                                          .estimateInDay)) {
                                                                    return () {
                                                                      if ((String item1,
                                                                              int
                                                                                  item2,
                                                                              String
                                                                                  item3) {
                                                                        return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays >
                                                                            0;
                                                                      }(
                                                                          listRow1Item
                                                                              .dateCreated,
                                                                          listRow1Item
                                                                              .programId
                                                                              .estimateInDay,
                                                                          dateTimeFormat(
                                                                            'yyyy-MM-dd',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))) {
                                                                        return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                          return DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3))
                                                                              .inDays
                                                                              .toString();
                                                                        }(listRow1Item.dateCreated, listRow1Item.programId.estimateInDay, dateTimeFormat(
                                                                              'yyyy-MM-dd',
                                                                              getCurrentTimestamp,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ))} ngày';
                                                                      } else if ((String item1,
                                                                              int
                                                                                  item2,
                                                                              String
                                                                                  item3) {
                                                                        return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <=
                                                                            0;
                                                                      }(
                                                                          listRow1Item
                                                                              .dateCreated,
                                                                          listRow1Item
                                                                              .programId
                                                                              .estimateInDay,
                                                                          dateTimeFormat(
                                                                            'yyyy-MM-dd',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))) {
                                                                        return 'Hết hạn';
                                                                      } else {
                                                                        return null!;
                                                                      }
                                                                    }();
                                                                  } else {
                                                                    return null!;
                                                                  }
                                                                }();
                                                              } else if ((listRow1Item.dateStart != null && listRow1Item.dateStart != '') &&
                                                                  (listRow1Item.lessionId.estimateInDay !=
                                                                      0) &&
                                                                  (listRow1Item.programId.estimateInDay ==
                                                                      0)) {
                                                                return () {
                                                                  if ((String item1,
                                                                          int
                                                                              item2,
                                                                          String
                                                                              item3) {
                                                                    return DateTime.parse(item1)
                                                                            .add(Duration(days: item2))
                                                                            .difference(DateTime.parse(item3))
                                                                            .inDays >
                                                                        0;
                                                                  }(
                                                                      listRow1Item
                                                                          .dateStart,
                                                                      listRow1Item
                                                                          .lessionId
                                                                          .estimateInDay,
                                                                      dateTimeFormat(
                                                                        'yyyy-MM-dd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))) {
                                                                    return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                      return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays
                                                                          .toString();
                                                                    }(listRow1Item.dateStart, listRow1Item.lessionId.estimateInDay, dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          getCurrentTimestamp,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))} ngày';
                                                                  } else if ((String
                                                                              item1,
                                                                          int
                                                                              item2,
                                                                          String
                                                                              item3) {
                                                                    return DateTime.parse(item1)
                                                                            .add(Duration(days: item2))
                                                                            .difference(DateTime.parse(item3))
                                                                            .inDays <=
                                                                        0;
                                                                  }(
                                                                      listRow1Item
                                                                          .dateStart,
                                                                      listRow1Item
                                                                          .lessionId
                                                                          .estimateInDay,
                                                                      dateTimeFormat(
                                                                        'yyyy-MM-dd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))) {
                                                                    return 'Hết hạn';
                                                                  } else {
                                                                    return null!;
                                                                  }
                                                                }();
                                                              } else if ((listRow1Item.dateStart != null && listRow1Item.dateStart != '') &&
                                                                  (listRow1Item.lessionId.estimateInDay ==
                                                                      0) &&
                                                                  (listRow1Item.programId.estimateInDay !=
                                                                      0)) {
                                                                return () {
                                                                  if ((String item1,
                                                                          int
                                                                              item2,
                                                                          String
                                                                              item3) {
                                                                    return DateTime.parse(item1)
                                                                            .add(Duration(days: item2))
                                                                            .difference(DateTime.parse(item3))
                                                                            .inDays >
                                                                        0;
                                                                  }(
                                                                      listRow1Item
                                                                          .dateCreated,
                                                                      listRow1Item
                                                                          .programId
                                                                          .estimateInDay,
                                                                      dateTimeFormat(
                                                                        'yyyy-MM-dd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))) {
                                                                    return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                      return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays
                                                                          .toString();
                                                                    }(listRow1Item.dateCreated, listRow1Item.programId.estimateInDay, dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          getCurrentTimestamp,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))} ngày';
                                                                  } else if ((String
                                                                              item1,
                                                                          int
                                                                              item2,
                                                                          String
                                                                              item3) {
                                                                    return DateTime.parse(item1)
                                                                            .add(Duration(days: item2))
                                                                            .difference(DateTime.parse(item3))
                                                                            .inDays <=
                                                                        0;
                                                                  }(
                                                                      listRow1Item
                                                                          .dateCreated,
                                                                      listRow1Item
                                                                          .programId
                                                                          .estimateInDay,
                                                                      dateTimeFormat(
                                                                        'yyyy-MM-dd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))) {
                                                                    return 'Hết hạn';
                                                                  } else {
                                                                    return null!;
                                                                  }
                                                                }();
                                                              } else if ((listRow1Item.dateStart == null || listRow1Item.dateStart == '') &&
                                                                  (listRow1Item.lessionId.estimateInDay !=
                                                                      0) &&
                                                                  (listRow1Item.programId.estimateInDay !=
                                                                      0)) {
                                                                return () {
                                                                  if ((String item1,
                                                                          int
                                                                              item2,
                                                                          String
                                                                              item3) {
                                                                    return DateTime.parse(item1)
                                                                            .add(Duration(days: item2))
                                                                            .difference(DateTime.parse(item3))
                                                                            .inDays >
                                                                        0;
                                                                  }(
                                                                      listRow1Item
                                                                          .dateCreated,
                                                                      listRow1Item
                                                                          .programId
                                                                          .estimateInDay,
                                                                      dateTimeFormat(
                                                                        'yyyy-MM-dd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))) {
                                                                    return 'Thời hạn chương trình còn: ${(String item1, int item2, String item3) {
                                                                      return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays
                                                                          .toString();
                                                                    }(listRow1Item.dateCreated, listRow1Item.programId.estimateInDay, dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          getCurrentTimestamp,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))} ngày';
                                                                  } else if ((String
                                                                              item1,
                                                                          int
                                                                              item2,
                                                                          String
                                                                              item3) {
                                                                    return DateTime.parse(item1)
                                                                            .add(Duration(days: item2))
                                                                            .difference(DateTime.parse(item3))
                                                                            .inDays <=
                                                                        0;
                                                                  }(
                                                                      listRow1Item
                                                                          .dateCreated,
                                                                      listRow1Item
                                                                          .programId
                                                                          .estimateInDay,
                                                                      dateTimeFormat(
                                                                        'yyyy-MM-dd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))) {
                                                                    return 'Hết hạn';
                                                                  } else {
                                                                    return null!;
                                                                  }
                                                                }();
                                                              } else if ((listRow1Item.dateStart == null || listRow1Item.dateStart == '') &&
                                                                  (listRow1Item.lessionId.estimateInDay ==
                                                                      0) &&
                                                                  (listRow1Item.programId.estimateInDay !=
                                                                      0)) {
                                                                return () {
                                                                  if ((String item1,
                                                                          int
                                                                              item2,
                                                                          String
                                                                              item3) {
                                                                    return DateTime.parse(item1)
                                                                            .add(Duration(days: item2))
                                                                            .difference(DateTime.parse(item3))
                                                                            .inDays >
                                                                        0;
                                                                  }(
                                                                      listRow1Item
                                                                          .dateCreated,
                                                                      listRow1Item
                                                                          .programId
                                                                          .estimateInDay,
                                                                      dateTimeFormat(
                                                                        'yyyy-MM-dd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))) {
                                                                    return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                      return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays
                                                                          .toString();
                                                                    }(listRow1Item.dateCreated, listRow1Item.programId.estimateInDay, dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          getCurrentTimestamp,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))} ngày';
                                                                  } else if ((String
                                                                              item1,
                                                                          int
                                                                              item2,
                                                                          String
                                                                              item3) {
                                                                    return DateTime.parse(item1)
                                                                            .add(Duration(days: item2))
                                                                            .difference(DateTime.parse(item3))
                                                                            .inDays <=
                                                                        0;
                                                                  }(
                                                                      listRow1Item
                                                                          .dateCreated,
                                                                      listRow1Item
                                                                          .programId
                                                                          .estimateInDay,
                                                                      dateTimeFormat(
                                                                        'yyyy-MM-dd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))) {
                                                                    return 'Hết hạn';
                                                                  } else {
                                                                    return null!;
                                                                  }
                                                                }();
                                                              } else if ((listRow1Item.dateStart == null || listRow1Item.dateStart == '') &&
                                                                  (listRow1Item.lessionId.estimateInDay !=
                                                                      0) &&
                                                                  (listRow1Item.programId.estimateInDay ==
                                                                      0)) {
                                                                return '';
                                                              } else if ((listRow1Item.dateStart != null && listRow1Item.dateStart != '') &&
                                                                  (listRow1Item
                                                                          .lessionId
                                                                          .estimateInDay ==
                                                                      0) &&
                                                                  (listRow1Item
                                                                          .programId
                                                                          .estimateInDay ==
                                                                      0)) {
                                                                return 'Không có hạn';
                                                              } else if ((listRow1Item.dateStart == null ||
                                                                      listRow1Item.dateStart == '') &&
                                                                  (listRow1Item.lessionId.estimateInDay == 0) &&
                                                                  (listRow1Item.programId.estimateInDay == 0)) {
                                                                return 'Không có hạn';
                                                              } else {
                                                                return '';
                                                              }
                                                            }(),
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 2,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      10.0,
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
                                            );
                                          }).divide(
                                            SizedBox(width: 12.0),
                                            filterFn: (listRow1Index) {
                                              final listRow1Item =
                                                  listRow1[listRow1Index];
                                              return listRow1Index != 10;
                                            },
                                          ).addToStart(SizedBox(width: 16.0)),
                                        );
                                      },
                                    ),
                                  ),
                                  if (_model.listLessonRow.length == 11)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: InkWell(
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
                                            'LessonList_Homepage',
                                            queryParameters: {
                                              'statusLove': serializeParam(
                                                '',
                                                ParamType.String,
                                              ),
                                              'lessonNewCreate': serializeParam(
                                                '',
                                                ParamType.String,
                                              ),
                                              'statusLesson': serializeParam(
                                                'draft',
                                                ParamType.String,
                                              ),
                                              'lesonHistory': serializeParam(
                                                '',
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
                                          width: 125.0,
                                          height: 148.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Xem tất cả',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color: _model
                                                                  .checkColor ==
                                                              '6'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              Icon(
                                                Icons.arrow_right,
                                                color: _model.checkColor == '6'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                size: 24.0,
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
                        ),
                      Stack(
                        children: [
                          if (!(_model.listLessonRow.isNotEmpty))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 4.0),
                              child: Container(
                                width: double.infinity,
                                height: 140.0,
                                decoration: BoxDecoration(),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Visibility(
                                  visible: _model.isLoad == true,
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
                          if ((_model.isLoad != true) &&
                              !(_model.listLessonRow.isNotEmpty))
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 5.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Bài học mới đăng',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            if (_model.listLessonRow2.isNotEmpty)
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
                                    'LessonList_Homepage',
                                    queryParameters: {
                                      'statusLesson': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'statusLove': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'lessonNewCreate': serializeParam(
                                        'dateToday',
                                        ParamType.String,
                                      ),
                                      'lesonHistory': serializeParam(
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
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      if ((_model.nameSearchTextController.text != null &&
                              _model.nameSearchTextController.text != '') &&
                          ((FFAppState().staffid != null &&
                                  FFAppState().staffid != '') &&
                              (_model.metaRow2!.filterCount > 0)))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 2.0, 16.0, 0.0),
                          child: Text(
                            '#Kết quả tìm kiếm theo bộ lọc',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ),
                      if (_model.listLessonRow2.isNotEmpty)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 4.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      final listRow2 =
                                          _model.listLessonRow2.toList();

                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(listRow2.length,
                                            (listRow2Index) {
                                          final listRow2Item =
                                              listRow2[listRow2Index];
                                          return Visibility(
                                            visible: listRow2Index != 10,
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'LessonDetail_HomePage',
                                                  queryParameters: {
                                                    'listItems': serializeParam(
                                                      listRow2Item.lessionId
                                                          .toMap(),
                                                      ParamType.JSON,
                                                    ),
                                                    'status': serializeParam(
                                                      listRow2Item.status,
                                                      ParamType.String,
                                                    ),
                                                    'id': serializeParam(
                                                      listRow2Item.id,
                                                      ParamType.String,
                                                    ),
                                                    'programId': serializeParam(
                                                      listRow2Item.programId.id,
                                                      ParamType.String,
                                                    ),
                                                    'checkReload':
                                                        serializeParam(
                                                      'Home',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
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
                                                width: 125.0,
                                                height: 205.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(6.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: 65.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            '${FFAppConstants.ApiBaseUrl}/assets/${listRow2Item.lessionId.imageCover}?access_token=${FFAppState().accessToken}',
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          listRow2Item
                                                              .lessionId.name,
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        listRow2Item.lessionId
                                                            .description,
                                                        maxLines: 3,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    2.0),
                                                        child: Text(
                                                          () {
                                                            if ((listRow2Item.dateStart != null && listRow2Item.dateStart != '') &&
                                                                (listRow2Item.lessionId.estimateInDay !=
                                                                    0) &&
                                                                (listRow2Item.programId.estimateInDay !=
                                                                    0)) {
                                                              return () {
                                                                if ((String item1,
                                                                        int item2,
                                                                        String
                                                                            item3,
                                                                        int item4) {
                                                                  return (DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3).add(Duration(days: item4))))
                                                                          .inDays >=
                                                                      0;
                                                                }(
                                                                    listRow2Item
                                                                        .dateCreated,
                                                                    listRow2Item
                                                                        .programId
                                                                        .estimateInDay,
                                                                    listRow2Item
                                                                        .dateStart,
                                                                    listRow2Item
                                                                        .lessionId
                                                                        .estimateInDay)) {
                                                                  return () {
                                                                    if ((String item1,
                                                                            int
                                                                                item2,
                                                                            String
                                                                                item3) {
                                                                      return DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3))
                                                                              .inDays >
                                                                          0;
                                                                    }(
                                                                        listRow2Item
                                                                            .dateStart,
                                                                        listRow2Item
                                                                            .lessionId
                                                                            .estimateInDay,
                                                                        dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          getCurrentTimestamp,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))) {
                                                                      return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                        return DateTime.parse(item1)
                                                                            .add(Duration(days: item2))
                                                                            .difference(DateTime.parse(item3))
                                                                            .inDays
                                                                            .toString();
                                                                      }(listRow2Item.dateStart, listRow2Item.lessionId.estimateInDay, dateTimeFormat(
                                                                            'yyyy-MM-dd',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))} ngày';
                                                                    } else if ((String
                                                                                item1,
                                                                            int
                                                                                item2,
                                                                            String
                                                                                item3) {
                                                                      return DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3))
                                                                              .inDays <=
                                                                          0;
                                                                    }(
                                                                        listRow2Item
                                                                            .dateStart,
                                                                        listRow2Item
                                                                            .lessionId
                                                                            .estimateInDay,
                                                                        dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          getCurrentTimestamp,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))) {
                                                                      return 'Hết hạn';
                                                                    } else {
                                                                      return null!;
                                                                    }
                                                                  }();
                                                                } else if ((String
                                                                            item1,
                                                                        int item2,
                                                                        String
                                                                            item3,
                                                                        int item4) {
                                                                  return (DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3).add(Duration(days: item4))))
                                                                          .inDays <
                                                                      0;
                                                                }(
                                                                    listRow2Item
                                                                        .dateCreated,
                                                                    listRow2Item
                                                                        .programId
                                                                        .estimateInDay,
                                                                    listRow2Item
                                                                        .dateStart,
                                                                    listRow2Item
                                                                        .lessionId
                                                                        .estimateInDay)) {
                                                                  return () {
                                                                    if ((String item1,
                                                                            int
                                                                                item2,
                                                                            String
                                                                                item3) {
                                                                      return DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3))
                                                                              .inDays >
                                                                          0;
                                                                    }(
                                                                        listRow2Item
                                                                            .dateCreated,
                                                                        listRow2Item
                                                                            .programId
                                                                            .estimateInDay,
                                                                        dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          getCurrentTimestamp,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))) {
                                                                      return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                        return DateTime.parse(item1)
                                                                            .add(Duration(days: item2))
                                                                            .difference(DateTime.parse(item3))
                                                                            .inDays
                                                                            .toString();
                                                                      }(listRow2Item.dateCreated, listRow2Item.programId.estimateInDay, dateTimeFormat(
                                                                            'yyyy-MM-dd',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))} ngày';
                                                                    } else if ((String
                                                                                item1,
                                                                            int
                                                                                item2,
                                                                            String
                                                                                item3) {
                                                                      return DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3))
                                                                              .inDays <=
                                                                          0;
                                                                    }(
                                                                        listRow2Item
                                                                            .dateCreated,
                                                                        listRow2Item
                                                                            .programId
                                                                            .estimateInDay,
                                                                        dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          getCurrentTimestamp,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))) {
                                                                      return 'Hết hạn';
                                                                    } else {
                                                                      return null!;
                                                                    }
                                                                  }();
                                                                } else {
                                                                  return null!;
                                                                }
                                                              }();
                                                            } else if ((listRow2Item.dateStart != null && listRow2Item.dateStart != '') &&
                                                                (listRow2Item.lessionId.estimateInDay !=
                                                                    0) &&
                                                                (listRow2Item.programId.estimateInDay ==
                                                                    0)) {
                                                              return () {
                                                                if ((String item1,
                                                                        int
                                                                            item2,
                                                                        String
                                                                            item3) {
                                                                  return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays >
                                                                      0;
                                                                }(
                                                                    listRow2Item
                                                                        .dateStart,
                                                                    listRow2Item
                                                                        .lessionId
                                                                        .estimateInDay,
                                                                    dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))) {
                                                                  return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                    return DateTime.parse(
                                                                            item1)
                                                                        .add(Duration(
                                                                            days:
                                                                                item2))
                                                                        .difference(
                                                                            DateTime.parse(item3))
                                                                        .inDays
                                                                        .toString();
                                                                  }(listRow2Item.dateStart, listRow2Item.lessionId.estimateInDay, dateTimeFormat(
                                                                        'yyyy-MM-dd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))} ngày';
                                                                } else if ((String
                                                                            item1,
                                                                        int
                                                                            item2,
                                                                        String
                                                                            item3) {
                                                                  return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays <=
                                                                      0;
                                                                }(
                                                                    listRow2Item
                                                                        .dateStart,
                                                                    listRow2Item
                                                                        .lessionId
                                                                        .estimateInDay,
                                                                    dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))) {
                                                                  return 'Hết hạn';
                                                                } else {
                                                                  return null!;
                                                                }
                                                              }();
                                                            } else if ((listRow2Item.dateStart != null && listRow2Item.dateStart != '') &&
                                                                (listRow2Item.lessionId.estimateInDay ==
                                                                    0) &&
                                                                (listRow2Item.programId.estimateInDay !=
                                                                    0)) {
                                                              return () {
                                                                if ((String item1,
                                                                        int
                                                                            item2,
                                                                        String
                                                                            item3) {
                                                                  return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays >
                                                                      0;
                                                                }(
                                                                    listRow2Item
                                                                        .dateCreated,
                                                                    listRow2Item
                                                                        .programId
                                                                        .estimateInDay,
                                                                    dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))) {
                                                                  return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                    return DateTime.parse(
                                                                            item1)
                                                                        .add(Duration(
                                                                            days:
                                                                                item2))
                                                                        .difference(
                                                                            DateTime.parse(item3))
                                                                        .inDays
                                                                        .toString();
                                                                  }(listRow2Item.dateCreated, listRow2Item.programId.estimateInDay, dateTimeFormat(
                                                                        'yyyy-MM-dd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))} ngày';
                                                                } else if ((String
                                                                            item1,
                                                                        int
                                                                            item2,
                                                                        String
                                                                            item3) {
                                                                  return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays <=
                                                                      0;
                                                                }(
                                                                    listRow2Item
                                                                        .dateCreated,
                                                                    listRow2Item
                                                                        .programId
                                                                        .estimateInDay,
                                                                    dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))) {
                                                                  return 'Hết hạn';
                                                                } else {
                                                                  return null!;
                                                                }
                                                              }();
                                                            } else if ((listRow2Item.dateStart == null || listRow2Item.dateStart == '') &&
                                                                (listRow2Item.lessionId.estimateInDay !=
                                                                    0) &&
                                                                (listRow2Item.programId.estimateInDay !=
                                                                    0)) {
                                                              return () {
                                                                if ((String item1,
                                                                        int
                                                                            item2,
                                                                        String
                                                                            item3) {
                                                                  return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays >
                                                                      0;
                                                                }(
                                                                    listRow2Item
                                                                        .dateCreated,
                                                                    listRow2Item
                                                                        .programId
                                                                        .estimateInDay,
                                                                    dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))) {
                                                                  return 'Thời hạn chương trình còn: ${(String item1, int item2, String item3) {
                                                                    return DateTime.parse(
                                                                            item1)
                                                                        .add(Duration(
                                                                            days:
                                                                                item2))
                                                                        .difference(
                                                                            DateTime.parse(item3))
                                                                        .inDays
                                                                        .toString();
                                                                  }(listRow2Item.dateCreated, listRow2Item.programId.estimateInDay, dateTimeFormat(
                                                                        'yyyy-MM-dd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))} ngày';
                                                                } else if ((String
                                                                            item1,
                                                                        int
                                                                            item2,
                                                                        String
                                                                            item3) {
                                                                  return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays <=
                                                                      0;
                                                                }(
                                                                    listRow2Item
                                                                        .dateCreated,
                                                                    listRow2Item
                                                                        .programId
                                                                        .estimateInDay,
                                                                    dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))) {
                                                                  return 'Hết hạn';
                                                                } else {
                                                                  return null!;
                                                                }
                                                              }();
                                                            } else if ((listRow2Item.dateStart == null || listRow2Item.dateStart == '') &&
                                                                (listRow2Item.lessionId.estimateInDay ==
                                                                    0) &&
                                                                (listRow2Item.programId.estimateInDay !=
                                                                    0)) {
                                                              return () {
                                                                if ((String item1,
                                                                        int
                                                                            item2,
                                                                        String
                                                                            item3) {
                                                                  return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays >
                                                                      0;
                                                                }(
                                                                    listRow2Item
                                                                        .dateCreated,
                                                                    listRow2Item
                                                                        .programId
                                                                        .estimateInDay,
                                                                    dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))) {
                                                                  return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                    return DateTime.parse(
                                                                            item1)
                                                                        .add(Duration(
                                                                            days:
                                                                                item2))
                                                                        .difference(
                                                                            DateTime.parse(item3))
                                                                        .inDays
                                                                        .toString();
                                                                  }(listRow2Item.dateCreated, listRow2Item.programId.estimateInDay, dateTimeFormat(
                                                                        'yyyy-MM-dd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))} ngày';
                                                                } else if ((String
                                                                            item1,
                                                                        int
                                                                            item2,
                                                                        String
                                                                            item3) {
                                                                  return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays <=
                                                                      0;
                                                                }(
                                                                    listRow2Item
                                                                        .dateCreated,
                                                                    listRow2Item
                                                                        .programId
                                                                        .estimateInDay,
                                                                    dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))) {
                                                                  return 'Hết hạn';
                                                                } else {
                                                                  return null!;
                                                                }
                                                              }();
                                                            } else if ((listRow2Item.dateStart == null || listRow2Item.dateStart == '') &&
                                                                (listRow2Item.lessionId.estimateInDay !=
                                                                    0) &&
                                                                (listRow2Item.programId.estimateInDay ==
                                                                    0)) {
                                                              return '';
                                                            } else if ((listRow2Item.dateStart != null && listRow2Item.dateStart != '') &&
                                                                (listRow2Item.lessionId.estimateInDay ==
                                                                    0) &&
                                                                (listRow2Item
                                                                        .programId
                                                                        .estimateInDay ==
                                                                    0)) {
                                                              return 'Không có hạn';
                                                            } else if ((listRow2Item.dateStart == null ||
                                                                    listRow2Item.dateStart == '') &&
                                                                (listRow2Item.lessionId.estimateInDay == 0) &&
                                                                (listRow2Item.programId.estimateInDay == 0)) {
                                                              return 'Không có hạn';
                                                            } else {
                                                              return '';
                                                            }
                                                          }(),
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 10.0,
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
                                          );
                                        }).divide(
                                          SizedBox(width: 12.0),
                                          filterFn: (listRow2Index) {
                                            final listRow2Item =
                                                listRow2[listRow2Index];
                                            return listRow2Index != 10;
                                          },
                                        ).addToStart(SizedBox(width: 16.0)),
                                      );
                                    },
                                  ),
                                  if (_model.listLessonRow2.length == 11)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.checkColor = '8';
                                          setState(() {});
                                          await Future.delayed(
                                              const Duration(milliseconds: 10));
                                          _model.checkColor = '';
                                          setState(() {});

                                          context.pushNamed(
                                            'LessonList_Homepage',
                                            queryParameters: {
                                              'statusLesson': serializeParam(
                                                '',
                                                ParamType.String,
                                              ),
                                              'statusLove': serializeParam(
                                                '',
                                                ParamType.String,
                                              ),
                                              'lessonNewCreate': serializeParam(
                                                'dateToday',
                                                ParamType.String,
                                              ),
                                              'lesonHistory': serializeParam(
                                                '',
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
                                          width: 125.0,
                                          height: 205.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Xem tất cả',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color: _model
                                                                  .checkColor ==
                                                              '8'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              Icon(
                                                Icons.arrow_right,
                                                color: _model.checkColor == '8'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                size: 24.0,
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
                        ),
                      Stack(
                        children: [
                          if (!(_model.listLessonRow2.isNotEmpty))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 4.0),
                              child: Container(
                                width: double.infinity,
                                height: 140.0,
                                decoration: BoxDecoration(),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Visibility(
                                  visible: _model.isLoad == true,
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
                          if ((_model.isLoad != true) &&
                              !(_model.listLessonRow2.isNotEmpty))
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: Text(
                          'Bài học khác',
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Nunito Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: InkWell(
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
                                    'LessonList_Homepage',
                                    queryParameters: {
                                      'statusLesson': serializeParam(
                                        'inprogress',
                                        ParamType.String,
                                      ),
                                      'statusLove': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'lessonNewCreate': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'lesonHistory': serializeParam(
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
                                  height: 36.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x2A4B39EF),
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: _model.checkColor == '1'
                                          ? Color(0x2A4B39EF)
                                          : Color(0x00000000),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        32.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.menu_book_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 18.0,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Đang học',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
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
                                    'LessonList_Homepage',
                                    queryParameters: {
                                      'statusLesson': serializeParam(
                                        'done',
                                        ParamType.String,
                                      ),
                                      'statusLove': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'lessonNewCreate': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'lesonHistory': serializeParam(
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
                                  height: 36.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x2A4B39EF),
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: _model.checkColor == '2'
                                          ? Color(0x2A4B39EF)
                                          : Color(0x00000000),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        32.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.done_all_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 18.0,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Hoàn thành',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: InkWell(
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
                                    'LessonList_Homepage',
                                    queryParameters: {
                                      'statusLesson': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'statusLove': serializeParam(
                                        'love',
                                        ParamType.String,
                                      ),
                                      'lessonNewCreate': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'lesonHistory': serializeParam(
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
                                  height: 36.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x2A4B39EF),
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: _model.checkColor == '3'
                                          ? Color(0x2A4B39EF)
                                          : Color(0x00000000),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        32.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.favorite_border,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 18.0,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Yêu thích',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
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
                                    'LessonList_Homepage',
                                    queryParameters: {
                                      'statusLesson': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'statusLove': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'lessonNewCreate': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'lesonHistory': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'checkLesson': serializeParam(
                                        'obligatory',
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
                                  height: 36.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x2A4B39EF),
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: _model.checkColor == '4'
                                          ? Color(0x2A4B39EF)
                                          : Color(0x00000000),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        32.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 2.0),
                                          child: Icon(
                                            Icons.style_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 18.0,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Bắt buộc',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 24.0, 5.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Đã học gần đây',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            if (_model.listLessonRow3.isNotEmpty)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.checkColor = '9';
                                  setState(() {});
                                  await Future.delayed(
                                      const Duration(milliseconds: 10));
                                  _model.checkColor = '';
                                  setState(() {});

                                  context.pushNamed(
                                    'LessonList_Homepage',
                                    queryParameters: {
                                      'statusLesson': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'statusLove': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'lessonNewCreate': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'lesonHistory': serializeParam(
                                        'lessonHistory',
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
                                            color: _model.checkColor == '9'
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
                                      color: _model.checkColor == '9'
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      if ((_model.nameSearchTextController.text != null &&
                              _model.nameSearchTextController.text != '') &&
                          ((FFAppState().staffid != null &&
                                  FFAppState().staffid != '') &&
                              (_model.metaRow3!.filterCount > 0)))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 2.0, 16.0, 0.0),
                          child: Text(
                            '#Kết quả tìm kiếm theo bộ lọc',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ),
                      if (_model.listLessonRow3.isNotEmpty)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 4.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      final listRow3 =
                                          _model.listLessonRow3.toList();

                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(listRow3.length,
                                            (listRow3Index) {
                                          final listRow3Item =
                                              listRow3[listRow3Index];
                                          return Visibility(
                                            visible: listRow3Index != 10,
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'LessonDetail_HomePage',
                                                  queryParameters: {
                                                    'listItems': serializeParam(
                                                      listRow3Item.lessionId
                                                          .toMap(),
                                                      ParamType.JSON,
                                                    ),
                                                    'status': serializeParam(
                                                      listRow3Item.status,
                                                      ParamType.String,
                                                    ),
                                                    'id': serializeParam(
                                                      listRow3Item.id,
                                                      ParamType.String,
                                                    ),
                                                    'checkReload':
                                                        serializeParam(
                                                      'Home',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
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
                                                width: 125.0,
                                                height: 148.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(6.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: 65.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            '${FFAppConstants.ApiBaseUrl}/assets/${listRow3Item.lessionId.imageCover}?access_token=${FFAppState().accessToken}',
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          listRow3Item
                                                              .lessionId.name,
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    2.0),
                                                        child: Text(
                                                          () {
                                                            if ((listRow3Item.dateStart != null && listRow3Item.dateStart != '') &&
                                                                (listRow3Item.lessionId.estimateInDay !=
                                                                    0) &&
                                                                (listRow3Item.programId.estimateInDay !=
                                                                    0)) {
                                                              return () {
                                                                if ((String item1,
                                                                        int item2,
                                                                        String
                                                                            item3,
                                                                        int item4) {
                                                                  return (DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3).add(Duration(days: item4))))
                                                                          .inDays >=
                                                                      0;
                                                                }(
                                                                    listRow3Item
                                                                        .dateCreated,
                                                                    listRow3Item
                                                                        .programId
                                                                        .estimateInDay,
                                                                    listRow3Item
                                                                        .dateStart,
                                                                    listRow3Item
                                                                        .lessionId
                                                                        .estimateInDay)) {
                                                                  return () {
                                                                    if ((String item1,
                                                                            int
                                                                                item2,
                                                                            String
                                                                                item3) {
                                                                      return DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3))
                                                                              .inDays >
                                                                          0;
                                                                    }(
                                                                        listRow3Item
                                                                            .dateStart,
                                                                        listRow3Item
                                                                            .lessionId
                                                                            .estimateInDay,
                                                                        dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          getCurrentTimestamp,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))) {
                                                                      return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                        return DateTime.parse(item1)
                                                                            .add(Duration(days: item2))
                                                                            .difference(DateTime.parse(item3))
                                                                            .inDays
                                                                            .toString();
                                                                      }(listRow3Item.dateStart, listRow3Item.lessionId.estimateInDay, dateTimeFormat(
                                                                            'yyyy-MM-dd',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))} ngày';
                                                                    } else if ((String
                                                                                item1,
                                                                            int
                                                                                item2,
                                                                            String
                                                                                item3) {
                                                                      return DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3))
                                                                              .inDays <=
                                                                          0;
                                                                    }(
                                                                        listRow3Item
                                                                            .dateStart,
                                                                        listRow3Item
                                                                            .lessionId
                                                                            .estimateInDay,
                                                                        dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          getCurrentTimestamp,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))) {
                                                                      return 'Hết hạn';
                                                                    } else {
                                                                      return null!;
                                                                    }
                                                                  }();
                                                                } else if ((String
                                                                            item1,
                                                                        int item2,
                                                                        String
                                                                            item3,
                                                                        int item4) {
                                                                  return (DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3).add(Duration(days: item4))))
                                                                          .inDays <
                                                                      0;
                                                                }(
                                                                    listRow3Item
                                                                        .dateCreated,
                                                                    listRow3Item
                                                                        .programId
                                                                        .estimateInDay,
                                                                    listRow3Item
                                                                        .dateStart,
                                                                    listRow3Item
                                                                        .lessionId
                                                                        .estimateInDay)) {
                                                                  return () {
                                                                    if ((String item1,
                                                                            int
                                                                                item2,
                                                                            String
                                                                                item3) {
                                                                      return DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3))
                                                                              .inDays >
                                                                          0;
                                                                    }(
                                                                        listRow3Item
                                                                            .dateCreated,
                                                                        listRow3Item
                                                                            .programId
                                                                            .estimateInDay,
                                                                        dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          getCurrentTimestamp,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))) {
                                                                      return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                        return DateTime.parse(item1)
                                                                            .add(Duration(days: item2))
                                                                            .difference(DateTime.parse(item3))
                                                                            .inDays
                                                                            .toString();
                                                                      }(listRow3Item.dateCreated, listRow3Item.programId.estimateInDay, dateTimeFormat(
                                                                            'yyyy-MM-dd',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))} ngày';
                                                                    } else if ((String
                                                                                item1,
                                                                            int
                                                                                item2,
                                                                            String
                                                                                item3) {
                                                                      return DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3))
                                                                              .inDays <=
                                                                          0;
                                                                    }(
                                                                        listRow3Item
                                                                            .dateCreated,
                                                                        listRow3Item
                                                                            .programId
                                                                            .estimateInDay,
                                                                        dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          getCurrentTimestamp,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))) {
                                                                      return 'Hết hạn';
                                                                    } else {
                                                                      return null!;
                                                                    }
                                                                  }();
                                                                } else {
                                                                  return null!;
                                                                }
                                                              }();
                                                            } else if ((listRow3Item.dateStart != null && listRow3Item.dateStart != '') &&
                                                                (listRow3Item.lessionId.estimateInDay !=
                                                                    0) &&
                                                                (listRow3Item.programId.estimateInDay ==
                                                                    0)) {
                                                              return () {
                                                                if ((String item1,
                                                                        int
                                                                            item2,
                                                                        String
                                                                            item3) {
                                                                  return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays >
                                                                      0;
                                                                }(
                                                                    listRow3Item
                                                                        .dateStart,
                                                                    listRow3Item
                                                                        .lessionId
                                                                        .estimateInDay,
                                                                    dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))) {
                                                                  return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                    return DateTime.parse(
                                                                            item1)
                                                                        .add(Duration(
                                                                            days:
                                                                                item2))
                                                                        .difference(
                                                                            DateTime.parse(item3))
                                                                        .inDays
                                                                        .toString();
                                                                  }(listRow3Item.dateStart, listRow3Item.lessionId.estimateInDay, dateTimeFormat(
                                                                        'yyyy-MM-dd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))} ngày';
                                                                } else if ((String
                                                                            item1,
                                                                        int
                                                                            item2,
                                                                        String
                                                                            item3) {
                                                                  return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays <=
                                                                      0;
                                                                }(
                                                                    listRow3Item
                                                                        .dateStart,
                                                                    listRow3Item
                                                                        .lessionId
                                                                        .estimateInDay,
                                                                    dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))) {
                                                                  return 'Hết hạn';
                                                                } else {
                                                                  return null!;
                                                                }
                                                              }();
                                                            } else if ((listRow3Item.dateStart != null && listRow3Item.dateStart != '') &&
                                                                (listRow3Item.lessionId.estimateInDay ==
                                                                    0) &&
                                                                (listRow3Item.programId.estimateInDay !=
                                                                    0)) {
                                                              return () {
                                                                if ((String item1,
                                                                        int
                                                                            item2,
                                                                        String
                                                                            item3) {
                                                                  return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays >
                                                                      0;
                                                                }(
                                                                    listRow3Item
                                                                        .dateCreated,
                                                                    listRow3Item
                                                                        .programId
                                                                        .estimateInDay,
                                                                    dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))) {
                                                                  return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                    return DateTime.parse(
                                                                            item1)
                                                                        .add(Duration(
                                                                            days:
                                                                                item2))
                                                                        .difference(
                                                                            DateTime.parse(item3))
                                                                        .inDays
                                                                        .toString();
                                                                  }(listRow3Item.dateCreated, listRow3Item.programId.estimateInDay, dateTimeFormat(
                                                                        'yyyy-MM-dd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))} ngày';
                                                                } else if ((String
                                                                            item1,
                                                                        int
                                                                            item2,
                                                                        String
                                                                            item3) {
                                                                  return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays <=
                                                                      0;
                                                                }(
                                                                    listRow3Item
                                                                        .dateCreated,
                                                                    listRow3Item
                                                                        .programId
                                                                        .estimateInDay,
                                                                    dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))) {
                                                                  return 'Hết hạn';
                                                                } else {
                                                                  return null!;
                                                                }
                                                              }();
                                                            } else if ((listRow3Item.dateStart == null || listRow3Item.dateStart == '') &&
                                                                (listRow3Item.lessionId.estimateInDay !=
                                                                    0) &&
                                                                (listRow3Item.programId.estimateInDay !=
                                                                    0)) {
                                                              return () {
                                                                if ((String item1,
                                                                        int
                                                                            item2,
                                                                        String
                                                                            item3) {
                                                                  return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays >
                                                                      0;
                                                                }(
                                                                    listRow3Item
                                                                        .dateCreated,
                                                                    listRow3Item
                                                                        .programId
                                                                        .estimateInDay,
                                                                    dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))) {
                                                                  return 'Thời hạn chương trình còn: ${(String item1, int item2, String item3) {
                                                                    return DateTime.parse(
                                                                            item1)
                                                                        .add(Duration(
                                                                            days:
                                                                                item2))
                                                                        .difference(
                                                                            DateTime.parse(item3))
                                                                        .inDays
                                                                        .toString();
                                                                  }(listRow3Item.dateCreated, listRow3Item.programId.estimateInDay, dateTimeFormat(
                                                                        'yyyy-MM-dd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))} ngày';
                                                                } else if ((String
                                                                            item1,
                                                                        int
                                                                            item2,
                                                                        String
                                                                            item3) {
                                                                  return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays <=
                                                                      0;
                                                                }(
                                                                    listRow3Item
                                                                        .dateCreated,
                                                                    listRow3Item
                                                                        .programId
                                                                        .estimateInDay,
                                                                    dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))) {
                                                                  return 'Hết hạn';
                                                                } else {
                                                                  return null!;
                                                                }
                                                              }();
                                                            } else if ((listRow3Item.dateStart == null || listRow3Item.dateStart == '') &&
                                                                (listRow3Item.lessionId.estimateInDay ==
                                                                    0) &&
                                                                (listRow3Item.programId.estimateInDay !=
                                                                    0)) {
                                                              return () {
                                                                if ((String item1,
                                                                        int
                                                                            item2,
                                                                        String
                                                                            item3) {
                                                                  return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays >
                                                                      0;
                                                                }(
                                                                    listRow3Item
                                                                        .dateCreated,
                                                                    listRow3Item
                                                                        .programId
                                                                        .estimateInDay,
                                                                    dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))) {
                                                                  return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                    return DateTime.parse(
                                                                            item1)
                                                                        .add(Duration(
                                                                            days:
                                                                                item2))
                                                                        .difference(
                                                                            DateTime.parse(item3))
                                                                        .inDays
                                                                        .toString();
                                                                  }(listRow3Item.dateCreated, listRow3Item.programId.estimateInDay, dateTimeFormat(
                                                                        'yyyy-MM-dd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))} ngày';
                                                                } else if ((String
                                                                            item1,
                                                                        int
                                                                            item2,
                                                                        String
                                                                            item3) {
                                                                  return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays <=
                                                                      0;
                                                                }(
                                                                    listRow3Item
                                                                        .dateCreated,
                                                                    listRow3Item
                                                                        .programId
                                                                        .estimateInDay,
                                                                    dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))) {
                                                                  return 'Hết hạn';
                                                                } else {
                                                                  return null!;
                                                                }
                                                              }();
                                                            } else if ((listRow3Item.dateStart == null || listRow3Item.dateStart == '') &&
                                                                (listRow3Item.lessionId.estimateInDay !=
                                                                    0) &&
                                                                (listRow3Item.programId.estimateInDay ==
                                                                    0)) {
                                                              return '';
                                                            } else if ((listRow3Item.dateStart != null && listRow3Item.dateStart != '') &&
                                                                (listRow3Item.lessionId.estimateInDay ==
                                                                    0) &&
                                                                (listRow3Item
                                                                        .programId
                                                                        .estimateInDay ==
                                                                    0)) {
                                                              return 'Không có hạn';
                                                            } else if ((listRow3Item.dateStart == null ||
                                                                    listRow3Item.dateStart == '') &&
                                                                (listRow3Item.lessionId.estimateInDay == 0) &&
                                                                (listRow3Item.programId.estimateInDay == 0)) {
                                                              return 'Không có hạn';
                                                            } else {
                                                              return '';
                                                            }
                                                          }(),
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 10.0,
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
                                          );
                                        }).divide(
                                          SizedBox(width: 12.0),
                                          filterFn: (listRow3Index) {
                                            final listRow3Item =
                                                listRow3[listRow3Index];
                                            return listRow3Index != 10;
                                          },
                                        ).addToStart(SizedBox(width: 16.0)),
                                      );
                                    },
                                  ),
                                  if (_model.listLessonRow3.length == 11)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.checkColor = '10';
                                          setState(() {});
                                          await Future.delayed(
                                              const Duration(milliseconds: 10));
                                          _model.checkColor = '';
                                          setState(() {});

                                          context.pushNamed(
                                            'LessonList_Homepage',
                                            queryParameters: {
                                              'statusLesson': serializeParam(
                                                '',
                                                ParamType.String,
                                              ),
                                              'statusLove': serializeParam(
                                                '',
                                                ParamType.String,
                                              ),
                                              'lessonNewCreate': serializeParam(
                                                '',
                                                ParamType.String,
                                              ),
                                              'lesonHistory': serializeParam(
                                                'lessonHistory',
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
                                          width: 125.0,
                                          height: 148.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Xem tất cả',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color: _model
                                                                  .checkColor ==
                                                              '10'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              Icon(
                                                Icons.arrow_right,
                                                color: _model.checkColor == '10'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                size: 24.0,
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
                        ),
                      Stack(
                        children: [
                          if (!(_model.listLessonRow3.isNotEmpty))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 4.0),
                              child: Container(
                                width: double.infinity,
                                height: 140.0,
                                decoration: BoxDecoration(),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Visibility(
                                  visible: _model.isLoad == true,
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
                          if ((_model.isLoad != true) &&
                              !(_model.listLessonRow3.isNotEmpty))
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: Text(
                          'Hãy thử khám phá',
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Nunito Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: Color(0x2539D2C0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.filter_list_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 20.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                    Text(
                                      'Bộ lọc bài học',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: Color(0x2539D2C0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 20.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                    Text(
                                      'Bài học yêu thích',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tất cả bài học khác',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                if ((_model.nameSearchTextController.text !=
                                            null &&
                                        _model.nameSearchTextController.text !=
                                            '') ||
                                    ((_model.status != null &&
                                            _model.status != '') &&
                                        (_model.status != 'noData')) ||
                                    ((_model.dateEndList != null &&
                                            _model.dateEndList != '') &&
                                        (_model.dateEndList != 'noData')) ||
                                    ((_model.dateStartList != null &&
                                            _model.dateStartList != '') &&
                                        (_model.dateStartList != 'noData')))
                                  Text(
                                    '#Kết quả tìm kiếm theo bộ lọc',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                            FlutterFlowIconButton(
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
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: FilterLessonHomePageWidget(
                                          dateStart: _model.dateStartList,
                                          dateEnd: _model.dateEndList,
                                          lessonFavoriteStatus:
                                              _model.lessonFavoriteStatusList,
                                          statusLoveFilter: '',
                                          statusDateToday: '',
                                          statusDateHistory: '',
                                          programsId: _model.programsAllId,
                                          checkPrograms: 'programs',
                                          callBack: (dateStart,
                                              dateEnd,
                                              lessonStatus,
                                              lessonFavoriteStatus,
                                              programsId) async {
                                            _model.dateStartList =
                                                dateTimeFormat(
                                              'yyyy-MM-dd',
                                              dateStart,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            );
                                            _model.dateEndList = dateTimeFormat(
                                              'yyyy-MM-dd',
                                              dateEnd,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            );
                                            _model.lessonFavoriteStatusList =
                                                lessonFavoriteStatus!;
                                            _model.programsAllId = programsId!;
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
                          ],
                        ),
                      ),
                      if (FFAppState().staffid != null &&
                          FFAppState().staffid != '')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 16.0),
                          child:
                              PagedListView<ApiPagingParams, dynamic>.separated(
                            pagingController: _model.setListViewController(
                              (nextPageMarker) =>
                                  LessonGroup.getLessonListCall.call(
                                accessToken: FFAppState().accessToken,
                                limit: 20,
                                offset: nextPageMarker.nextPageNumber * 20,
                                filter: '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
                                  FFAppState().staffLogin,
                                  r'''$.organization_id''',
                                ).toString()}\"}}${_model.nameSearchTextController.text != null && _model.nameSearchTextController.text != '' ? ',{\"name\":{\"_icontains\":\"' : ' '}${_model.nameSearchTextController.text != null && _model.nameSearchTextController.text != '' ? _model.nameSearchTextController.text : ' '}${_model.nameSearchTextController.text != null && _model.nameSearchTextController.text != '' ? '\"}}' : ' '}${(_model.status != null && _model.status != '') && (_model.status != 'noData') ? ',{\"status\":{\"_icontains\":\"' : ' '}${(_model.status != null && _model.status != '') && (_model.status != 'noData') ? _model.status : ' '}${(_model.status != null && _model.status != '') && (_model.status != 'noData') ? '\"}}' : ' '}${(_model.dateStartList != null && _model.dateStartList != '') && (_model.dateStartList != 'noData') ? ',{\"date_created\":{\"_gte\":\"' : ' '}${(_model.dateStartList != null && _model.dateStartList != '') && (_model.dateStartList != 'noData') ? _model.dateStartList : ' '}${(_model.dateStartList != null && _model.dateStartList != '') && (_model.dateStartList != 'noData') ? '\"}}' : ' '}${(_model.dateEndList != null && _model.dateEndList != '') && (_model.dateEndList != 'noData') ? ',{\"date_created\":{\"_lte\":\"' : ' '}${(_model.dateEndList != null && _model.dateEndList != '') && (_model.dateEndList != 'noData') ? ((String var1) {
                                    return DateTime.parse(var1)
                                        .add(Duration(days: 1))
                                        .toString();
                                  }(_model.dateEndList)) : ' '}${(_model.dateEndList != null && _model.dateEndList != '') && (_model.dateEndList != 'noData') ? '\"}}' : ' '}${(_model.lessonFavoriteStatusList != null && _model.lessonFavoriteStatusList != '') && (_model.lessonFavoriteStatusList != 'noData') ? ',{\"reacts\":{\"reacts_id\":{\"status\":{\"_eq\":\"love\"}}}},{\"reacts\":{\"reacts_id\":{\"staff_id\":{\"_eq\":\"' : ' '}${(_model.lessonFavoriteStatusList != null && _model.lessonFavoriteStatusList != '') && (_model.lessonFavoriteStatusList != 'noData') ? FFAppState().staffid : ' '}${(_model.lessonFavoriteStatusList != null && _model.lessonFavoriteStatusList != '') && (_model.lessonFavoriteStatusList != 'noData') ? '\"}}}}' : ' '}${_model.programsAllId != null && _model.programsAllId != '' ? ',{\"programs\":{\"programs_id\":{\"id\":{\"_eq\":\"' : ' '}${_model.programsAllId != null && _model.programsAllId != '' ? _model.programsAllId : ' '}${_model.programsAllId != null && _model.programsAllId != '' ? '\"}}}}' : ' '},{\"programs\":{\"programs_id\":{\"departments\":{\"departments_id\":{\"id\":{\"_neq\":\"${getJsonField(
                                  FFAppState().staffDepartment,
                                  r'''$.id''',
                                ).toString()}\"}}}}}},{\"status\":{\"_icontains\":\"published\"}}]}',
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
                              noItemsFoundIndicatorBuilder: (_) => Center(
                                child: NoDataWidget(),
                              ),
                              itemBuilder: (context, _, listIndex) {
                                final listItem = _model
                                    .listViewPagingController!
                                    .itemList![listIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'LessonDetail',
                                      queryParameters: {
                                        'idLesson': serializeParam(
                                          listItem.id,
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
                                    height: 140.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(4.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              '${FFAppConstants.ApiBaseUrl}/assets/${listItem.imageCover}?access_token=${FFAppState().accessToken}',
                                              width: 100.0,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                              alignment: Alignment(0.0, 0.0),
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.png',
                                                width: 100.0,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                                alignment: Alignment(0.0, 0.0),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Text(
                                                        listItem.name,
                                                        maxLines: 2,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          listItem.description,
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Người tạo: ${listItem.userCreated.firstName}',
                                                        maxLines: 2,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 13.0,
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
                                                  children: [
                                                    Icon(
                                                      Icons.timelapse_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20.0,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        '${listItem.durationHours.toString()} phút',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  letterSpacing:
                                                                      0.0,
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
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ].addToEnd(SizedBox(height: 200.0)),
              ),
            ),
            if (!(isWeb
                ? MediaQuery.viewInsetsOf(context).bottom > 0
                : _isKeyboardVisible))
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 12.0),
                  child: wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => setState(() {}),
                    child: NavBarWidget(
                      selectedPageIndex: 6,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
