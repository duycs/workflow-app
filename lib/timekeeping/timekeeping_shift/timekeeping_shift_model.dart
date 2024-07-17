import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'timekeeping_shift_widget.dart' show TimekeepingShiftWidget;
import 'package:flutter/material.dart';

class TimekeepingShiftModel extends FlutterFlowModel<TimekeepingShiftWidget> {
  ///  Local state fields for this component.

  List<ShiftListStruct> shiftSelect = [];
  void addToShiftSelect(ShiftListStruct item) => shiftSelect.add(item);
  void removeFromShiftSelect(ShiftListStruct item) => shiftSelect.remove(item);
  void removeAtIndexFromShiftSelect(int index) => shiftSelect.removeAt(index);
  void insertAtIndexInShiftSelect(int index, ShiftListStruct item) =>
      shiftSelect.insert(index, item);
  void updateShiftSelectAtIndex(
          int index, Function(ShiftListStruct) updateFn) =>
      shiftSelect[index] = updateFn(shiftSelect[index]);

  int loop = 0;

  List<ShiftsIdShiftConfigsRequestStruct> shiftsId = [];
  void addToShiftsId(ShiftsIdShiftConfigsRequestStruct item) =>
      shiftsId.add(item);
  void removeFromShiftsId(ShiftsIdShiftConfigsRequestStruct item) =>
      shiftsId.remove(item);
  void removeAtIndexFromShiftsId(int index) => shiftsId.removeAt(index);
  void insertAtIndexInShiftsId(
          int index, ShiftsIdShiftConfigsRequestStruct item) =>
      shiftsId.insert(index, item);
  void updateShiftsIdAtIndex(
          int index, Function(ShiftsIdShiftConfigsRequestStruct) updateFn) =>
      shiftsId[index] = updateFn(shiftsId[index]);

  int loopCheck = 0;

  bool check = false;

  String? addressId;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Action Block - tokenReload] action in Text widget.
  bool? shiftCreate;
  // Stores action output result for [Backend Call - API (ShiftCreate)] action in Text widget.
  ApiCallResponse? apiResultShiftCreate;
  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
