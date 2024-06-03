import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'do_action_type_to_do_list_model.dart';
export 'do_action_type_to_do_list_model.dart';

class DoActionTypeToDoListWidget extends StatefulWidget {
  const DoActionTypeToDoListWidget({
    super.key,
    this.listdata,
    this.callback,
  });

  final OperationListStruct? listdata;
  final Future Function(String? status, String? operationId)? callback;

  @override
  State<DoActionTypeToDoListWidget> createState() =>
      _DoActionTypeToDoListWidgetState();
}

class _DoActionTypeToDoListWidgetState
    extends State<DoActionTypeToDoListWidget> {
  late DoActionTypeToDoListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoActionTypeToDoListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Theme(
          data: ThemeData(
            checkboxTheme: CheckboxThemeData(
              visualDensity: VisualDensity.compact,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
          ),
          child: Checkbox(
            value: _model.checkboxValue ??=
                widget.listdata?.operationsId?.status == 'done',
            onChanged: (newValue) async {
              setState(() => _model.checkboxValue = newValue!);
              if (newValue!) {
                var confirmDialogResponse = await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return WebViewAware(
                          child: AlertDialog(
                            content: Text('Xác nhận đã thực hiện!'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('Đóng'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('Xác nhận'),
                              ),
                            ],
                          ),
                        );
                      },
                    ) ??
                    false;
                if (confirmDialogResponse) {
                  await widget.callback?.call(
                    'done',
                    widget.listdata?.operationsId?.id,
                  );
                } else {
                  setState(() {
                    _model.checkboxValue =
                        widget.listdata?.operationsId?.status == 'done';
                  });
                }
              } else {
                var confirmDialogResponse = await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return WebViewAware(
                          child: AlertDialog(
                            content: Text('Xác nhận chưa thực hiện!'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('Đóng'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('Xác nhận'),
                              ),
                            ],
                          ),
                        );
                      },
                    ) ??
                    false;
                if (confirmDialogResponse) {
                  await widget.callback?.call(
                    'published',
                    widget.listdata?.operationsId?.id,
                  );
                } else {
                  setState(() {
                    _model.checkboxValue = true;
                  });
                }
              }
            },
            side: BorderSide(
              width: 2,
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
            activeColor: FlutterFlowTheme.of(context).primary,
            checkColor: FlutterFlowTheme.of(context).info,
          ),
        ),
        Expanded(
          child: Text(
            widget.listdata!.operationsId.content,
            maxLines: 5,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Nunito Sans',
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ].divide(SizedBox(width: 8.0)),
    );
  }
}
