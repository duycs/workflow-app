// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReactsIdMarketStruct extends BaseStruct {
  ReactsIdMarketStruct({
    String? id,
    String? staffId,
    String? status,
  })  : _id = id,
        _staffId = staffId,
        _status = status;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "staff_id" field.
  String? _staffId;
  String get staffId => _staffId ?? '';
  set staffId(String? val) => _staffId = val;

  bool hasStaffId() => _staffId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  static ReactsIdMarketStruct fromMap(Map<String, dynamic> data) =>
      ReactsIdMarketStruct(
        id: data['id'] as String?,
        staffId: data['staff_id'] as String?,
        status: data['status'] as String?,
      );

  static ReactsIdMarketStruct? maybeFromMap(dynamic data) => data is Map
      ? ReactsIdMarketStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'staff_id': _staffId,
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'staff_id': serializeParam(
          _staffId,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
      }.withoutNulls;

  static ReactsIdMarketStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReactsIdMarketStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        staffId: deserializeParam(
          data['staff_id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ReactsIdMarketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReactsIdMarketStruct &&
        id == other.id &&
        staffId == other.staffId &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([id, staffId, status]);
}

ReactsIdMarketStruct createReactsIdMarketStruct({
  String? id,
  String? staffId,
  String? status,
}) =>
    ReactsIdMarketStruct(
      id: id,
      staffId: staffId,
      status: status,
    );
