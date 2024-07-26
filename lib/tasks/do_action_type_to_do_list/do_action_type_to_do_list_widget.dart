import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
            unselectedWidgetColor: FlutterFlowTheme.of(context).primaryText,
          ),
          child: Checkbox(
            value: _model.checkboxValue ??=
                widget.listdata?.operationsId.status == 'done',
            onChanged: (newValue) async {
              setState(() => _model.checkboxValue = newValue!);
              if (newValue!) {
                var confirmDialogResponse = await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          content: const Text('Xác nhận đã thực hiện!'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, false),
                              child: const Text('Đóng'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, true),
                              child: const Text('Xác nhận'),
                            ),
                          ],
                        );
                      },
                    ) ??
                    false;
                if (confirmDialogResponse) {
                  await widget.callback?.call(
                    'done',
                    widget.listdata?.operationsId.id,
                  );
                } else {
                  setState(() {
                    _model.checkboxValue =
                        widget.listdata?.operationsId.status == 'done';
                  });
                }
              } else {
                var confirmDialogResponse = await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          content: const Text('Xác nhận chưa thực hiện!'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, false),
                              child: const Text('Đóng'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, true),
                              child: const Text('Xác nhận'),
                            ),
                          ],
                        );
                      },
                    ) ??
                    false;
                if (confirmDialogResponse) {
                  await widget.callback?.call(
                    'published',
                    widget.listdata?.operationsId.id,
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
              color: FlutterFlowTheme.of(context).primaryText,
            ),
            activeColor: FlutterFlowTheme.of(context).primary,
            checkColor: FlutterFlowTheme.of(context).secondaryBackground,
          ),
        ),
        Expanded(
          child: Text(
            widget.listdata!.operationsId.content,
            maxLines: 5,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Nunito Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ].divide(const SizedBox(width: 8.0)),
    );
  }
}
