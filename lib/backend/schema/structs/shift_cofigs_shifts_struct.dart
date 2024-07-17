// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShiftCofigsShiftsStruct extends BaseStruct {
  ShiftCofigsShiftsStruct({
    int? id,
    ShiftListStruct? shiftsId,
  })  : _id = id,
        _shiftsId = shiftsId;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "shifts_id" field.
  ShiftListStruct? _shiftsId;
  ShiftListStruct get shiftsId => _shiftsId ?? ShiftListStruct();
  set shiftsId(ShiftListStruct? val) => _shiftsId = val;

  void updateShiftsId(Function(ShiftListStruct) updateFn) {
    updateFn(_shiftsId ??= ShiftListStruct());
  }

  bool hasShiftsId() => _shiftsId != null;

  static ShiftCofigsShiftsStruct fromMap(Map<String, dynamic> data) =>
      ShiftCofigsShiftsStruct(
        id: castToType<int>(data['id']),
        shiftsId: ShiftListStruct.maybeFromMap(data['shifts_id']),
      );

  static ShiftCofigsShiftsStruct? maybeFromMap(dynamic data) => data is Map
      ? ShiftCofigsShiftsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'shifts_id': _shiftsId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'shifts_id': serializeParam(
          _shiftsId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ShiftCofigsShiftsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ShiftCofigsShiftsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        shiftsId: deserializeStructParam(
          data['shifts_id'],
          ParamType.DataStruct,
          false,
          structBuilder: ShiftListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ShiftCofigsShiftsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShiftCofigsShiftsStruct &&
        id == other.id &&
        shiftsId == other.shiftsId;
  }

  @override
  int get hashCode => const ListEquality().hash([id, shiftsId]);
}

ShiftCofigsShiftsStruct createShiftCofigsShiftsStruct({
  int? id,
  ShiftListStruct? shiftsId,
}) =>
    ShiftCofigsShiftsStruct(
      id: id,
      shiftsId: shiftsId ?? ShiftListStruct(),
    );
