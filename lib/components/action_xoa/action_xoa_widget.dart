import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'action_xoa_model.dart';
export 'action_xoa_model.dart';

class ActionXoaWidget extends StatefulWidget {
  const ActionXoaWidget({super.key});

  @override
  State<ActionXoaWidget> createState() => _ActionXoaWidgetState();
}

class _ActionXoaWidgetState extends State<ActionXoaWidget> {
  late ActionXoaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActionXoaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x2B202529),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: _model.setColor == 1
                      ? FlutterFlowTheme.of(context).alternate
                      : FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.delete_forever,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  title: Text(
                    'Xóa',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Nunito Sans',
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
