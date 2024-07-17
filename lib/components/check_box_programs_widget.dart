import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'check_box_programs_model.dart';
export 'check_box_programs_model.dart';

class CheckBoxProgramsWidget extends StatefulWidget {
  const CheckBoxProgramsWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  });

  final int? parameter1;
  final List<String>? parameter2;
  final List<String>? parameter3;

  @override
  State<CheckBoxProgramsWidget> createState() => _CheckBoxProgramsWidgetState();
}

class _CheckBoxProgramsWidgetState extends State<CheckBoxProgramsWidget> {
  late CheckBoxProgramsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckBoxProgramsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final programItems = widget.parameter3?.toList() ?? [];

        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: programItems.length,
          itemBuilder: (context, programItemsIndex) {
            final programItemsItem = programItems[programItemsIndex];
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
                    unselectedWidgetColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                  child: Checkbox(
                    value: _model.checkboxValueMap[programItemsItem] ??= false,
                    onChanged: (newValue) async {
                      setState(() => _model.checkboxValueMap[programItemsItem] =
                          newValue!);
                      if (newValue!) {
                        setState(() {});
                      } else {
                        setState(() {});
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
                Text(
                  programItemsItem,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nunito Sans',
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
