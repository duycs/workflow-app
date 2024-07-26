import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/news_feed/action_newsfeed/action_newsfeed_widget.dart';
import '/news_feed/comment_newsfeed/comment_newsfeed_widget.dart';
import '/news_feed/d_n_f_newsfeed/d_n_f_newsfeed_widget.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'newsfeed_list_require_model.dart';
export 'newsfeed_list_require_model.dart';

class NewsfeedListRequireWidget extends StatefulWidget {
  const NewsfeedListRequireWidget({
    super.key,
    required this.checkScope,
  });

  final String? checkScope;

  @override
  State<NewsfeedListRequireWidget> createState() =>
      _NewsfeedListRequireWidgetState();
}

class _NewsfeedListRequireWidgetState extends State<NewsfeedListRequireWidget> {
  late NewsfeedListRequireModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsfeedListRequireModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                'Newsfeed',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
          ),
          title: Text(
            'Tin tức yêu cầu đọc',
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
          child:
              // This list view is "shrink wrapped" this can affect your app performance, we would suggest limiting the number of items you query in this list view.
              //
              // The list view is shrink wrapped to prevent the page from having two scrollable elements. The parent column is the element that is scrollable and it provides a smooth user experience.
              Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: PagedListView<ApiPagingParams, dynamic>.separated(
              pagingController: _model.setListViewController(
                (nextPageMarker) => NewsfeedGroup.newsfeedListCall.call(
                  offset: nextPageMarker.nextPageNumber * 20,
                  accessToken: FFAppState().accessToken,
                  limit: 20,
                  filter: () {
                    if (widget!.checkScope == 'Tổ chức') {
                      return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                        FFAppState().staffOrganization,
                        r'''$.id''',
                      ).toString()}\"}}},{\"branch_id\":{\"_null\":true}},{\"department_id\":{\"_null\":true}},{\"status\":{\"_eq\":\"require\"}}]}';
                    } else if (widget!.checkScope == 'Chi nhánh') {
                      return () {
                        if (FFAppState().user.role ==
                            '3755a98d-f064-45cd-80e4-5084ab1dd2c4') {
                          return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                            FFAppState().staffOrganization,
                            r'''$.id''',
                          ).toString()}\"}}},{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
                            FFAppState().staffBranch,
                            r'''$.id''',
                          ).toString()}\"}}},{\"status\":{\"_eq\":\"require\"}}]}';
                        } else if (FFAppState().user.role ==
                            '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                          return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                            FFAppState().staffOrganization,
                            r'''$.id''',
                          ).toString()}\"}}},{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
                            FFAppState().staffBranch,
                            r'''$.id''',
                          ).toString()}\"}}},{\"status\":{\"_eq\":\"require\"}}]}';
                        } else if (FFAppState().user.role ==
                            'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                          return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                            FFAppState().staffOrganization,
                            r'''$.id''',
                          ).toString()}\"}}},{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
                            FFAppState().staffBranch,
                            r'''$.id''',
                          ).toString()}\"}}},{\"status\":{\"_eq\":\"require\"}}]}';
                        } else if (FFAppState().user.role ==
                            '82073000-1ba2-43a4-a55c-459d17c23b68') {
                          return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                            FFAppState().staffOrganization,
                            r'''$.id''',
                          ).toString()}\"}}},{\"branch_id\":{\"_nnull\":true}},{\"status\":{\"_eq\":\"require\"}}]}';
                        } else {
                          return ' ';
                        }
                      }();
                    } else if (widget!.checkScope == 'Bộ phận') {
                      return () {
                        if (FFAppState().user.role ==
                            '3755a98d-f064-45cd-80e4-5084ab1dd2c4') {
                          return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                            FFAppState().staffOrganization,
                            r'''$.id''',
                          ).toString()}\"}}},{\"department_id\":{\"id\":{\"_eq\":\"${getJsonField(
                            FFAppState().staffDepartment,
                            r'''$.id''',
                          ).toString()}\"}}},{\"status\":{\"_eq\":\"require\"}}]}';
                        } else if (FFAppState().user.role ==
                            '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                          return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                            FFAppState().staffOrganization,
                            r'''$.id''',
                          ).toString()}\"}}},{\"department_id\":{\"id\":{\"_eq\":\"${getJsonField(
                            FFAppState().staffDepartment,
                            r'''$.id''',
                          ).toString()}\"}}},{\"status\":{\"_eq\":\"require\"}}]}';
                        } else if (FFAppState().user.role ==
                            'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                          return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                            FFAppState().staffOrganization,
                            r'''$.id''',
                          ).toString()}\"}}},{\"department_id\":{\"branch_id\":{\"_eq\":\"${getJsonField(
                            FFAppState().staffBranch,
                            r'''$.id''',
                          ).toString()}\"}}},{\"status\":{\"_eq\":\"require\"}}]}';
                        } else if (FFAppState().user.role ==
                            '82073000-1ba2-43a4-a55c-459d17c23b68') {
                          return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                            FFAppState().staffOrganization,
                            r'''$.id''',
                          ).toString()}\"}}},{\"department_id\":{\"_nnull\":true}},{\"status\":{\"_eq\":\"require\"}}]}';
                        } else {
                          return ' ';
                        }
                      }();
                    } else {
                      return ' ';
                    }
                  }(),
                ),
              ),
              padding: EdgeInsets.zero,
              primary: false,
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
                noItemsFoundIndicatorBuilder: (_) => DNFNewsfeedWidget(),
                itemBuilder: (context, _, newsfeedListRequireIndex) {
                  final newsfeedListRequireItem = _model
                      .listViewPagingController!
                      .itemList![newsfeedListRequireIndex];
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'ProfileUserNew',
                                      queryParameters: {
                                        'staffId': serializeParam(
                                          newsfeedListRequireItem
                                              .userCreated.staffs.first.id,
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
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      borderRadius: BorderRadius.circular(90.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(90.0),
                                        child: Image.network(
                                          '${FFAppConstants.ApiBaseUrl}/assets/${newsfeedListRequireItem.userCreated.avatar}?access_token=${FFAppState().accessToken}',
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Image.asset(
                                            'assets/images/error_image.png',
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          newsfeedListRequireItem
                                              .userCreated.firstName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          dateTimeFormat(
                                            'relative',
                                            functions.stringToDateTime(
                                                newsfeedListRequireItem
                                                    .dateCreated),
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (newsfeedListRequireItem.userCreated.id ==
                                    FFAppState().user.id)
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.keyboard_control,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
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
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: ActionNewsfeedWidget(
                                                newsFeedList:
                                                    newsfeedListRequireItem,
                                                checkPage: 'newsfeedRequire',
                                                callback: () async {
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
                              ],
                            ),
                          ),
                          Text(
                            newsfeedListRequireItem.title,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          if ((newsfeedListRequireItem != null) &&
                              (newsfeedListRequireItem.content != null &&
                                  newsfeedListRequireItem.content != '') &&
                              ((newsfeedListRequireItem.videos.length > 0) ||
                                  (newsfeedListRequireItem.files.length > 0)))
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'NewsfeedDetail',
                                  queryParameters: {
                                    'newsfeedId': serializeParam(
                                      newsfeedListRequireItem.id,
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
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: newsfeedListRequireItem.content,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                          ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                maxLines: 2,
                              ),
                            ),
                          if ((newsfeedListRequireItem != null) &&
                              (newsfeedListRequireItem.content != null &&
                                  newsfeedListRequireItem.content != '') &&
                              ((newsfeedListRequireItem.videos.length > 0) ||
                                  (newsfeedListRequireItem.files.length > 0)))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'NewsfeedDetail',
                                    queryParameters: {
                                      'newsfeedId': serializeParam(
                                        newsfeedListRequireItem.id,
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
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Xem thêm...',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          if ((newsfeedListRequireItem != null) &&
                              (newsfeedListRequireItem.content != null &&
                                  newsfeedListRequireItem.content != '') &&
                              ((newsfeedListRequireItem.videos.length == 0) &&
                                  (newsfeedListRequireItem.files.length == 0)))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: custom_widgets.FormatText(
                                width: 100.0,
                                height: 100.0,
                                number: 90,
                                text: newsfeedListRequireItem.content,
                                action: () async {
                                  context.pushNamed(
                                    'NewsfeedDetail',
                                    queryParameters: {
                                      'newsfeedId': serializeParam(
                                        newsfeedListRequireItem.id,
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
                              ),
                            ),
                          if (newsfeedListRequireItem.images.length > 0)
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Builder(
                                  builder: (context) {
                                    final imageList =
                                        newsfeedListRequireItem.images.toList();

                                    return MasonryGridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                      ),
                                      crossAxisSpacing: 6.0,
                                      mainAxisSpacing: 6.0,
                                      itemCount: imageList.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, imageListIndex) {
                                        final imageListItem =
                                            imageList[imageListIndex];
                                        return Visibility(
                                          visible: imageListIndex < 6,
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  '${FFAppConstants.ApiBaseUrl}/assets/${imageListItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                  width: 180.0,
                                                  height: 150.0,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.png',
                                                    width: 180.0,
                                                    height: 150.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              if ((newsfeedListRequireItem
                                                          .images.length >
                                                      6) &&
                                                  (imageListIndex == 5))
                                                Opacity(
                                                  opacity: 0.7,
                                                  child: Container(
                                                    width: 180.0,
                                                    height: 150.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      '+ ${formatNumber(
                                                        newsfeedListRequireItem
                                                                .images.length -
                                                            6,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .commaDecimal,
                                                      )}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
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
                          if (('1' == '2') &&
                              (newsfeedListRequireItem.videos.length > 0))
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Visibility(
                                visible: '1' == '2',
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Builder(
                                    builder: (context) {
                                      final videoList = newsfeedListRequireItem
                                          .videos
                                          .toList();

                                      return MasonryGridView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                        ),
                                        crossAxisSpacing: 6.0,
                                        mainAxisSpacing: 6.0,
                                        itemCount: videoList.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, videoListIndex) {
                                          final videoListItem =
                                              videoList[videoListIndex];
                                          return FlutterFlowVideoPlayer(
                                            path:
                                                '${FFAppConstants.ApiBaseUrl}/assets/${videoListItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                            videoType: VideoType.network,
                                            width: double.infinity,
                                            height: double.infinity,
                                            autoPlay: false,
                                            looping: false,
                                            showControls: false,
                                            allowFullScreen: true,
                                            allowPlaybackSpeedMenu: false,
                                            lazyLoad: true,
                                            pauseOnNavigate: false,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 6.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Color(0xFFF40A0A),
                                  size: 18.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: Text(
                                    newsfeedListRequireItem.reacts.length
                                        .toString(),
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
                                Icon(
                                  Icons.comment,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 18.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: Text(
                                    '${newsfeedListRequireItem.comments.length.toString()} bình luận',
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
                              ].divide(SizedBox(width: 3.0)),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (newsfeedListRequireItem.reacts
                                      .where((e) =>
                                          e.reactsId.staffId ==
                                          FFAppState().staffid)
                                      .toList()
                                      .length ==
                                  0)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await _model.reactCreated(
                                        context,
                                        newsId: newsfeedListRequireItem.id,
                                      );
                                      setState(() {});
                                      setState(() => _model
                                          .listViewPagingController
                                          ?.refresh());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 4.0, 8.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.favorite_border,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 20.0,
                                            ),
                                            Text(
                                              'Thích',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (newsfeedListRequireItem.reacts
                                      .where((e) =>
                                          e.reactsId.staffId ==
                                          FFAppState().staffid)
                                      .toList()
                                      .length >
                                  0)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await _model.reactDelete(
                                        context,
                                        reactId: newsfeedListRequireItem.reacts
                                            .where((e) =>
                                                e.reactsId.staffId ==
                                                FFAppState().staffid)
                                            .toList()
                                            .first
                                            .id,
                                      );
                                      setState(() {});
                                      setState(() => _model
                                          .listViewPagingController
                                          ?.refresh());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 4.0, 8.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.favorite,
                                              color: Color(0xFFF40A0A),
                                              size: 20.0,
                                            ),
                                            Text(
                                              'Thích',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 4.0)),
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
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: CommentNewsfeedWidget(
                                              comment: newsfeedListRequireItem
                                                  .comments,
                                              id: newsfeedListRequireItem.id,
                                              callBack: () async {
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
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(90.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 4.0, 8.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Nhập bình luận',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.tag_faces,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
