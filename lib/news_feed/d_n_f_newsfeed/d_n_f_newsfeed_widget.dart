import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'd_n_f_newsfeed_model.dart';
export 'd_n_f_newsfeed_model.dart';

class DNFNewsfeedWidget extends StatefulWidget {
  const DNFNewsfeedWidget({super.key});

  @override
  State<DNFNewsfeedWidget> createState() => _DNFNewsfeedWidgetState();
}

class _DNFNewsfeedWidgetState extends State<DNFNewsfeedWidget> {
  late DNFNewsfeedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DNFNewsfeedModel());

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
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 32.0),
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
