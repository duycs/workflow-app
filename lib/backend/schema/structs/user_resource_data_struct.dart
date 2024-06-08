// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserResourceDataStruct extends BaseStruct {
  UserResourceDataStruct({
    UserStruct? data,
  }) : _data = data;

  // "data" field.
  UserStruct? _data;
  UserStruct get data => _data ?? UserStruct();
  set data(UserStruct? val) => _data = val;
  void updateData(Function(UserStruct) updateFn) =>
      updateFn(_data ??= UserStruct());
  bool hasData() => _data != null;

  static UserResourceDataStruct fromMap(Map<String, dynamic> data) =>
      UserResourceDataStruct(
        data: UserStruct.maybeFromMap(data['data']),
      );

  static UserResourceDataStruct? maybeFromMap(dynamic data) => data is Map
      ? UserResourceDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static UserResourceDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserResourceDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserResourceDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserResourceDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

UserResourceDataStruct createUserResourceDataStruct({
  UserStruct? data,
}) =>
    UserResourceDataStruct(
      data: data ?? UserStruct(),
    );
