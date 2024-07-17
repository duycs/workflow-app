import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'choice_chip_shift_cofigs_model.dart';
export 'choice_chip_shift_cofigs_model.dart';

class ChoiceChipShiftCofigsWidget extends StatefulWidget {
  const ChoiceChipShiftCofigsWidget({
    super.key,
    this.departmentListName,
  });

  final List<String>? departmentListName;

  @override
  State<ChoiceChipShiftCofigsWidget> createState() =>
      _ChoiceChipShiftCofigsWidgetState();
}

class _ChoiceChipShiftCofigsWidgetState
    extends State<ChoiceChipShiftCofigsWidget> {
  late ChoiceChipShiftCofigsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChoiceChipShiftCofigsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowChoiceChips(
      options:
          widget.departmentListName!.map((label) => ChipData(label)).toList(),
      onChanged: ('1' == '1')
          ? null
          : (val) => setState(() => _model.choiceChipsValue = val?.firstOrNull),
      selectedChipStyle: ChipStyle(
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Nunito Sans',
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 13.0,
              letterSpacing: 0.0,
            ),
        iconColor: FlutterFlowTheme.of(context).primaryText,
        iconSize: 18.0,
        elevation: 0.0,
        borderRadius: BorderRadius.circular(16.0),
      ),
      unselectedChipStyle: ChipStyle(
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Nunito Sans',
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 13.0,
              letterSpacing: 0.0,
            ),
        iconColor: FlutterFlowTheme.of(context).secondaryText,
        iconSize: 18.0,
        elevation: 0.0,
        borderRadius: BorderRadius.circular(16.0),
      ),
      chipSpacing: 4.0,
      rowSpacing: 3.0,
      multiselect: false,
      alignment: WrapAlignment.end,
      controller: _model.choiceChipsValueController ??=
          FormFieldController<List<String>>(
        [],
      ),
      disabledColor: FlutterFlowTheme.of(context).alternate,
      wrapped: true,
    );
  }
}
