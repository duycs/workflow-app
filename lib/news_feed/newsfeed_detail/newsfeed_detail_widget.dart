import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/news_feed/action_newsfeed_detail/action_newsfeed_detail_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'newsfeed_detail_model.dart';
export 'newsfeed_detail_model.dart';

class NewsfeedDetailWidget extends StatefulWidget {
  const NewsfeedDetailWidget({
    super.key,
    required this.newsfeedId,
    this.checkpage,
  });

  final String? newsfeedId;
  final String? checkpage;

  @override
  State<NewsfeedDetailWidget> createState() => _NewsfeedDetailWidgetState();
}

class _NewsfeedDetailWidgetState extends State<NewsfeedDetailWidget>
    with TickerProviderStateMixin {
  late NewsfeedDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsfeedDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.getOneNewsfeed(context);
      setState(() {});
      _model.isLoad = true;
      setState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, -250.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-10.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 80.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 50.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 90.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
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
              if (widget.checkpage == 'newsfeed') {
                context.pushNamed(
                  'Newsfeed',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              } else if (widget.checkpage == 'newsfeedRequire') {
                context.pushNamed(
                  'NewsfeedListRequire',
                  queryParameters: {
                    'checkScope': serializeParam(
                      () {
                        if (_model.newsfeedItem?.departmentId != null) {
                          return 'Bộ phận';
                        } else if (_model.newsfeedItem?.branchId != null) {
                          return 'Chi nhánh';
                        } else {
                          return 'Tổ chức';
                        }
                      }(),
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
              } else {
                context.safePop();
              }
            },
          ),
          title: Text(
            'Chi tiết bảng tin',
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
          child: Stack(
            children: [
              if (_model.isLoad == false)
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.LoadingPageWidget(
                    width: double.infinity,
                    height: double.infinity,
                    size: 45.0,
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
              if (_model.isLoad == true)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  if ('1' == '2')
                                    SafeArea(
                                      child: Container(
                                        width: double.infinity,
                                        height: 230.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.network(
                                              '',
                                            ).image,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(16.0),
                                            bottomRight: Radius.circular(16.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                        ),
                                        child: Visibility(
                                          visible: _model
                                                  .newsfeedItem!.images.isNotEmpty,
                                          child: Builder(
                                            builder: (context) {
                                              final imageList = _model
                                                      .newsfeedItem?.images
                                                      .toList() ??
                                                  [];

                                              return FlutterFlowSwipeableStack(
                                                onSwipeFn: (index) {},
                                                onLeftSwipe: (index) {},
                                                onRightSwipe: (index) {},
                                                onUpSwipe: (index) {},
                                                onDownSwipe: (index) {},
                                                itemBuilder:
                                                    (context, imageListIndex) {
                                                  final imageListItem =
                                                      imageList[imageListIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              FlutterFlowExpandedImageView(
                                                            image:
                                                                Image.network(
                                                              '${FFAppConstants.ApiBaseUrl}/assets/${imageListItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            tag:
                                                                '${FFAppConstants.ApiBaseUrl}/assets/${imageListItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                            useHeroAnimation:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag:
                                                          '${FFAppConstants.ApiBaseUrl}/assets/${imageListItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          '${FFAppConstants.ApiBaseUrl}/assets/${imageListItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                itemCount: imageList.length,
                                                controller: _model
                                                    .swipeableStackController,
                                                loop: true,
                                                cardDisplayCount: 100,
                                                scale: 0.97,
                                                threshold: 1.0,
                                                maxAngle: 360.0,
                                                cardPadding:
                                                    const EdgeInsets.all(8.0),
                                                backCardOffset:
                                                    const Offset(4.0, 0.0),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation1']!),
                                  if (_model.newsfeedItem!.images.isNotEmpty)
                                    Container(
                                      height: 230.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(16.0),
                                          bottomRight: Radius.circular(16.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(0.0),
                                        ),
                                      ),
                                      child: Visibility(
                                        visible:
                                            _model.newsfeedItem!.images.isNotEmpty,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Builder(
                                            builder: (context) {
                                              final images = _model
                                                      .newsfeedItem?.images
                                                      .toList() ??
                                                  [];

                                              return SizedBox(
                                                width: double.infinity,
                                                height: 500.0,
                                                child: Stack(
                                                  children: [
                                                    PageView.builder(
                                                      controller: _model
                                                              .pageViewController ??=
                                                          PageController(
                                                              initialPage: max(
                                                                  0,
                                                                  min(
                                                                      0,
                                                                      images.length -
                                                                          1))),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: images.length,
                                                      itemBuilder: (context,
                                                          imagesIndex) {
                                                        final imagesItem =
                                                            images[imagesIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image: Image
                                                                      .network(
                                                                    '${FFAppConstants.ApiBaseUrl}/assets/${imagesItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    errorBuilder: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.png',
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag:
                                                                      '${FFAppConstants.ApiBaseUrl}/assets/${imagesItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag:
                                                                '${FFAppConstants.ApiBaseUrl}/assets/${imagesItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                '${FFAppConstants.ApiBaseUrl}/assets/${imagesItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                width: 300.0,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  width: 300.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: smooth_page_indicator
                                                            .SmoothPageIndicator(
                                                          controller: _model
                                                                  .pageViewController ??=
                                                              PageController(
                                                                  initialPage: max(
                                                                      0,
                                                                      min(
                                                                          0,
                                                                          images.length -
                                                                              1))),
                                                          count: images.length,
                                                          axisDirection:
                                                              Axis.horizontal,
                                                          onDotClicked:
                                                              (i) async {
                                                            await _model
                                                                .pageViewController!
                                                                .animateToPage(
                                                              i,
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      500),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                            setState(() {});
                                                          },
                                                          effect: smooth_page_indicator
                                                              .ExpandingDotsEffect(
                                                            expansionFactor:
                                                                2.0,
                                                            spacing: 4.0,
                                                            radius: 90.0,
                                                            dotWidth: 4.0,
                                                            dotHeight: 8.0,
                                                            dotColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            activeDotColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            paintStyle:
                                                                PaintingStyle
                                                                    .fill,
                                                          ),
                                                        ),
                                                      ),
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 2.0, 0.0, 0.0),
                                    child: Text(
                                      '${_model.newsfeedItem?.images.length.toString()} ảnh',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (_model.newsfeedItem?.title != null &&
                                _model.newsfeedItem?.title != '')
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Text(
                                  _model.newsfeedItem!.title,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation1']!),
                              ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 2.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final readList = _model
                                                .newsfeedItem?.reads
                                                .toList() ??
                                            [];

                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              readList.length, (readListIndex) {
                                            final readListItem =
                                                readList[readListIndex];
                                            return Visibility(
                                              visible: readListIndex < 3,
                                              child: Container(
                                                width: 25.0,
                                                height: 25.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  readListItem
                                                                  .readsId
                                                                  .staffId
                                                                  .userId
                                                                  .avatar !=
                                                              ''
                                                      ? '${FFAppConstants.ApiBaseUrl}/assets/${readListItem.readsId.staffId.userId.avatar}?access_token=${FFAppState().accessToken}'
                                                      : ' ',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          }).divide(
                                            const SizedBox(width: 2.0),
                                            filterFn: (readListIndex) {
                                              final readListItem =
                                                  readList[readListIndex];
                                              return readListIndex < 3;
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  if (_model.newsfeedItem!.reads.length > 3)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 2.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 25.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .alternate,
                                        icon: Icon(
                                          Icons.keyboard_control,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 10.0,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                  Text(
                                    '${_model.newsfeedItem?.reads.length.toString()} thành viên đã xem',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if ((_model.newsfeedItem!.reads
                                                    .where((e) =>
                                                        e.readsId.staffId.userId
                                                            .id ==
                                                        FFAppState().user.id)
                                                    .toList().isEmpty) &&
                                            (FFAppState().user.id !=
                                                _model.newsfeedItem?.userCreated
                                                    .id))
                                          FFButtonWidget(
                                            onPressed: () async {
                                              var shouldSetState = false;
                                              _model.confirmReaded =
                                                  await action_blocks
                                                      .tokenReload(context);
                                              shouldSetState = true;
                                              if (_model.confirmReaded!) {
                                                _model.apiResultConfirmReaded =
                                                    await NewsfeedGroup
                                                        .newsfeedConfirmReadedCall
                                                        .call(
                                                  accessToken:
                                                      FFAppState().accessToken,
                                                  newsId: widget.newsfeedId,
                                                  staffId: FFAppState().staffid,
                                                );

                                                shouldSetState = true;
                                                if ((_model
                                                        .apiResultConfirmReaded
                                                        ?.succeeded ??
                                                    true)) {
                                                  await _model
                                                      .getOneNewsfeed(context);
                                                  setState(() {});
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Lỗi',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                    ),
                                                  );
                                                }
                                              } else {
                                                setState(() {});
                                                if (shouldSetState) {
                                                  setState(() {});
                                                }
                                                return;
                                              }

                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                            },
                                            text: 'Xác nhận đã đọc',
                                            options: FFButtonOptions(
                                              height: 32.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        color: Colors.white,
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
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
                                                      'ProfileUserNew',
                                                      queryParameters: {
                                                        'staffId':
                                                            serializeParam(
                                                          _model
                                                              .newsfeedItem
                                                              ?.userCreated
                                                              .staffs
                                                              .first
                                                              .id,
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
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                    child: Image.network(
                                                      '${FFAppConstants.ApiBaseUrl}/assets/${_model.newsfeedItem?.userCreated.avatar}?access_token=${FFAppState().accessToken}',
                                                      width: 40.0,
                                                      height: 40.0,
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.png',
                                                        width: 40.0,
                                                        height: 40.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          _model
                                                              .newsfeedItem!
                                                              .userCreated
                                                              .firstName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Text(
                                                          dateTimeFormat(
                                                            'relative',
                                                            functions.stringToDateTime(
                                                                _model
                                                                    .newsfeedItem
                                                                    ?.dateCreated),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                if (_model.newsfeedItem
                                                        ?.userCreated.id ==
                                                    FFAppState().user.id)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_control_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20.0,
                                                    ),
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        useSafeArea: true,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  ActionNewsfeedDetailWidget(
                                                                newsFeedList: _model
                                                                    .newsfeedItem!,
                                                                callback:
                                                                    () async {
                                                                  await _model
                                                                      .getOneNewsfeed(
                                                                          context);

                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (_model.newsfeedItem?.content !=
                                                  null &&
                                              _model.newsfeedItem?.content !=
                                                  '')
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                              child: Text(
                                                _model.newsfeedItem!.content,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'textOnPageLoadAnimation2']!),
                                            ),
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                final videoList = _model
                                                        .newsfeedItem?.videos
                                                        .toList() ??
                                                    [];

                                                return MasonryGridView.builder(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  gridDelegate:
                                                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                  ),
                                                  crossAxisSpacing: 6.0,
                                                  mainAxisSpacing: 6.0,
                                                  itemCount: videoList.length,
                                                  shrinkWrap: true,
                                                  itemBuilder: (context,
                                                      videoListIndex) {
                                                    final videoListItem =
                                                        videoList[
                                                            videoListIndex];
                                                    return FlutterFlowVideoPlayer(
                                                      path:
                                                          '${FFAppConstants.ApiBaseUrl}/assets/${videoListItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                      videoType:
                                                          VideoType.network,
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      autoPlay: false,
                                                      looping: true,
                                                      showControls: true,
                                                      allowFullScreen: true,
                                                      allowPlaybackSpeedMenu:
                                                          false,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          if (_model
                                                  .newsfeedItem!.files.isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Icon(
                                                    Icons.attach_file_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 18.0,
                                                  ),
                                                  Text(
                                                    'File khác:',
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
                                                ],
                                              ),
                                            ),
                                          Builder(
                                            builder: (context) {
                                              final fileList = _model
                                                      .newsfeedItem?.files
                                                      .toList() ??
                                                  [];

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: fileList.length,
                                                itemBuilder:
                                                    (context, fileListIndex) {
                                                  final fileListItem =
                                                      fileList[fileListIndex];
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      if ((((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'doc') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'docx') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'rtf') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'txt') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'odt') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'docm'))
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/images.png',
                                                            width: 35.0,
                                                            height: 35.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      if ((((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'xls') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'xlsx') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'xlsm') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'xlsb') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'csv') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'xltx') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'xltm') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'ods') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'xml'))
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/excel.png',
                                                            width: 35.0,
                                                            height: 35.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      if ((((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'ppt') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'pptx') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'pptm') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'potx') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'potm') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'ppsx') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'ppsm') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'odp'))
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/ppt.png',
                                                            width: 35.0,
                                                            height: 35.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      if ((((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'pdf') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'pdfa') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'pdfx') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'pdft') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'pdfvt') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'pdfua'))
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/pdf.png',
                                                            width: 35.0,
                                                            height: 35.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      if ((((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'jpeg') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'png') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'gif') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'jpg') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'bmp') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'tiff') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'tif') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'raw') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'webp') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'svg') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                              'heic') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(fileListItem.directusFilesId.filenameDownload)) ==
                                                              'heif'))
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/9967614.png',
                                                            width: 35.0,
                                                            height: 35.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Tài liệu',
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
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons.download_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          await actions
                                                              .downloadFile(
                                                            '${FFAppConstants.ApiBaseUrl}/assets/${fileListItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                            fileListItem.id
                                                                .toString(),
                                                            fileListItem
                                                                .directusFilesId
                                                                .filenameDownload,
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (_model.newsfeedItem!.reacts
                                                        .where((e) =>
                                                            (_model.newsfeedItem !=
                                                                    null
                                                                ? e.reactsId
                                                                    .staffId
                                                                : ' ') ==
                                                            FFAppState()
                                                                .staffid)
                                                        .toList().isEmpty)
                                                  FlutterFlowIconButton(
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.favorite_border,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      await _model
                                                          .reactNewsfeed(
                                                        context,
                                                        newsId:
                                                            widget.newsfeedId,
                                                      );
                                                      setState(() {});
                                                      await _model
                                                          .getOneNewsfeed(
                                                              context);
                                                      setState(() {});
                                                    },
                                                  ),
                                                if (_model.newsfeedItem!.reacts
                                                        .where((e) =>
                                                            (_model.newsfeedItem !=
                                                                    null
                                                                ? e.reactsId
                                                                    .staffId
                                                                : ' ') ==
                                                            FFAppState()
                                                                .staffid)
                                                        .toList().isNotEmpty)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: const Icon(
                                                      Icons.favorite,
                                                      color: Color(0xFFFF0404),
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      await _model.deleteReact(
                                                        context,
                                                        reactId: _model
                                                            .newsfeedItem
                                                            ?.reacts
                                                            .where((e) =>
                                                                e.reactsId
                                                                    .staffId ==
                                                                FFAppState()
                                                                    .staffid)
                                                            .toList()
                                                            .first
                                                            .id,
                                                      );
                                                      setState(() {});
                                                      await _model
                                                          .getOneNewsfeed(
                                                              context);
                                                      setState(() {});
                                                    },
                                                  ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    _model.newsfeedItem?.reacts
                                                        .length
                                                        .toString(),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'thích',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 4.0, 0.0),
                                                  child: Icon(
                                                    Icons.mode_comment_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      _model.newsfeedItem
                                                          ?.comments.length
                                                          .toString(),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Bình luận',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
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
                                  if (_model.newsfeedItem!.comments.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 0.0, 0.0),
                                      child: Text(
                                        'Tất cả bình luận',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final commentList = _model
                                                .newsfeedItem?.comments
                                                .toList() ??
                                            [];

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children:
                                              List.generate(commentList.length,
                                                  (commentListIndex) {
                                            final commentListItem =
                                                commentList[commentListIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
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
                                                        'ProfileUserNew',
                                                        queryParameters: {
                                                          'staffId':
                                                              serializeParam(
                                                            commentListItem
                                                                .commentsId
                                                                .staffId
                                                                .id,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
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
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                      child: Image.network(
                                                        '${FFAppConstants.ApiBaseUrl}/assets/${commentListItem.commentsId.staffId.userId.avatar}?access_token=${FFAppState().accessToken}',
                                                        width: 35.0,
                                                        height: 35.0,
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.png',
                                                          width: 35.0,
                                                          height: 35.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.75,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .stretch,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            8.0,
                                                                            0.0,
                                                                            4.0),
                                                                        child:
                                                                            Text(
                                                                          commentListItem
                                                                              .commentsId
                                                                              .staffId
                                                                              .userId
                                                                              .firstName,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (commentListItem
                                                                            .commentsId
                                                                            .staffId
                                                                            .userId
                                                                            .id ==
                                                                        FFAppState()
                                                                            .user
                                                                            .id)
                                                                      FlutterFlowIconButton(
                                                                        borderRadius:
                                                                            20.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            40.0,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .delete_outline,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    title: const Text('Xác nhận'),
                                                                                    content: const Text('Bạn chắc chắn muốn xóa'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                        child: const Text('Hủy'),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                        child: const Text('Xác nhận'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              ) ??
                                                                              false;
                                                                          if (confirmDialogResponse) {
                                                                            await _model.deleteComment(
                                                                              context,
                                                                              id: commentListItem.id,
                                                                            );
                                                                            await _model.getOneNewsfeed(context);
                                                                            setState(() {});
                                                                          } else {
                                                                            return;
                                                                          }
                                                                        },
                                                                      ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    commentListItem
                                                                        .commentsId
                                                                        .content,
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
                                                                ),
                                                                if (commentListItem
                                                                            .commentsId
                                                                            .image !=
                                                                        '')
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            4.0,
                                                                            6.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        '${FFAppConstants.ApiBaseUrl}/assets/${commentListItem.commentsId.image}?access_token=${FFAppState().accessToken}',
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            150.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (commentListItem
                                                                            .commentsId
                                                                            .video !=
                                                                        '')
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            6.0,
                                                                            6.0,
                                                                            0.0),
                                                                    child:
                                                                        FlutterFlowVideoPlayer(
                                                                      path:
                                                                          '${FFAppConstants.ApiBaseUrl}/assets/${commentListItem.commentsId.video}?access_token=${FFAppState().accessToken}',
                                                                      videoType:
                                                                          VideoType
                                                                              .network,
                                                                      width: double
                                                                          .infinity,
                                                                      autoPlay:
                                                                          false,
                                                                      looping:
                                                                          true,
                                                                      showControls:
                                                                          true,
                                                                      allowFullScreen:
                                                                          true,
                                                                      allowPlaybackSpeedMenu:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                if ('1' == '2')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      if ((((String type) {
                                                                                return type.split('.').last;
                                                                              }(commentListItem.commentsId.file)) ==
                                                                              'doc') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(commentListItem.commentsId.file)) ==
                                                                              'docx') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(commentListItem.commentsId.file)) ==
                                                                              'rtf') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(commentListItem.commentsId.file)) ==
                                                                              'txt') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(commentListItem.commentsId.file)) ==
                                                                              'odt') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(commentListItem.commentsId.file)) ==
                                                                              'docm'))
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/images.png',
                                                                            width:
                                                                                35.0,
                                                                            height:
                                                                                35.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        ),
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/excel.png',
                                                                          width:
                                                                              35.0,
                                                                          height:
                                                                              35.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/ppt.png',
                                                                          width:
                                                                              35.0,
                                                                          height:
                                                                              35.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/pdf.png',
                                                                          width:
                                                                              35.0,
                                                                          height:
                                                                              35.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/9967614.png',
                                                                          width:
                                                                              35.0,
                                                                          height:
                                                                              35.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Tài liệu',
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Nunito Sans',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  lineHeight: 1.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            20.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            40.0,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .download_sharp,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          await actions
                                                                              .downloadFile(
                                                                            '${FFAppConstants.ApiBaseUrl}/assets/${commentListItem.commentsId.file}?access_token=${FFAppState().accessToken}',
                                                                            commentListItem.id.toString(),
                                                                            commentListItem.commentsId.file,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                            'relative',
                                                            functions.stringToDateTime(
                                                                commentListItem
                                                                    .commentsId
                                                                    .dateCreated),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['columnOnPageLoadAnimation']!),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if ((_model.uploadedLocalFile1.bytes?.isNotEmpty ?? false))
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 10.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.memory(
                                  _model.uploadedLocalFile1.bytes ??
                                      Uint8List.fromList([]),
                                  width: 60.0,
                                  height: 50.0,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(
                                    'assets/images/error_image.png',
                                    width: 60.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 45.0,
                                icon: Icon(
                                  Icons.close,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    _model.isDataUploading1 = false;
                                    _model.uploadedLocalFile1 = FFUploadedFile(
                                        bytes: Uint8List.fromList([]));
                                  });
                                },
                              ),
                            ].divide(const SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                    if ((_model.uploadedLocalFile2.bytes?.isNotEmpty ?? false))
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  functions.fileName(_model.uploadedLocalFile2),
                                  'Loading',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 45.0,
                                icon: Icon(
                                  Icons.close,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    _model.isDataUploading2 = false;
                                    _model.uploadedLocalFile2 = FFUploadedFile(
                                        bytes: Uint8List.fromList([]));
                                  });
                                },
                              ),
                            ].divide(const SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                    if ((_model.uploadedLocalFile3.bytes?.isNotEmpty ?? false))
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  functions.fileName(_model.uploadedLocalFile3),
                                  'Loading',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 45.0,
                                icon: Icon(
                                  Icons.close,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    _model.isDataUploading3 = false;
                                    _model.uploadedLocalFile3 = FFUploadedFile(
                                        bytes: Uint8List.fromList([]));
                                  });
                                },
                              ),
                            ].divide(const SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                    if (_model.checkIcon == true)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 6.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        allowPhoto: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading1 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();
                                        } finally {
                                          _model.isDataUploading1 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile1 =
                                                selectedUploadedFiles.first;
                                          });
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                      }
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/9967614.png',
                                        width: 30.0,
                                        height: 30.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 6.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        allowPhoto: false,
                                        allowVideo: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading2 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();
                                        } finally {
                                          _model.isDataUploading2 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile2 =
                                                selectedUploadedFiles.first;
                                          });
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                      }
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/10764003.png',
                                        width: 30.0,
                                        height: 30.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                if ('1' == '2')
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 6.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final selectedFiles = await selectFiles(
                                          multiFile: false,
                                        );
                                        if (selectedFiles != null) {
                                          setState(() =>
                                              _model.isDataUploading3 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedFiles
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading3 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedFiles.length) {
                                            setState(() {
                                              _model.uploadedLocalFile3 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/th_(1).jpg',
                                          width: 30.0,
                                          height: 30.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          _model.checkIcon = false;
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(const SizedBox(width: 4.0)),
                            ),
                          ),
                        ),
                      ),
                    Container(
                      width: double.infinity,
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 24.0,
                                  borderWidth: 1.0,
                                  buttonSize: 45.0,
                                  icon: Icon(
                                    Icons.mood,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 28.0,
                                  ),
                                  onPressed: () async {
                                    _model.checkIcon = true;
                                    setState(() {});
                                  },
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Viết bình luận...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
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
                                FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.send_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    if (!((_model.textController.text != '') ||
                                        ((_model.uploadedLocalFile1.bytes
                                                    ?.isNotEmpty ??
                                                false)) ||
                                        ((_model.uploadedLocalFile2.bytes
                                                    ?.isNotEmpty ??
                                                false)) ||
                                        ((_model.uploadedLocalFile3.bytes
                                                    ?.isNotEmpty ??
                                                false)))) {
                                      return;
                                    }
                                    if ((_model.uploadedLocalFile1.bytes
                                                ?.isNotEmpty ??
                                            false)) {
                                      await _model.postDataUploadImage(context);
                                      setState(() {});
                                    }
                                    if ((_model.uploadedLocalFile2.bytes
                                                ?.isNotEmpty ??
                                            false)) {
                                      await _model.postDataVideo(context);
                                      setState(() {});
                                    }
                                    if ((_model.uploadedLocalFile3.bytes
                                                ?.isNotEmpty ??
                                            false)) {
                                      await _model.postDataFile(context);
                                      setState(() {});
                                    }
                                    await _model.postDataComment(context);
                                    setState(() {});
                                    setState(() {
                                      _model.textController?.clear();
                                    });
                                    setState(() {
                                      _model.isDataUploading1 = false;
                                      _model.uploadedLocalFile1 =
                                          FFUploadedFile(
                                              bytes: Uint8List.fromList([]));
                                    });

                                    setState(() {
                                      _model.isDataUploading3 = false;
                                      _model.uploadedLocalFile3 =
                                          FFUploadedFile(
                                              bytes: Uint8List.fromList([]));
                                    });

                                    setState(() {
                                      _model.isDataUploading2 = false;
                                      _model.uploadedLocalFile2 =
                                          FFUploadedFile(
                                              bytes: Uint8List.fromList([]));
                                    });

                                    _model.uploadImage = '';
                                    _model.uploadVideo = '';
                                    _model.uploadFile = '';
                                    setState(() {});
                                    await _model.getOneNewsfeed(context);
                                    setState(() {});

                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation2']!),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
