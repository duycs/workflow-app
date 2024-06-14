// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffListInfoStruct extends BaseStruct {
  StaffListInfoStruct({
    String? id,
    String? status,
    String? userId,
    String? cccd,
    String? gender,
    String? phone,
    String? dob,
  })  : _id = id,
        _status = status,
        _userId = userId,
        _cccd = cccd,
        _gender = gender,
        _phone = phone,
        _dob = dob;

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

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "cccd" field.
  String? _cccd;
  String get cccd => _cccd ?? '';
  set cccd(String? val) => _cccd = val;

  bool hasCccd() => _cccd != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "dob" field.
  String? _dob;
  String get dob => _dob ?? '';
  set dob(String? val) => _dob = val;

  bool hasDob() => _dob != null;

  static StaffListInfoStruct fromMap(Map<String, dynamic> data) =>
      StaffListInfoStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        userId: data['user_id'] as String?,
        cccd: data['cccd'] as String?,
        gender: data['gender'] as String?,
        phone: data['phone'] as String?,
        dob: data['dob'] as String?,
      );

  static StaffListInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffListInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'user_id': _userId,
        'cccd': _cccd,
        'gender': _gender,
        'phone': _phone,
        'dob': _dob,
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
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'cccd': serializeParam(
          _cccd,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'dob': serializeParam(
          _dob,
          ParamType.String,
        ),
      }.withoutNulls;

  static StaffListInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      StaffListInfoStruct(
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
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        cccd: deserializeParam(
          data['cccd'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        dob: deserializeParam(
          data['dob'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StaffListInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StaffListInfoStruct &&
        id == other.id &&
        status == other.status &&
        userId == other.userId &&
        cccd == other.cccd &&
        gender == other.gender &&
        phone == other.phone &&
        dob == other.dob;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, status, userId, cccd, gender, phone, dob]);
}

StaffListInfoStruct createStaffListInfoStruct({
  String? id,
  String? status,
  String? userId,
  String? cccd,
  String? gender,
  String? phone,
  String? dob,
}) =>
    StaffListInfoStruct(
      id: id,
      status: status,
      userId: userId,
      cccd: cccd,
      gender: gender,
      phone: phone,
      dob: dob,
    );
