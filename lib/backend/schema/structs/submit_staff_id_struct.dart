// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubmitStaffIdStruct extends BaseStruct {
  SubmitStaffIdStruct({
    String? id,
    UserStruct? userId,
  })  : _id = id,
        _userId = userId;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "user_id" field.
  UserStruct? _userId;
  UserStruct get userId => _userId ?? UserStruct();
  set userId(UserStruct? val) => _userId = val;
  void updateUserId(Function(UserStruct) updateFn) =>
      updateFn(_userId ??= UserStruct());
  bool hasUserId() => _userId != null;

  static SubmitStaffIdStruct fromMap(Map<String, dynamic> data) =>
      SubmitStaffIdStruct(
        id: data['id'] as String?,
        userId: UserStruct.maybeFromMap(data['user_id']),
      );

  static SubmitStaffIdStruct? maybeFromMap(dynamic data) => data is Map
      ? SubmitStaffIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'user_id': _userId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static SubmitStaffIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubmitStaffIdStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        userId: deserializeStructParam(
          data['user_id'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SubmitStaffIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubmitStaffIdStruct &&
        id == other.id &&
        userId == other.userId;
  }

  @override
  int get hashCode => const ListEquality().hash([id, userId]);
}

SubmitStaffIdStruct createSubmitStaffIdStruct({
  String? id,
  UserStruct? userId,
}) =>
    SubmitStaffIdStruct(
      id: id,
      userId: userId ?? UserStruct(),
    );
