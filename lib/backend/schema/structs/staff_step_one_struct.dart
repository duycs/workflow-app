// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffStepOneStruct extends BaseStruct {
  StaffStepOneStruct({
    IdStruct? staffsId,
  }) : _staffsId = staffsId;

  // "staffs_id" field.
  IdStruct? _staffsId;
  IdStruct get staffsId => _staffsId ?? IdStruct();
  set staffsId(IdStruct? val) => _staffsId = val;

  void updateStaffsId(Function(IdStruct) updateFn) {
    updateFn(staffsId ??= IdStruct());
  }

  bool hasStaffsId() => _staffsId != null;

  static StaffStepOneStruct fromMap(Map<String, dynamic> data) =>
      StaffStepOneStruct(
        staffsId: IdStruct.maybeFromMap(data['staffs_id']),
      );

  static StaffStepOneStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffStepOneStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'staffs_id': _staffsId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'staffs_id': serializeParam(
          _staffsId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static StaffStepOneStruct fromSerializableMap(Map<String, dynamic> data) =>
      StaffStepOneStruct(
        staffsId: deserializeStructParam(
          data['staffs_id'],
          ParamType.DataStruct,
          false,
          structBuilder: IdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StaffStepOneStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StaffStepOneStruct && staffsId == other.staffsId;
  }

  @override
  int get hashCode => const ListEquality().hash([staffsId]);
}

StaffStepOneStruct createStaffStepOneStruct({
  IdStruct? staffsId,
}) =>
    StaffStepOneStruct(
      staffsId: staffsId ?? IdStruct(),
    );
