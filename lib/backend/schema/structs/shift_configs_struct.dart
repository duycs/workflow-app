// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShiftConfigsStruct extends BaseStruct {
  ShiftConfigsStruct({
    String? id,
    String? status,
    int? enable,
    UserStruct? userCreated,
    String? dateCreated,
    AddressListStruct? addressId,
    List<BranchListStruct>? branchs,
    List<DepartmentListStruct>? departments,
    List<StaffListStruct>? staffs,
    List<ShiftCofigsShiftsStruct>? shifts,
    String? name,
  })  : _id = id,
        _status = status,
        _enable = enable,
        _userCreated = userCreated,
        _dateCreated = dateCreated,
        _addressId = addressId,
        _branchs = branchs,
        _departments = departments,
        _staffs = staffs,
        _shifts = shifts,
        _name = name;

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

  // "enable" field.
  int? _enable;
  int get enable => _enable ?? 0;
  set enable(int? val) => _enable = val;

  void incrementEnable(int amount) => enable = enable + amount;

  bool hasEnable() => _enable != null;

  // "user_created" field.
  UserStruct? _userCreated;
  UserStruct get userCreated => _userCreated ?? UserStruct();
  set userCreated(UserStruct? val) => _userCreated = val;

  void updateUserCreated(Function(UserStruct) updateFn) {
    updateFn(_userCreated ??= UserStruct());
  }

  bool hasUserCreated() => _userCreated != null;

  // "date_created" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;

  bool hasDateCreated() => _dateCreated != null;

  // "address_id" field.
  AddressListStruct? _addressId;
  AddressListStruct get addressId => _addressId ?? AddressListStruct();
  set addressId(AddressListStruct? val) => _addressId = val;

  void updateAddressId(Function(AddressListStruct) updateFn) {
    updateFn(_addressId ??= AddressListStruct());
  }

  bool hasAddressId() => _addressId != null;

  // "branchs" field.
  List<BranchListStruct>? _branchs;
  List<BranchListStruct> get branchs => _branchs ?? const [];
  set branchs(List<BranchListStruct>? val) => _branchs = val;

  void updateBranchs(Function(List<BranchListStruct>) updateFn) {
    updateFn(_branchs ??= []);
  }

  bool hasBranchs() => _branchs != null;

  // "departments" field.
  List<DepartmentListStruct>? _departments;
  List<DepartmentListStruct> get departments => _departments ?? const [];
  set departments(List<DepartmentListStruct>? val) => _departments = val;

  void updateDepartments(Function(List<DepartmentListStruct>) updateFn) {
    updateFn(_departments ??= []);
  }

  bool hasDepartments() => _departments != null;

  // "staffs" field.
  List<StaffListStruct>? _staffs;
  List<StaffListStruct> get staffs => _staffs ?? const [];
  set staffs(List<StaffListStruct>? val) => _staffs = val;

  void updateStaffs(Function(List<StaffListStruct>) updateFn) {
    updateFn(_staffs ??= []);
  }

  bool hasStaffs() => _staffs != null;

  // "shifts" field.
  List<ShiftCofigsShiftsStruct>? _shifts;
  List<ShiftCofigsShiftsStruct> get shifts => _shifts ?? const [];
  set shifts(List<ShiftCofigsShiftsStruct>? val) => _shifts = val;

  void updateShifts(Function(List<ShiftCofigsShiftsStruct>) updateFn) {
    updateFn(_shifts ??= []);
  }

  bool hasShifts() => _shifts != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static ShiftConfigsStruct fromMap(Map<String, dynamic> data) =>
      ShiftConfigsStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        enable: castToType<int>(data['enable']),
        userCreated: UserStruct.maybeFromMap(data['user_created']),
        dateCreated: data['date_created'] as String?,
        addressId: AddressListStruct.maybeFromMap(data['address_id']),
        branchs: getStructList(
          data['branchs'],
          BranchListStruct.fromMap,
        ),
        departments: getStructList(
          data['departments'],
          DepartmentListStruct.fromMap,
        ),
        staffs: getStructList(
          data['staffs'],
          StaffListStruct.fromMap,
        ),
        shifts: getStructList(
          data['shifts'],
          ShiftCofigsShiftsStruct.fromMap,
        ),
        name: data['name'] as String?,
      );

  static ShiftConfigsStruct? maybeFromMap(dynamic data) => data is Map
      ? ShiftConfigsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'enable': _enable,
        'user_created': _userCreated?.toMap(),
        'date_created': _dateCreated,
        'address_id': _addressId?.toMap(),
        'branchs': _branchs?.map((e) => e.toMap()).toList(),
        'departments': _departments?.map((e) => e.toMap()).toList(),
        'staffs': _staffs?.map((e) => e.toMap()).toList(),
        'shifts': _shifts?.map((e) => e.toMap()).toList(),
        'name': _name,
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
        'enable': serializeParam(
          _enable,
          ParamType.int,
        ),
        'user_created': serializeParam(
          _userCreated,
          ParamType.DataStruct,
        ),
        'date_created': serializeParam(
          _dateCreated,
          ParamType.String,
        ),
        'address_id': serializeParam(
          _addressId,
          ParamType.DataStruct,
        ),
        'branchs': serializeParam(
          _branchs,
          ParamType.DataStruct,
          isList: true,
        ),
        'departments': serializeParam(
          _departments,
          ParamType.DataStruct,
          isList: true,
        ),
        'staffs': serializeParam(
          _staffs,
          ParamType.DataStruct,
          isList: true,
        ),
        'shifts': serializeParam(
          _shifts,
          ParamType.DataStruct,
          isList: true,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static ShiftConfigsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShiftConfigsStruct(
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
        enable: deserializeParam(
          data['enable'],
          ParamType.int,
          false,
        ),
        userCreated: deserializeStructParam(
          data['user_created'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        dateCreated: deserializeParam(
          data['date_created'],
          ParamType.String,
          false,
        ),
        addressId: deserializeStructParam(
          data['address_id'],
          ParamType.DataStruct,
          false,
          structBuilder: AddressListStruct.fromSerializableMap,
        ),
        branchs: deserializeStructParam<BranchListStruct>(
          data['branchs'],
          ParamType.DataStruct,
          true,
          structBuilder: BranchListStruct.fromSerializableMap,
        ),
        departments: deserializeStructParam<DepartmentListStruct>(
          data['departments'],
          ParamType.DataStruct,
          true,
          structBuilder: DepartmentListStruct.fromSerializableMap,
        ),
        staffs: deserializeStructParam<StaffListStruct>(
          data['staffs'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffListStruct.fromSerializableMap,
        ),
        shifts: deserializeStructParam<ShiftCofigsShiftsStruct>(
          data['shifts'],
          ParamType.DataStruct,
          true,
          structBuilder: ShiftCofigsShiftsStruct.fromSerializableMap,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ShiftConfigsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ShiftConfigsStruct &&
        id == other.id &&
        status == other.status &&
        enable == other.enable &&
        userCreated == other.userCreated &&
        dateCreated == other.dateCreated &&
        addressId == other.addressId &&
        listEquality.equals(branchs, other.branchs) &&
        listEquality.equals(departments, other.departments) &&
        listEquality.equals(staffs, other.staffs) &&
        listEquality.equals(shifts, other.shifts) &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        enable,
        userCreated,
        dateCreated,
        addressId,
        branchs,
        departments,
        staffs,
        shifts,
        name
      ]);
}

ShiftConfigsStruct createShiftConfigsStruct({
  String? id,
  String? status,
  int? enable,
  UserStruct? userCreated,
  String? dateCreated,
  AddressListStruct? addressId,
  String? name,
}) =>
    ShiftConfigsStruct(
      id: id,
      status: status,
      enable: enable,
      userCreated: userCreated ?? UserStruct(),
      dateCreated: dateCreated,
      addressId: addressId ?? AddressListStruct(),
      name: name,
    );
