// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimekeepingsStruct extends BaseStruct {
  TimekeepingsStruct({
    String? id,
    String? status,
    String? userCreated,
    String? dateCreated,
    String? userUpdated,
    String? dateUpdated,
    String? organizationId,
    String? type,
    List<ShiftdaysStruct>? shiftDays,
    StaffListStruct? staffId,
    ShiftConfigsStruct? shiftConfigId,
  })  : _id = id,
        _status = status,
        _userCreated = userCreated,
        _dateCreated = dateCreated,
        _userUpdated = userUpdated,
        _dateUpdated = dateUpdated,
        _organizationId = organizationId,
        _type = type,
        _shiftDays = shiftDays,
        _staffId = staffId,
        _shiftConfigId = shiftConfigId;

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

  // "user_created" field.
  String? _userCreated;
  String get userCreated => _userCreated ?? '';
  set userCreated(String? val) => _userCreated = val;

  bool hasUserCreated() => _userCreated != null;

  // "date_created" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;

  bool hasDateCreated() => _dateCreated != null;

  // "user_updated" field.
  String? _userUpdated;
  String get userUpdated => _userUpdated ?? '';
  set userUpdated(String? val) => _userUpdated = val;

  bool hasUserUpdated() => _userUpdated != null;

  // "date_updated" field.
  String? _dateUpdated;
  String get dateUpdated => _dateUpdated ?? '';
  set dateUpdated(String? val) => _dateUpdated = val;

  bool hasDateUpdated() => _dateUpdated != null;

  // "organization_id" field.
  String? _organizationId;
  String get organizationId => _organizationId ?? '';
  set organizationId(String? val) => _organizationId = val;

  bool hasOrganizationId() => _organizationId != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "shift_days" field.
  List<ShiftdaysStruct>? _shiftDays;
  List<ShiftdaysStruct> get shiftDays => _shiftDays ?? const [];
  set shiftDays(List<ShiftdaysStruct>? val) => _shiftDays = val;

  void updateShiftDays(Function(List<ShiftdaysStruct>) updateFn) {
    updateFn(_shiftDays ??= []);
  }

  bool hasShiftDays() => _shiftDays != null;

  // "staff_id" field.
  StaffListStruct? _staffId;
  StaffListStruct get staffId => _staffId ?? StaffListStruct();
  set staffId(StaffListStruct? val) => _staffId = val;

  void updateStaffId(Function(StaffListStruct) updateFn) {
    updateFn(_staffId ??= StaffListStruct());
  }

  bool hasStaffId() => _staffId != null;

  // "shift_config_id" field.
  ShiftConfigsStruct? _shiftConfigId;
  ShiftConfigsStruct get shiftConfigId =>
      _shiftConfigId ?? ShiftConfigsStruct();
  set shiftConfigId(ShiftConfigsStruct? val) => _shiftConfigId = val;

  void updateShiftConfigId(Function(ShiftConfigsStruct) updateFn) {
    updateFn(_shiftConfigId ??= ShiftConfigsStruct());
  }

  bool hasShiftConfigId() => _shiftConfigId != null;

  static TimekeepingsStruct fromMap(Map<String, dynamic> data) =>
      TimekeepingsStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        userCreated: data['user_created'] as String?,
        dateCreated: data['date_created'] as String?,
        userUpdated: data['user_updated'] as String?,
        dateUpdated: data['date_updated'] as String?,
        organizationId: data['organization_id'] as String?,
        type: data['type'] as String?,
        shiftDays: getStructList(
          data['shift_days'],
          ShiftdaysStruct.fromMap,
        ),
        staffId: StaffListStruct.maybeFromMap(data['staff_id']),
        shiftConfigId: ShiftConfigsStruct.maybeFromMap(data['shift_config_id']),
      );

  static TimekeepingsStruct? maybeFromMap(dynamic data) => data is Map
      ? TimekeepingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'user_created': _userCreated,
        'date_created': _dateCreated,
        'user_updated': _userUpdated,
        'date_updated': _dateUpdated,
        'organization_id': _organizationId,
        'type': _type,
        'shift_days': _shiftDays?.map((e) => e.toMap()).toList(),
        'staff_id': _staffId?.toMap(),
        'shift_config_id': _shiftConfigId?.toMap(),
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
        'user_created': serializeParam(
          _userCreated,
          ParamType.String,
        ),
        'date_created': serializeParam(
          _dateCreated,
          ParamType.String,
        ),
        'user_updated': serializeParam(
          _userUpdated,
          ParamType.String,
        ),
        'date_updated': serializeParam(
          _dateUpdated,
          ParamType.String,
        ),
        'organization_id': serializeParam(
          _organizationId,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'shift_days': serializeParam(
          _shiftDays,
          ParamType.DataStruct,
          isList: true,
        ),
        'staff_id': serializeParam(
          _staffId,
          ParamType.DataStruct,
        ),
        'shift_config_id': serializeParam(
          _shiftConfigId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static TimekeepingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TimekeepingsStruct(
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
        userCreated: deserializeParam(
          data['user_created'],
          ParamType.String,
          false,
        ),
        dateCreated: deserializeParam(
          data['date_created'],
          ParamType.String,
          false,
        ),
        userUpdated: deserializeParam(
          data['user_updated'],
          ParamType.String,
          false,
        ),
        dateUpdated: deserializeParam(
          data['date_updated'],
          ParamType.String,
          false,
        ),
        organizationId: deserializeParam(
          data['organization_id'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        shiftDays: deserializeStructParam<ShiftdaysStruct>(
          data['shift_days'],
          ParamType.DataStruct,
          true,
          structBuilder: ShiftdaysStruct.fromSerializableMap,
        ),
        staffId: deserializeStructParam(
          data['staff_id'],
          ParamType.DataStruct,
          false,
          structBuilder: StaffListStruct.fromSerializableMap,
        ),
        shiftConfigId: deserializeStructParam(
          data['shift_config_id'],
          ParamType.DataStruct,
          false,
          structBuilder: ShiftConfigsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TimekeepingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TimekeepingsStruct &&
        id == other.id &&
        status == other.status &&
        userCreated == other.userCreated &&
        dateCreated == other.dateCreated &&
        userUpdated == other.userUpdated &&
        dateUpdated == other.dateUpdated &&
        organizationId == other.organizationId &&
        type == other.type &&
        listEquality.equals(shiftDays, other.shiftDays) &&
        staffId == other.staffId &&
        shiftConfigId == other.shiftConfigId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        userCreated,
        dateCreated,
        userUpdated,
        dateUpdated,
        organizationId,
        type,
        shiftDays,
        staffId,
        shiftConfigId
      ]);
}

TimekeepingsStruct createTimekeepingsStruct({
  String? id,
  String? status,
  String? userCreated,
  String? dateCreated,
  String? userUpdated,
  String? dateUpdated,
  String? organizationId,
  String? type,
  StaffListStruct? staffId,
  ShiftConfigsStruct? shiftConfigId,
}) =>
    TimekeepingsStruct(
      id: id,
      status: status,
      userCreated: userCreated,
      dateCreated: dateCreated,
      userUpdated: userUpdated,
      dateUpdated: dateUpdated,
      organizationId: organizationId,
      type: type,
      staffId: staffId ?? StaffListStruct(),
      shiftConfigId: shiftConfigId ?? ShiftConfigsStruct(),
    );
