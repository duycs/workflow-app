// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? avatar,
    String? status,
    String? role,
    int? enableBiometric,
    List<StaffListStruct>? staffs,
  })  : _id = id,
        _firstName = firstName,
        _lastName = lastName,
        _email = email,
        _avatar = avatar,
        _status = status,
        _role = role,
        _enableBiometric = enableBiometric,
        _staffs = staffs;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  set avatar(String? val) => _avatar = val;

  bool hasAvatar() => _avatar != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  // "enable_biometric" field.
  int? _enableBiometric;
  int get enableBiometric => _enableBiometric ?? 0;
  set enableBiometric(int? val) => _enableBiometric = val;

  void incrementEnableBiometric(int amount) =>
      enableBiometric = enableBiometric + amount;

  bool hasEnableBiometric() => _enableBiometric != null;

  // "staffs" field.
  List<StaffListStruct>? _staffs;
  List<StaffListStruct> get staffs => _staffs ?? const [];
  set staffs(List<StaffListStruct>? val) => _staffs = val;

  void updateStaffs(Function(List<StaffListStruct>) updateFn) {
    updateFn(_staffs ??= []);
  }

  bool hasStaffs() => _staffs != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        id: data['id'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        email: data['email'] as String?,
        avatar: data['avatar'] as String?,
        status: data['status'] as String?,
        role: data['role'] as String?,
        enableBiometric: castToType<int>(data['enable_biometric']),
        staffs: getStructList(
          data['staffs'],
          StaffListStruct.fromMap,
        ),
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'first_name': _firstName,
        'last_name': _lastName,
        'email': _email,
        'avatar': _avatar,
        'status': _status,
        'role': _role,
        'enable_biometric': _enableBiometric,
        'staffs': _staffs?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'avatar': serializeParam(
          _avatar,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'enable_biometric': serializeParam(
          _enableBiometric,
          ParamType.int,
        ),
        'staffs': serializeParam(
          _staffs,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        avatar: deserializeParam(
          data['avatar'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        enableBiometric: deserializeParam(
          data['enable_biometric'],
          ParamType.int,
          false,
        ),
        staffs: deserializeStructParam<StaffListStruct>(
          data['staffs'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        avatar == other.avatar &&
        status == other.status &&
        role == other.role &&
        enableBiometric == other.enableBiometric &&
        listEquality.equals(staffs, other.staffs);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        firstName,
        lastName,
        email,
        avatar,
        status,
        role,
        enableBiometric,
        staffs
      ]);
}

UserStruct createUserStruct({
  String? id,
  String? firstName,
  String? lastName,
  String? email,
  String? avatar,
  String? status,
  String? role,
  int? enableBiometric,
}) =>
    UserStruct(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      avatar: avatar,
      status: status,
      role: role,
      enableBiometric: enableBiometric,
    );
