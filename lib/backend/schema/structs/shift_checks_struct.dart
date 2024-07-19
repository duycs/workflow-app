// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShiftChecksStruct extends BaseStruct {
  ShiftChecksStruct({
    String? id,
    String? status,
    String? checkin,
    String? checkout,
    LocationStruct? location,
    StaffListStruct? staffId,
  })  : _id = id,
        _status = status,
        _checkin = checkin,
        _checkout = checkout,
        _location = location,
        _staffId = staffId;

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

  // "checkin" field.
  String? _checkin;
  String get checkin => _checkin ?? '';
  set checkin(String? val) => _checkin = val;

  bool hasCheckin() => _checkin != null;

  // "checkout" field.
  String? _checkout;
  String get checkout => _checkout ?? '';
  set checkout(String? val) => _checkout = val;

  bool hasCheckout() => _checkout != null;

  // "location" field.
  LocationStruct? _location;
  LocationStruct get location => _location ?? LocationStruct();
  set location(LocationStruct? val) => _location = val;

  void updateLocation(Function(LocationStruct) updateFn) {
    updateFn(_location ??= LocationStruct());
  }

  bool hasLocation() => _location != null;

  // "staff_id" field.
  StaffListStruct? _staffId;
  StaffListStruct get staffId => _staffId ?? StaffListStruct();
  set staffId(StaffListStruct? val) => _staffId = val;

  void updateStaffId(Function(StaffListStruct) updateFn) {
    updateFn(_staffId ??= StaffListStruct());
  }

  bool hasStaffId() => _staffId != null;

  static ShiftChecksStruct fromMap(Map<String, dynamic> data) =>
      ShiftChecksStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        checkin: data['checkin'] as String?,
        checkout: data['checkout'] as String?,
        location: LocationStruct.maybeFromMap(data['location']),
        staffId: StaffListStruct.maybeFromMap(data['staff_id']),
      );

  static ShiftChecksStruct? maybeFromMap(dynamic data) => data is Map
      ? ShiftChecksStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'checkin': _checkin,
        'checkout': _checkout,
        'location': _location?.toMap(),
        'staff_id': _staffId?.toMap(),
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
        'checkin': serializeParam(
          _checkin,
          ParamType.String,
        ),
        'checkout': serializeParam(
          _checkout,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.DataStruct,
        ),
        'staff_id': serializeParam(
          _staffId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ShiftChecksStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShiftChecksStruct(
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
        checkin: deserializeParam(
          data['checkin'],
          ParamType.String,
          false,
        ),
        checkout: deserializeParam(
          data['checkout'],
          ParamType.String,
          false,
        ),
        location: deserializeStructParam(
          data['location'],
          ParamType.DataStruct,
          false,
          structBuilder: LocationStruct.fromSerializableMap,
        ),
        staffId: deserializeStructParam(
          data['staff_id'],
          ParamType.DataStruct,
          false,
          structBuilder: StaffListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ShiftChecksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShiftChecksStruct &&
        id == other.id &&
        status == other.status &&
        checkin == other.checkin &&
        checkout == other.checkout &&
        location == other.location &&
        staffId == other.staffId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, status, checkin, checkout, location, staffId]);
}

ShiftChecksStruct createShiftChecksStruct({
  String? id,
  String? status,
  String? checkin,
  String? checkout,
  LocationStruct? location,
  StaffListStruct? staffId,
}) =>
    ShiftChecksStruct(
      id: id,
      status: status,
      checkin: checkin,
      checkout: checkout,
      location: location ?? LocationStruct(),
      staffId: staffId ?? StaffListStruct(),
    );
