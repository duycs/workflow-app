// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrganizationBranchStruct extends BaseStruct {
  OrganizationBranchStruct({
    String? id,
    String? name,
    List<DepartmentsStruct>? departments,
    String? status,
  })  : _id = id,
        _name = name,
        _departments = departments,
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

  // "departments" field.
  List<DepartmentsStruct>? _departments;
  List<DepartmentsStruct> get departments => _departments ?? const [];
  set departments(List<DepartmentsStruct>? val) => _departments = val;

  void updateDepartments(Function(List<DepartmentsStruct>) updateFn) {
    updateFn(_departments ??= []);
  }

  bool hasDepartments() => _departments != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  static OrganizationBranchStruct fromMap(Map<String, dynamic> data) =>
      OrganizationBranchStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        departments: getStructList(
          data['departments'],
          DepartmentsStruct.fromMap,
        ),
        status: data['status'] as String?,
      );

  static OrganizationBranchStruct? maybeFromMap(dynamic data) => data is Map
      ? OrganizationBranchStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'departments': _departments?.map((e) => e.toMap()).toList(),
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
        'departments': serializeParam(
          _departments,
          ParamType.DataStruct,
          isList: true,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
      }.withoutNulls;

  static OrganizationBranchStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      OrganizationBranchStruct(
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
        departments: deserializeStructParam<DepartmentsStruct>(
          data['departments'],
          ParamType.DataStruct,
          true,
          structBuilder: DepartmentsStruct.fromSerializableMap,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OrganizationBranchStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OrganizationBranchStruct &&
        id == other.id &&
        name == other.name &&
        listEquality.equals(departments, other.departments) &&
        status == other.status;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, departments, status]);
}

OrganizationBranchStruct createOrganizationBranchStruct({
  String? id,
  String? name,
  String? status,
}) =>
    OrganizationBranchStruct(
      id: id,
      name: name,
      status: status,
    );
