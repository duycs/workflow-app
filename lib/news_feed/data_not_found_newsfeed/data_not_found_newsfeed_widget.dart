import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'data_not_found_newsfeed_model.dart';
export 'data_not_found_newsfeed_model.dart';

class DataNotFoundNewsfeedWidget extends StatefulWidget {
  const DataNotFoundNewsfeedWidget({
    super.key,
    this.parameter1,
    bool? parameter2,
  }) : this.parameter2 = parameter2 ?? false;

  final int? parameter1;
  final bool parameter2;

  @override
  State<DataNotFoundNewsfeedWidget> createState() =>
      _DataNotFoundNewsfeedWidgetState();
}

class _DataNotFoundNewsfeedWidgetState
    extends State<DataNotFoundNewsfeedWidget> {
  late DataNotFoundNewsfeedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DataNotFoundNewsfeedModel());

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/pngtree-flat-writing-on-notes-icon--vector-png-image_327602.jpg',
                width: 120.0,
                height: 80.0,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              'Chưa có bài đăng nào',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nunito Sans',
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
