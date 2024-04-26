import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detail_action_type_to_do_list_model.dart';
export 'detail_action_type_to_do_list_model.dart';

class DetailActionTypeToDoListWidget extends StatefulWidget {
  const DetailActionTypeToDoListWidget({
    super.key,
    this.listData,
    this.data,
    this.callback,
  });

  final OperationListStruct? listData;
  final TaskListStruct? data;
  final Future Function(String? operationId, String? status)? callback;

  @override
  State<DetailActionTypeToDoListWidget> createState() =>
      _DetailActionTypeToDoListWidgetState();
}

class _DetailActionTypeToDoListWidgetState
    extends State<DetailActionTypeToDoListWidget> {
  late DetailActionTypeToDoListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailActionTypeToDoListModel());
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
                widget.listData?.operationsId?.status == 'done',
            onChanged: (((widget.data?.status == 'todo') &&
                        (widget.data?.current == 0)) ||
                    (widget.data?.status == 'done'))
                ? null
                : (newValue) async {
                    setState(() => _model.checkboxValue = newValue!);
                    if (newValue!) {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Bạn chắc không?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('Không'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Có'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        await widget.callback?.call(
                          widget.listData?.operationsId?.id,
                          'done',
                        );
                      } else {
                        setState(() {
                          _model.checkboxValue =
                              widget.listData?.operationsId?.status == 'done';
                        });
                      }
                    } else {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Bạn chắc không?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('Không'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Có'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        await widget.callback?.call(
                          widget.listData?.operationsId?.id,
                          'published',
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
            checkColor: (((widget.data?.status == 'todo') &&
                        (widget.data?.current == 0)) ||
                    (widget.data?.status == 'done'))
                ? null
                : FlutterFlowTheme.of(context).info,
          ),
        ),
        Text(
          widget.listData!.operationsId.content,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0.0,
              ),
        ),
      ],
    );
  }
}
