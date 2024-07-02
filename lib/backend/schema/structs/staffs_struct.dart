// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffsStruct extends BaseStruct {
  StaffsStruct({
    String? id,
    UserIdStaffStruct? userId,
    String? title,
    String? status,
  })  : _id = id,
        _userId = userId,
        _title = title,
        _status = status;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "user_id" field.
  UserIdStaffStruct? _userId;
  UserIdStaffStruct get userId => _userId ?? UserIdStaffStruct();
  set userId(UserIdStaffStruct? val) => _userId = val;

  void updateUserId(Function(UserIdStaffStruct) updateFn) {
    updateFn(_userId ??= UserIdStaffStruct());
  }

  bool hasUserId() => _userId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  static StaffsStruct fromMap(Map<String, dynamic> data) => StaffsStruct(
        id: data['id'] as String?,
        userId: UserIdStaffStruct.maybeFromMap(data['user_id']),
        title: data['title'] as String?,
        status: data['status'] as String?,
      );

  static StaffsStruct? maybeFromMap(dynamic data) =>
      data is Map ? StaffsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'user_id': _userId?.toMap(),
        'title': _title,
        'status': _status,
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
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
      }.withoutNulls;

  static StaffsStruct fromSerializableMap(Map<String, dynamic> data) =>
      StaffsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        userId: deserializeStructParam(
          data['user_id'],
          ParamType.DataStruct,
          false,
          structBuilder: UserIdStaffStruct.fromSerializableMap,
        ),
        title: deserializeParam(
          data['title'],
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
  String toString() => 'StaffsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StaffsStruct &&
        id == other.id &&
        userId == other.userId &&
        title == other.title &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([id, userId, title, status]);
}

StaffsStruct createStaffsStruct({
  String? id,
  UserIdStaffStruct? userId,
  String? title,
  String? status,
}) =>
    StaffsStruct(
      id: id,
      userId: userId ?? UserIdStaffStruct(),
      title: title,
      status: status,
    );
