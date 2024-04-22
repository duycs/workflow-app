// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReactsIdStruct extends BaseStruct {
  ReactsIdStruct({
    String? status,
    String? staffId,
  })  : _status = status,
        _staffId = staffId;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "staff_id" field.
  String? _staffId;
  String get staffId => _staffId ?? '';
  set staffId(String? val) => _staffId = val;
  bool hasStaffId() => _staffId != null;

  static ReactsIdStruct fromMap(Map<String, dynamic> data) => ReactsIdStruct(
        status: data['status'] as String?,
        staffId: data['staff_id'] as String?,
      );

  static ReactsIdStruct? maybeFromMap(dynamic data) =>
      data is Map ? ReactsIdStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'staff_id': _staffId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'staff_id': serializeParam(
          _staffId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ReactsIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReactsIdStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        staffId: deserializeParam(
          data['staff_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ReactsIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReactsIdStruct &&
        status == other.status &&
        staffId == other.staffId;
  }

  @override
  int get hashCode => const ListEquality().hash([status, staffId]);
}

ReactsIdStruct createReactsIdStruct({
  String? status,
  String? staffId,
}) =>
    ReactsIdStruct(
      status: status,
      staffId: staffId,
    );
