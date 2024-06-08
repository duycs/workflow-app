// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepartmentsStruct extends BaseStruct {
  DepartmentsStruct({
    String? id,
    String? name,
    List<StaffsStruct>? staffs,
    String? status,
  })  : _id = id,
        _name = name,
        _staffs = staffs,
        _status = status;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "staffs" field.
  List<StaffsStruct>? _staffs;
  List<StaffsStruct> get staffs => _staffs ?? const [];
  set staffs(List<StaffsStruct>? val) => _staffs = val;
  void updateStaffs(Function(List<StaffsStruct>) updateFn) =>
      updateFn(_staffs ??= []);
  bool hasStaffs() => _staffs != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  static DepartmentsStruct fromMap(Map<String, dynamic> data) =>
      DepartmentsStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        staffs: getStructList(
          data['staffs'],
          StaffsStruct.fromMap,
        ),
        status: data['status'] as String?,
      );

  static DepartmentsStruct? maybeFromMap(dynamic data) => data is Map
      ? DepartmentsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'staffs': _staffs?.map((e) => e.toMap()).toList(),
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'staffs': serializeParam(
          _staffs,
          ParamType.DataStruct,
          true,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
      }.withoutNulls;

  static DepartmentsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DepartmentsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        staffs: deserializeStructParam<StaffsStruct>(
          data['staffs'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffsStruct.fromSerializableMap,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DepartmentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DepartmentsStruct &&
        id == other.id &&
        name == other.name &&
        listEquality.equals(staffs, other.staffs) &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, staffs, status]);
}

DepartmentsStruct createDepartmentsStruct({
  String? id,
  String? name,
  String? status,
}) =>
    DepartmentsStruct(
      id: id,
      name: name,
      status: status,
    );
