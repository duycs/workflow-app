import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'ckeditor_create_lesson_model.dart';
export 'ckeditor_create_lesson_model.dart';

class CkeditorCreateLessonWidget extends StatefulWidget {
  const CkeditorCreateLessonWidget({
    super.key,
    required this.input,
    required this.output,
    required this.callBack,
  });

  final String? input;
  final String? output;
  final Future Function(String? input, String? output)? callBack;

  @override
  State<CkeditorCreateLessonWidget> createState() =>
      _CkeditorCreateLessonWidgetState();
}

class _CkeditorCreateLessonWidgetState
    extends State<CkeditorCreateLessonWidget> {
  late CkeditorCreateLessonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CkeditorCreateLessonModel());
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
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: const AlignmentDirectional(1.0, -1.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await widget.callBack?.call(
                      widget.output != null && widget.output != ''
                          ? widget.output
                          : '',
                      _model.check,
                    );
                    Navigator.pop(context);
                  },
                  text: 'Lưu',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Nunito Sans',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'Đóng',
                icon: const Icon(
                  Icons.close_sharp,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Nunito Sans',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 0.9,
              child: custom_widgets.CKEditor(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.9,
                initialData: widget.output != null && widget.output != ''
                    ? widget.output!
                    : '',
                action: (data) async {
                  setState(() {
                    _model.check = data;
                  });
                },
              ),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text(_model.check),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: const Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            },
            text: 'Hoàn tất5555',
            options: FFButtonOptions(
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Nunito Sans',
                    color: Colors.white,
                    letterSpacing: 0.0,
                  ),
              elevation: 3.0,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ],
      ),
    );
  }
}
