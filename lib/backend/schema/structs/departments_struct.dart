// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepartmentsStruct extends BaseStruct {
  DepartmentsStruct({
    String? id,
    String? name,
    List<StaffsStruct>? staffs,
    String? status,
    IdStruct? branchId,
  })  : _id = id,
        _name = name,
        _staffs = staffs,
        _status = status,
        _branchId = branchId;

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

  void updateStaffs(Function(List<StaffsStruct>) updateFn) {
    updateFn(staffs ??= []);
  }

  bool hasStaffs() => _staffs != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "branch_id" field.
  IdStruct? _branchId;
  IdStruct get branchId => _branchId ?? IdStruct();
  set branchId(IdStruct? val) => _branchId = val;

  void updateBranchId(Function(IdStruct) updateFn) {
    updateFn(branchId ??= IdStruct());
  }

  bool hasBranchId() => _branchId != null;

  static DepartmentsStruct fromMap(Map<String, dynamic> data) =>
      DepartmentsStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        staffs: getStructList(
          data['staffs'],
          StaffsStruct.fromMap,
        ),
        status: data['status'] as String?,
        branchId: IdStruct.maybeFromMap(data['branch_id']),
      );

  static DepartmentsStruct? maybeFromMap(dynamic data) => data is Map
      ? DepartmentsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'staffs': _staffs?.map((e) => e.toMap()).toList(),
        'status': _status,
        'branch_id': _branchId?.toMap(),
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
          isList: true,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'branch_id': serializeParam(
          _branchId,
          ParamType.DataStruct,
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
        branchId: deserializeStructParam(
          data['branch_id'],
          ParamType.DataStruct,
          false,
          structBuilder: IdStruct.fromSerializableMap,
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
        status == other.status &&
        branchId == other.branchId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, staffs, status, branchId]);
}

DepartmentsStruct createDepartmentsStruct({
  String? id,
  String? name,
  String? status,
  IdStruct? branchId,
}) =>
    DepartmentsStruct(
      id: id,
      name: name,
      status: status,
      branchId: branchId ?? IdStruct(),
    );
