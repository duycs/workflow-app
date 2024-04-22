// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckUpdateStepStruct extends BaseStruct {
  CheckUpdateStepStruct({
    String? firstName,
    String? name,
    String? staffId,
  })  : _firstName = firstName,
        _name = name,
        _staffId = staffId;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;
  bool hasFirstName() => _firstName != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "staffId" field.
  String? _staffId;
  String get staffId => _staffId ?? '';
  set staffId(String? val) => _staffId = val;
  bool hasStaffId() => _staffId != null;

  static CheckUpdateStepStruct fromMap(Map<String, dynamic> data) =>
      CheckUpdateStepStruct(
        firstName: data['first_name'] as String?,
        name: data['name'] as String?,
        staffId: data['staffId'] as String?,
      );

  static CheckUpdateStepStruct? maybeFromMap(dynamic data) => data is Map
      ? CheckUpdateStepStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'first_name': _firstName,
        'name': _name,
        'staffId': _staffId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'staffId': serializeParam(
          _staffId,
          ParamType.String,
        ),
      }.withoutNulls;

  static CheckUpdateStepStruct fromSerializableMap(Map<String, dynamic> data) =>
      CheckUpdateStepStruct(
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        staffId: deserializeParam(
          data['staffId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CheckUpdateStepStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CheckUpdateStepStruct &&
        firstName == other.firstName &&
        name == other.name &&
        staffId == other.staffId;
  }

  @override
  int get hashCode => const ListEquality().hash([firstName, name, staffId]);
}

CheckUpdateStepStruct createCheckUpdateStepStruct({
  String? firstName,
  String? name,
  String? staffId,
}) =>
    CheckUpdateStepStruct(
      firstName: firstName,
      name: name,
      staffId: staffId,
    );
