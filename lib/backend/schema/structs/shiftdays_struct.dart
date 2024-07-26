// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShiftdaysStruct extends BaseStruct {
  ShiftdaysStruct({
    String? id,
    String? status,
    int? dayNumber,
    ShiftListStruct? shiftId,
    List<ShiftChecksStruct>? shiftChecks,
    StaffListStruct? staffId,
  })  : _id = id,
        _status = status,
        _dayNumber = dayNumber,
        _shiftId = shiftId,
        _shiftChecks = shiftChecks,
        _staffId = staffId;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "day_number" field.
  int? _dayNumber;
  int get dayNumber => _dayNumber ?? 0;
  set dayNumber(int? val) => _dayNumber = val;

  void incrementDayNumber(int amount) => dayNumber = dayNumber + amount;

  bool hasDayNumber() => _dayNumber != null;

  // "shift_id" field.
  ShiftListStruct? _shiftId;
  ShiftListStruct get shiftId => _shiftId ?? ShiftListStruct();
  set shiftId(ShiftListStruct? val) => _shiftId = val;

  void updateShiftId(Function(ShiftListStruct) updateFn) {
    updateFn(_shiftId ??= ShiftListStruct());
  }

  bool hasShiftId() => _shiftId != null;

  // "shift_checks" field.
  List<ShiftChecksStruct>? _shiftChecks;
  List<ShiftChecksStruct> get shiftChecks => _shiftChecks ?? const [];
  set shiftChecks(List<ShiftChecksStruct>? val) => _shiftChecks = val;

  void updateShiftChecks(Function(List<ShiftChecksStruct>) updateFn) {
    updateFn(_shiftChecks ??= []);
  }

  bool hasShiftChecks() => _shiftChecks != null;

  // "staff_id" field.
  StaffListStruct? _staffId;
  StaffListStruct get staffId => _staffId ?? StaffListStruct();
  set staffId(StaffListStruct? val) => _staffId = val;

  void updateStaffId(Function(StaffListStruct) updateFn) {
    updateFn(_staffId ??= StaffListStruct());
  }

  bool hasStaffId() => _staffId != null;

  static ShiftdaysStruct fromMap(Map<String, dynamic> data) => ShiftdaysStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        dayNumber: castToType<int>(data['day_number']),
        shiftId: ShiftListStruct.maybeFromMap(data['shift_id']),
        shiftChecks: getStructList(
          data['shift_checks'],
          ShiftChecksStruct.fromMap,
        ),
        staffId: StaffListStruct.maybeFromMap(data['staff_id']),
      );

  static ShiftdaysStruct? maybeFromMap(dynamic data) => data is Map
      ? ShiftdaysStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'day_number': _dayNumber,
        'shift_id': _shiftId?.toMap(),
        'shift_checks': _shiftChecks?.map((e) => e.toMap()).toList(),
        'staff_id': _staffId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'day_number': serializeParam(
          _dayNumber,
          ParamType.int,
        ),
        'shift_id': serializeParam(
          _shiftId,
          ParamType.DataStruct,
        ),
        'shift_checks': serializeParam(
          _shiftChecks,
          ParamType.DataStruct,
          isList: true,
        ),
        'staff_id': serializeParam(
          _staffId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ShiftdaysStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShiftdaysStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        dayNumber: deserializeParam(
          data['day_number'],
          ParamType.int,
          false,
        ),
        shiftId: deserializeStructParam(
          data['shift_id'],
          ParamType.DataStruct,
          false,
          structBuilder: ShiftListStruct.fromSerializableMap,
        ),
        shiftChecks: deserializeStructParam<ShiftChecksStruct>(
          data['shift_checks'],
          ParamType.DataStruct,
          true,
          structBuilder: ShiftChecksStruct.fromSerializableMap,
        ),
        staffId: deserializeStructParam(
          data['staff_id'],
          ParamType.DataStruct,
          false,
          structBuilder: StaffListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ShiftdaysStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ShiftdaysStruct &&
        id == other.id &&
        status == other.status &&
        dayNumber == other.dayNumber &&
        shiftId == other.shiftId &&
        listEquality.equals(shiftChecks, other.shiftChecks) &&
        staffId == other.staffId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, status, dayNumber, shiftId, shiftChecks, staffId]);
}

ShiftdaysStruct createShiftdaysStruct({
  String? id,
  String? status,
  int? dayNumber,
  ShiftListStruct? shiftId,
  StaffListStruct? staffId,
}) =>
    ShiftdaysStruct(
      id: id,
      status: status,
      dayNumber: dayNumber,
      shiftId: shiftId ?? ShiftListStruct(),
      staffId: staffId ?? StaffListStruct(),
    );
