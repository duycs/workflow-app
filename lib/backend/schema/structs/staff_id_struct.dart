// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffIdStruct extends BaseStruct {
  StaffIdStruct({
    String? id,
    UserIdStruct? userId,
    DepartmentListStruct? departmentId,
    String? staffName,
  })  : _id = id,
        _userId = userId,
        _departmentId = departmentId,
        _staffName = staffName;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "user_id" field.
  UserIdStruct? _userId;
  UserIdStruct get userId => _userId ?? UserIdStruct();
  set userId(UserIdStruct? val) => _userId = val;

  void updateUserId(Function(UserIdStruct) updateFn) {
    updateFn(userId ??= UserIdStruct());
  }

  bool hasUserId() => _userId != null;

  // "department_id" field.
  DepartmentListStruct? _departmentId;
  DepartmentListStruct get departmentId =>
      _departmentId ?? DepartmentListStruct();
  set departmentId(DepartmentListStruct? val) => _departmentId = val;

  void updateDepartmentId(Function(DepartmentListStruct) updateFn) {
    updateFn(departmentId ??= DepartmentListStruct());
  }

  bool hasDepartmentId() => _departmentId != null;

  // "staffName" field.
  String? _staffName;
  String get staffName => _staffName ?? '';
  set staffName(String? val) => _staffName = val;

  bool hasStaffName() => _staffName != null;

  static StaffIdStruct fromMap(Map<String, dynamic> data) => StaffIdStruct(
        id: data['id'] as String?,
        userId: UserIdStruct.maybeFromMap(data['user_id']),
        departmentId: DepartmentListStruct.maybeFromMap(data['department_id']),
        staffName: data['staffName'] as String?,
      );

  static StaffIdStruct? maybeFromMap(dynamic data) =>
      data is Map ? StaffIdStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'user_id': _userId?.toMap(),
        'department_id': _departmentId?.toMap(),
        'staffName': _staffName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.DataStruct,
        ),
        'department_id': serializeParam(
          _departmentId,
          ParamType.DataStruct,
        ),
        'staffName': serializeParam(
          _staffName,
          ParamType.String,
        ),
      }.withoutNulls;

  static StaffIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      StaffIdStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        userId: deserializeStructParam(
          data['user_id'],
          ParamType.DataStruct,
          false,
          structBuilder: UserIdStruct.fromSerializableMap,
        ),
        departmentId: deserializeStructParam(
          data['department_id'],
          ParamType.DataStruct,
          false,
          structBuilder: DepartmentListStruct.fromSerializableMap,
        ),
        staffName: deserializeParam(
          data['staffName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StaffIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StaffIdStruct &&
        id == other.id &&
        userId == other.userId &&
        departmentId == other.departmentId &&
        staffName == other.staffName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, userId, departmentId, staffName]);
}

StaffIdStruct createStaffIdStruct({
  String? id,
  UserIdStruct? userId,
  DepartmentListStruct? departmentId,
  String? staffName,
}) =>
    StaffIdStruct(
      id: id,
      userId: userId ?? UserIdStruct(),
      departmentId: departmentId ?? DepartmentListStruct(),
      staffName: staffName,
    );
