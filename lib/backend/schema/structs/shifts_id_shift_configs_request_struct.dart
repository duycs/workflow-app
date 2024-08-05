// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShiftsIdShiftConfigsRequestStruct extends BaseStruct {
  ShiftsIdShiftConfigsRequestStruct({
    IdStruct? shiftsId,
  }) : _shiftsId = shiftsId;

  // "shifts_id" field.
  IdStruct? _shiftsId;
  IdStruct get shiftsId => _shiftsId ?? IdStruct();
  set shiftsId(IdStruct? val) => _shiftsId = val;

  void updateShiftsId(Function(IdStruct) updateFn) {
    updateFn(_shiftsId ??= IdStruct());
  }

  bool hasShiftsId() => _shiftsId != null;

  static ShiftsIdShiftConfigsRequestStruct fromMap(Map<String, dynamic> data) =>
      ShiftsIdShiftConfigsRequestStruct(
        shiftsId: IdStruct.maybeFromMap(data['shifts_id']),
      );

  static ShiftsIdShiftConfigsRequestStruct? maybeFromMap(dynamic data) => data
          is Map
      ? ShiftsIdShiftConfigsRequestStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'shifts_id': _shiftsId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'shifts_id': serializeParam(
          _shiftsId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ShiftsIdShiftConfigsRequestStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ShiftsIdShiftConfigsRequestStruct(
        shiftsId: deserializeStructParam(
          data['shifts_id'],
          ParamType.DataStruct,
          false,
          structBuilder: IdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ShiftsIdShiftConfigsRequestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShiftsIdShiftConfigsRequestStruct &&
        shiftsId == other.shiftsId;
  }

  @override
  int get hashCode => const ListEquality().hash([shiftsId]);
}

ShiftsIdShiftConfigsRequestStruct createShiftsIdShiftConfigsRequestStruct({
  IdStruct? shiftsId,
}) =>
    ShiftsIdShiftConfigsRequestStruct(
      shiftsId: shiftsId ?? IdStruct(),
    );
