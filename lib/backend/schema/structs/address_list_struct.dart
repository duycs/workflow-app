// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressListStruct extends BaseStruct {
  AddressListStruct({
    String? id,
    String? status,
    String? detail,
    int? meterRange,
    UserStruct? userCreated,
    String? dateCreated,
    AddressWardStruct? wardId,
    LocationStruct? location,
  })  : _id = id,
        _status = status,
        _detail = detail,
        _meterRange = meterRange,
        _userCreated = userCreated,
        _dateCreated = dateCreated,
        _wardId = wardId,
        _location = location;

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

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  set detail(String? val) => _detail = val;

  bool hasDetail() => _detail != null;

  // "meter_range" field.
  int? _meterRange;
  int get meterRange => _meterRange ?? 0;
  set meterRange(int? val) => _meterRange = val;

  void incrementMeterRange(int amount) => meterRange = meterRange + amount;

  bool hasMeterRange() => _meterRange != null;

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

  // "ward_id" field.
  AddressWardStruct? _wardId;
  AddressWardStruct get wardId => _wardId ?? AddressWardStruct();
  set wardId(AddressWardStruct? val) => _wardId = val;

  void updateWardId(Function(AddressWardStruct) updateFn) {
    updateFn(_wardId ??= AddressWardStruct());
  }

  bool hasWardId() => _wardId != null;

  // "location" field.
  LocationStruct? _location;
  LocationStruct get location => _location ?? LocationStruct();
  set location(LocationStruct? val) => _location = val;

  void updateLocation(Function(LocationStruct) updateFn) {
    updateFn(_location ??= LocationStruct());
  }

  bool hasLocation() => _location != null;

  static AddressListStruct fromMap(Map<String, dynamic> data) =>
      AddressListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        detail: data['detail'] as String?,
        meterRange: castToType<int>(data['meter_range']),
        userCreated: UserStruct.maybeFromMap(data['user_created']),
        dateCreated: data['date_created'] as String?,
        wardId: AddressWardStruct.maybeFromMap(data['ward_id']),
        location: LocationStruct.maybeFromMap(data['location']),
      );

  static AddressListStruct? maybeFromMap(dynamic data) => data is Map
      ? AddressListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'detail': _detail,
        'meter_range': _meterRange,
        'user_created': _userCreated?.toMap(),
        'date_created': _dateCreated,
        'ward_id': _wardId?.toMap(),
        'location': _location?.toMap(),
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
        'detail': serializeParam(
          _detail,
          ParamType.String,
        ),
        'meter_range': serializeParam(
          _meterRange,
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
        'ward_id': serializeParam(
          _wardId,
          ParamType.DataStruct,
        ),
        'location': serializeParam(
          _location,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AddressListStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressListStruct(
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
        detail: deserializeParam(
          data['detail'],
          ParamType.String,
          false,
        ),
        meterRange: deserializeParam(
          data['meter_range'],
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
        wardId: deserializeStructParam(
          data['ward_id'],
          ParamType.DataStruct,
          false,
          structBuilder: AddressWardStruct.fromSerializableMap,
        ),
        location: deserializeStructParam(
          data['location'],
          ParamType.DataStruct,
          false,
          structBuilder: LocationStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AddressListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressListStruct &&
        id == other.id &&
        status == other.status &&
        detail == other.detail &&
        meterRange == other.meterRange &&
        userCreated == other.userCreated &&
        dateCreated == other.dateCreated &&
        wardId == other.wardId &&
        location == other.location;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        detail,
        meterRange,
        userCreated,
        dateCreated,
        wardId,
        location
      ]);
}

AddressListStruct createAddressListStruct({
  String? id,
  String? status,
  String? detail,
  int? meterRange,
  UserStruct? userCreated,
  String? dateCreated,
  AddressWardStruct? wardId,
  LocationStruct? location,
}) =>
    AddressListStruct(
      id: id,
      status: status,
      detail: detail,
      meterRange: meterRange,
      userCreated: userCreated ?? UserStruct(),
      dateCreated: dateCreated,
      wardId: wardId ?? AddressWardStruct(),
      location: location ?? LocationStruct(),
    );
