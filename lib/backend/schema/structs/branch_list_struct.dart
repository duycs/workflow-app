// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BranchListStruct extends BaseStruct {
  BranchListStruct({
    String? id,
    String? status,
    String? sort,
    String? userCreated,
    String? dateCreated,
    String? name,
    String? description,
    String? code,
    String? content,
    List<StaffsStruct>? staffs,
    List<DepartmentsStruct>? departments,
    OrganizationIdStruct? organizationId,
  })  : _id = id,
        _status = status,
        _sort = sort,
        _userCreated = userCreated,
        _dateCreated = dateCreated,
        _name = name,
        _description = description,
        _code = code,
        _content = content,
        _staffs = staffs,
        _departments = departments,
        _organizationId = organizationId;

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

  // "sort" field.
  String? _sort;
  String get sort => _sort ?? '';
  set sort(String? val) => _sort = val;
  bool hasSort() => _sort != null;

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

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;
  bool hasCode() => _code != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;
  bool hasContent() => _content != null;

  // "staffs" field.
  List<StaffsStruct>? _staffs;
  List<StaffsStruct> get staffs => _staffs ?? const [];
  set staffs(List<StaffsStruct>? val) => _staffs = val;
  void updateStaffs(Function(List<StaffsStruct>) updateFn) =>
      updateFn(_staffs ??= []);
  bool hasStaffs() => _staffs != null;

  // "departments" field.
  List<DepartmentsStruct>? _departments;
  List<DepartmentsStruct> get departments => _departments ?? const [];
  set departments(List<DepartmentsStruct>? val) => _departments = val;
  void updateDepartments(Function(List<DepartmentsStruct>) updateFn) =>
      updateFn(_departments ??= []);
  bool hasDepartments() => _departments != null;

  // "organization_id" field.
  OrganizationIdStruct? _organizationId;
  OrganizationIdStruct get organizationId =>
      _organizationId ?? OrganizationIdStruct();
  set organizationId(OrganizationIdStruct? val) => _organizationId = val;
  void updateOrganizationId(Function(OrganizationIdStruct) updateFn) =>
      updateFn(_organizationId ??= OrganizationIdStruct());
  bool hasOrganizationId() => _organizationId != null;

  static BranchListStruct fromMap(Map<String, dynamic> data) =>
      BranchListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        sort: data['sort'] as String?,
        userCreated: data['user_created'] as String?,
        dateCreated: data['date_created'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        code: data['code'] as String?,
        content: data['content'] as String?,
        staffs: getStructList(
          data['staffs'],
          StaffsStruct.fromMap,
        ),
        departments: getStructList(
          data['departments'],
          DepartmentsStruct.fromMap,
        ),
        organizationId:
            OrganizationIdStruct.maybeFromMap(data['organization_id']),
      );

  static BranchListStruct? maybeFromMap(dynamic data) => data is Map
      ? BranchListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'sort': _sort,
        'user_created': _userCreated,
        'date_created': _dateCreated,
        'name': _name,
        'description': _description,
        'code': _code,
        'content': _content,
        'staffs': _staffs?.map((e) => e.toMap()).toList(),
        'departments': _departments?.map((e) => e.toMap()).toList(),
        'organization_id': _organizationId?.toMap(),
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
        'sort': serializeParam(
          _sort,
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
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'staffs': serializeParam(
          _staffs,
          ParamType.DataStruct,
          true,
        ),
        'departments': serializeParam(
          _departments,
          ParamType.DataStruct,
          true,
        ),
        'organization_id': serializeParam(
          _organizationId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static BranchListStruct fromSerializableMap(Map<String, dynamic> data) =>
      BranchListStruct(
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
        sort: deserializeParam(
          data['sort'],
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
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        staffs: deserializeStructParam<StaffsStruct>(
          data['staffs'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffsStruct.fromSerializableMap,
        ),
        departments: deserializeStructParam<DepartmentsStruct>(
          data['departments'],
          ParamType.DataStruct,
          true,
          structBuilder: DepartmentsStruct.fromSerializableMap,
        ),
        organizationId: deserializeStructParam(
          data['organization_id'],
          ParamType.DataStruct,
          false,
          structBuilder: OrganizationIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'BranchListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BranchListStruct &&
        id == other.id &&
        status == other.status &&
        sort == other.sort &&
        userCreated == other.userCreated &&
        dateCreated == other.dateCreated &&
        name == other.name &&
        description == other.description &&
        code == other.code &&
        content == other.content &&
        listEquality.equals(staffs, other.staffs) &&
        listEquality.equals(departments, other.departments) &&
        organizationId == other.organizationId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        sort,
        userCreated,
        dateCreated,
        name,
        description,
        code,
        content,
        staffs,
        departments,
        organizationId
      ]);
}

BranchListStruct createBranchListStruct({
  String? id,
  String? status,
  String? sort,
  String? userCreated,
  String? dateCreated,
  String? name,
  String? description,
  String? code,
  String? content,
  OrganizationIdStruct? organizationId,
}) =>
    BranchListStruct(
      id: id,
      status: status,
      sort: sort,
      userCreated: userCreated,
      dateCreated: dateCreated,
      name: name,
      description: description,
      code: code,
      content: content,
      organizationId: organizationId ?? OrganizationIdStruct(),
    );
