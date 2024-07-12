import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'staff_detail_model.dart';
export 'staff_detail_model.dart';

class StaffDetailWidget extends StatefulWidget {
  const StaffDetailWidget({
    super.key,
    this.staffDetail,
  });

  final dynamic staffDetail;

  @override
  State<StaffDetailWidget> createState() => _StaffDetailWidgetState();
}

class _StaffDetailWidgetState extends State<StaffDetailWidget> {
  late StaffDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StaffDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.staffDetail != null) {
        _model.getStaffInfoToken = await action_blocks.tokenReload(context);
        if (_model.getStaffInfoToken!) {
          _model.apiResultGetStaffInfo = await UserGroup.getStaffIdCall.call(
            accessToken: FFAppState().accessToken,
            userId:
                StaffListStruct.maybeFromMap(widget.staffDetail)?.userId.id,
          );

          if ((_model.apiResultGetStaffInfo?.succeeded ?? true)) {
            _model.staffData = functions.stringToJson(getJsonField(
              (_model.apiResultGetStaffInfo?.jsonBody ?? ''),
              r'''$.staff''',
            ).toString().toString());
            _model.department = functions.stringToJson(getJsonField(
              (_model.apiResultGetStaffInfo?.jsonBody ?? ''),
              r'''$.department''',
            ).toString().toString());
            _model.branch = functions.stringToJson(getJsonField(
              (_model.apiResultGetStaffInfo?.jsonBody ?? ''),
              r'''$.branch''',
            ).toString().toString());
            setState(() {});
          }
        } else {
          setState(() {});
        }
      }
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
            context.pop();
          },
        ),
        title: Text(
          'Thông tin nhân viên',
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.network(
                                            '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                              widget.staffDetail,
                                              r'''$.user_id.avatar''',
                                            ).toString()}?access_token=${FFAppState().accessToken}',
                                            fit: BoxFit.contain,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          allowRotation: false,
                                          tag:
                                              '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                            widget.staffDetail,
                                            r'''$.user_id.avatar''',
                                          ).toString()}?access_token=${FFAppState().accessToken}',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag:
                                        '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                      widget.staffDetail,
                                      r'''$.user_id.avatar''',
                                    ).toString()}?access_token=${FFAppState().accessToken}',
                                    transitionOnUserGestures: true,
                                    child: Container(
                                      width: 90.0,
                                      height: 90.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                          widget.staffDetail,
                                          r'''$.user_id.avatar''',
                                        ).toString()}?access_token=${FFAppState().accessToken}',
                                        fit: BoxFit.fitWidth,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.png',
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.drive_file_rename_outline,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    Text(
                                      'Tên nhân viên:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        getJsonField(
                                          widget.staffDetail,
                                          r'''$.user_id.first_name''',
                                        ).toString(),
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 4.0)),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.mail_outline,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    Text(
                                      'Email:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        getJsonField(
                                          widget.staffDetail,
                                          r'''$.user_id.email''',
                                        ).toString(),
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 4.0)),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    Text(
                                      'Số điện thoại:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        getJsonField(
                                                  widget.staffDetail,
                                                  r'''$.phone''',
                                                ).toString() ==
                                                'undefined'
                                            ? ' '
                                            : getJsonField(
                                                widget.staffDetail,
                                                r'''$.phone''',
                                              ).toString(),
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 4.0)),
                                ),
                              ),
                              if ((getJsonField(
                                        widget.staffDetail,
                                        r'''$.cccd''',
                                      ) !=
                                      null) &&
                                  (getJsonField(
                                        widget.staffDetail,
                                        r'''$.cccd''',
                                      ).toString() !=
                                      'undefined'))
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.credit_card,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      Text(
                                        'Căn cước công dân:',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          getJsonField(
                                            widget.staffDetail,
                                            r'''$.cccd''',
                                          ).toString(),
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 4.0)),
                                  ),
                                ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    Text(
                                      'Ngày sinh:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        dateTimeFormat(
                                          'dd/MM/yyyy',
                                          functions
                                              .stringToDateTime(getJsonField(
                                            widget.staffDetail,
                                            r'''$.dob''',
                                          ).toString()),
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 4.0)),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.transgender_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    Text(
                                      'Giới tính:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        () {
                                          if (getJsonField(
                                                widget.staffDetail,
                                                r'''$.gender''',
                                              ).toString() ==
                                              'male') {
                                            return 'Nam';
                                          } else if (getJsonField(
                                                widget.staffDetail,
                                                r'''$.gender''',
                                              ).toString() ==
                                              'undefined') {
                                            return ' ';
                                          } else {
                                            return 'Nữ';
                                          }
                                        }(),
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 4.0)),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.settings_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    Text(
                                      'Chức vụ:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        getJsonField(
                                          widget.staffDetail,
                                          r'''$.title''',
                                        ).toString(),
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 4.0)),
                                ),
                              ),
                              if (getJsonField(
                                    widget.staffDetail,
                                    r'''$.user_id.role''',
                                  ).toString() !=
                                  '82073000-1ba2-43a4-a55c-459d17c23b68')
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.business_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      Text(
                                        'Chi nhánh:',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          getJsonField(
                                            widget.staffDetail,
                                            r'''$.branch_id.name''',
                                          ).toString(),
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 4.0)),
                                  ),
                                ),
                              if ((getJsonField(
                                        widget.staffDetail,
                                        r'''$.user_id.role''',
                                      ).toString() !=
                                      '82073000-1ba2-43a4-a55c-459d17c23b68') &&
                                  (getJsonField(
                                        widget.staffDetail,
                                        r'''$.user_id.role''',
                                      ).toString() !=
                                      'a8d33527-375b-4599-ac70-6a3fcad1de39'))
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Visibility(
                                    visible: getJsonField(
                                          widget.staffDetail,
                                          r'''$.department_id.name''',
                                        ) !=
                                        null,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.meeting_room,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        Text(
                                          'Bộ phận:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            getJsonField(
                                              widget.staffDetail,
                                              r'''$.department_id.name''',
                                            ).toString(),
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 4.0)),
                                    ),
                                  ),
                                ),
                              if ((getJsonField(
                                        widget.staffDetail,
                                        r'''$.user_id.role''',
                                      ).toString() !=
                                      '82073000-1ba2-43a4-a55c-459d17c23b68') &&
                                  (getJsonField(
                                        widget.staffDetail,
                                        r'''$.user_id.role''',
                                      ).toString() !=
                                      'a8d33527-375b-4599-ac70-6a3fcad1de39'))
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.radio_button_checked,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      Text(
                                        'Trạng thái hoạt động:',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          getJsonField(
                                                    widget.staffDetail,
                                                    r'''$.status''',
                                                  ).toString() ==
                                                  'active'
                                              ? 'Hoạt động'
                                              : 'Không hoạt động',
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 4.0)),
                                  ),
                                ),
                            ].divide(const SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.05),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 16.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (Navigator.of(context).canPop()) {
                      context.pop();
                    }
                    context.pushNamed(
                      'StaffUpdate',
                      queryParameters: {
                        'staffDetail': serializeParam(
                          widget.staffDetail,
                          ParamType.JSON,
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
                  text: 'Chỉnh sửa',
                  options: FFButtonOptions(
                    width: 270.0,
                    height: 50.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: 'Nunito Sans',
                              color: Colors.white,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                    elevation: 2.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
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
