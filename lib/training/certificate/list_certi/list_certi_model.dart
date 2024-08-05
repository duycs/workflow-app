import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'list_certi_widget.dart' show ListCertiWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListCertiModel extends FlutterFlowModel<ListCertiWidget> {
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future addCertificatesToTheProgram(BuildContext context) async {
    ApiCallResponse? apiResultAdd;
    bool? checkRefreshTokenBlock;

    apiResultAdd = await CertificateGroup.programsCall.call(
      accessToken: FFAppState().accessToken,
      idProgram: widget!.idProgram,
      certificateId: '1ff8e3e4-fc53-4fe6-819a-db98d4785ef3',
    );

    if ((apiResultAdd?.succeeded ?? true)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Áp dụng chứng chỉ thành công!',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
      Navigator.pop(context);
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultAdd?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await addCertificatesToTheProgram(context);
      }
    }
  }

  Future addCertificatesToTheProgram1(BuildContext context) async {
    ApiCallResponse? apiResultAdd1;
    bool? checkRefreshTokenBlock123;

    apiResultAdd1 = await CertificateGroup.programsCall.call(
      accessToken: FFAppState().accessToken,
      idProgram: widget!.idProgram,
      certificateId: '22e2144b-e206-4bf6-a22e-110088325e14',
    );

    if ((apiResultAdd1?.succeeded ?? true)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Áp dụng chứng chỉ thành công!',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
      Navigator.pop(context);
    } else {
      checkRefreshTokenBlock123 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultAdd1?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock123!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await addCertificatesToTheProgram1(context);
      }
    }
  }
}
