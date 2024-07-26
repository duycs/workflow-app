import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/order/invite_user/invite_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_success_component_model.dart';
export 'payment_success_component_model.dart';

class PaymentSuccessComponentWidget extends StatefulWidget {
  const PaymentSuccessComponentWidget({
    super.key,
    required this.programId,
    required this.checkType,
  });

  final String? programId;
  final String? checkType;

  @override
  State<PaymentSuccessComponentWidget> createState() =>
      _PaymentSuccessComponentWidgetState();
}

class _PaymentSuccessComponentWidgetState
    extends State<PaymentSuccessComponentWidget> {
  late PaymentSuccessComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentSuccessComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle_outline,
            color: Color(0xFF19DB8A),
            size: 70.0,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 0.0),
            child: Text(
              'Thanh toán thành công!',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily: 'Nunito Sans',
                    color: Color(0xFF14181B),
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
            child: Text(
              'Đơn hàng của bạn đã được thanh toán thành công. Hãy trải nghiệm ngay khóa học của bạn!',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nunito Sans',
                    color: Color(0xFF57636C),
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
            child: FFButtonWidget(
              onPressed: () async {
                context.pushNamed(
                  'StudyProgramListMarket',
                  queryParameters: {
                    'checkpage': serializeParam(
                      widget!.checkType,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
              text: 'Mở khóa học đã mua',
              options: FFButtonOptions(
                width: double.infinity,
                height: 55.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFF19DB8A),
                textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Nunito Sans',
                      color: Colors.white,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
                elevation: 2.0,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          if (false)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: InviteUserWidget(
                          programId: widget!.programId!,
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                text: 'Chia sẻ cho thành viên khác',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 55.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Nunito Sans',
                        color: Colors.white,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
