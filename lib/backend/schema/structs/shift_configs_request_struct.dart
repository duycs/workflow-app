// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShiftConfigsRequestStruct extends BaseStruct {
  ShiftConfigsRequestStruct({
    String? status,
    String? addressId,
    List<String>? departments,
    List<String>? staffs,
    List<ShiftsIdShiftConfigsRequestStruct>? shifts,
    String? name,
    String? organizationId,
    int? enable,
    List<String>? offWeekDays,
  })  : _status = status,
        _addressId = addressId,
        _departments = departments,
        _staffs = staffs,
        _shifts = shifts,
        _name = name,
        _organizationId = organizationId,
        _enable = enable,
        _offWeekDays = offWeekDays;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "address_id" field.
  String? _addressId;
  String get addressId => _addressId ?? '';
  set addressId(String? val) => _addressId = val;

  bool hasAddressId() => _addressId != null;

  // "departments" field.
  List<String>? _departments;
  List<String> get departments => _departments ?? const [];
  set departments(List<String>? val) => _departments = val;

  void updateDepartments(Function(List<String>) updateFn) {
    updateFn(_departments ??= []);
  }

  bool hasDepartments() => _departments != null;

  // "staffs" field.
  List<String>? _staffs;
  List<String> get staffs => _staffs ?? const [];
  set staffs(List<String>? val) => _staffs = val;

  void updateStaffs(Function(List<String>) updateFn) {
    updateFn(_staffs ??= []);
  }

  bool hasStaffs() => _staffs != null;

  // "shifts" field.
  List<ShiftsIdShiftConfigsRequestStruct>? _shifts;
  List<ShiftsIdShiftConfigsRequestStruct> get shifts => _shifts ?? const [];
  set shifts(List<ShiftsIdShiftConfigsRequestStruct>? val) => _shifts = val;

  void updateShifts(
      Function(List<ShiftsIdShiftConfigsRequestStruct>) updateFn) {
    updateFn(_shifts ??= []);
  }

  bool hasShifts() => _shifts != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "organization_id" field.
  String? _organizationId;
  String get organizationId => _organizationId ?? '';
  set organizationId(String? val) => _organizationId = val;

  bool hasOrganizationId() => _organizationId != null;

  // "enable" field.
  int? _enable;
  int get enable => _enable ?? 0;
  set enable(int? val) => _enable = val;

  void incrementEnable(int amount) => enable = enable + amount;

  bool hasEnable() => _enable != null;

  // "off_week_days" field.
  List<String>? _offWeekDays;
  List<String> get offWeekDays => _offWeekDays ?? const [];
  set offWeekDays(List<String>? val) => _offWeekDays = val;

  void updateOffWeekDays(Function(List<String>) updateFn) {
    updateFn(_offWeekDays ??= []);
  }

  bool hasOffWeekDays() => _offWeekDays != null;

  static ShiftConfigsRequestStruct fromMap(Map<String, dynamic> data) =>
      ShiftConfigsRequestStruct(
        status: data['status'] as String?,
        addressId: data['address_id'] as String?,
        departments: getDataList(data['departments']),
        staffs: getDataList(data['staffs']),
        shifts: getStructList(
          data['shifts'],
          ShiftsIdShiftConfigsRequestStruct.fromMap,
        ),
        name: data['name'] as String?,
        organizationId: data['organization_id'] as String?,
        enable: castToType<int>(data['enable']),
        offWeekDays: getDataList(data['off_week_days']),
      );

  static ShiftConfigsRequestStruct? maybeFromMap(dynamic data) => data is Map
      ? ShiftConfigsRequestStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'address_id': _addressId,
        'departments': _departments,
        'staffs': _staffs,
        'shifts': _shifts?.map((e) => e.toMap()).toList(),
        'name': _name,
        'organization_id': _organizationId,
        'enable': _enable,
        'off_week_days': _offWeekDays,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'address_id': serializeParam(
          _addressId,
          ParamType.String,
        ),
        'departments': serializeParam(
          _departments,
          ParamType.String,
          isList: true,
        ),
        'staffs': serializeParam(
          _staffs,
          ParamType.String,
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
        'organization_id': serializeParam(
          _organizationId,
          ParamType.String,
        ),
        'enable': serializeParam(
          _enable,
          ParamType.int,
        ),
        'off_week_days': serializeParam(
          _offWeekDays,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ShiftConfigsRequestStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ShiftConfigsRequestStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        addressId: deserializeParam(
          data['address_id'],
          ParamType.String,
          false,
        ),
        departments: deserializeParam<String>(
          data['departments'],
          ParamType.String,
          true,
        ),
        staffs: deserializeParam<String>(
          data['staffs'],
          ParamType.String,
          true,
        ),
        shifts: deserializeStructParam<ShiftsIdShiftConfigsRequestStruct>(
          data['shifts'],
          ParamType.DataStruct,
          true,
          structBuilder: ShiftsIdShiftConfigsRequestStruct.fromSerializableMap,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        organizationId: deserializeParam(
          data['organization_id'],
          ParamType.String,
          false,
        ),
        enable: deserializeParam(
          data['enable'],
          ParamType.int,
          false,
        ),
        offWeekDays: deserializeParam<String>(
          data['off_week_days'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ShiftConfigsRequestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ShiftConfigsRequestStruct &&
        status == other.status &&
        addressId == other.addressId &&
        listEquality.equals(departments, other.departments) &&
        listEquality.equals(staffs, other.staffs) &&
        listEquality.equals(shifts, other.shifts) &&
        name == other.name &&
        organizationId == other.organizationId &&
        enable == other.enable &&
        listEquality.equals(offWeekDays, other.offWeekDays);
  }

  @override
  int get hashCode => const ListEquality().hash([
        status,
        addressId,
        departments,
        staffs,
        shifts,
        name,
        organizationId,
        enable,
        offWeekDays
      ]);
}

ShiftConfigsRequestStruct createShiftConfigsRequestStruct({
  String? status,
  String? addressId,
  String? name,
  String? organizationId,
  int? enable,
}) =>
    ShiftConfigsRequestStruct(
      status: status,
      addressId: addressId,
      name: name,
      organizationId: organizationId,
      enable: enable,
    );
