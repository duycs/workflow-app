// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffsStepStruct extends BaseStruct {
  StaffsStepStruct({
    int? id,
    StaffIdStruct? staffsId,
  })  : _id = id,
        _staffsId = staffsId;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "staffs_id" field.
  StaffIdStruct? _staffsId;
  StaffIdStruct get staffsId => _staffsId ?? StaffIdStruct();
  set staffsId(StaffIdStruct? val) => _staffsId = val;

  void updateStaffsId(Function(StaffIdStruct) updateFn) {
    updateFn(_staffsId ??= StaffIdStruct());
  }

  bool hasStaffsId() => _staffsId != null;

  static StaffsStepStruct fromMap(Map<String, dynamic> data) =>
      StaffsStepStruct(
        id: castToType<int>(data['id']),
        staffsId: StaffIdStruct.maybeFromMap(data['staffs_id']),
      );

  static StaffsStepStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffsStepStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'staffs_id': _staffsId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'staffs_id': serializeParam(
          _staffsId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static StaffsStepStruct fromSerializableMap(Map<String, dynamic> data) =>
      StaffsStepStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        staffsId: deserializeStructParam(
          data['staffs_id'],
          ParamType.DataStruct,
          false,
          structBuilder: StaffIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StaffsStepStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StaffsStepStruct &&
        id == other.id &&
        staffsId == other.staffsId;
  }

  @override
  int get hashCode => const ListEquality().hash([id, staffsId]);
}

StaffsStepStruct createStaffsStepStruct({
  int? id,
  StaffIdStruct? staffsId,
}) =>
    StaffsStepStruct(
      id: id,
      staffsId: staffsId ?? StaffIdStruct(),
    );
