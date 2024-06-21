import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'payment_succes_exception_component_model.dart';
export 'payment_succes_exception_component_model.dart';

class PaymentSuccesExceptionComponentWidget extends StatefulWidget {
  const PaymentSuccesExceptionComponentWidget({super.key});

  @override
  State<PaymentSuccesExceptionComponentWidget> createState() =>
      _PaymentSuccesExceptionComponentWidgetState();
}

class _PaymentSuccesExceptionComponentWidgetState
    extends State<PaymentSuccesExceptionComponentWidget> {
  late PaymentSuccesExceptionComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentSuccesExceptionComponentModel());
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
            color: FlutterFlowTheme.of(context).tertiary,
            size: 100.0,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 0.0),
            child: Text(
              'Thanh toán thành công!',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily: 'Inter',
                    color: const Color(0xFF14181B),
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
            child: Text(
              'Chúc mừng bạn đã thanh toán thành công. Tuy nhiên đã gặp sự cố trong khi tạo đơn hàng cho bạn. Vui lòng liên hệ Hotline để được hỗ trợ!',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: const Color(0xFF57636C),
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
            child: Text(
              'Xin lỗi bạn vì sự bất tiện này!',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: const Color(0xFF57636C),
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
            child: FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: 'Mở bài học',
              options: FFButtonOptions(
                width: double.infinity,
                height: 55.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).tertiary,
                textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontSize: 16.0,
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
