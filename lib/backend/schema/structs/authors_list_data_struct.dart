// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthorsListDataStruct extends BaseStruct {
  AuthorsListDataStruct({
    List<AuthorsListStruct>? data,
  }) : _data = data;

  // "data" field.
  List<AuthorsListStruct>? _data;
  List<AuthorsListStruct> get data => _data ?? const [];
  set data(List<AuthorsListStruct>? val) => _data = val;

  void updateData(Function(List<AuthorsListStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static AuthorsListDataStruct fromMap(Map<String, dynamic> data) =>
      AuthorsListDataStruct(
        data: getStructList(
          data['data'],
          AuthorsListStruct.fromMap,
        ),
      );

  static AuthorsListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? AuthorsListDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static AuthorsListDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      AuthorsListDataStruct(
        data: deserializeStructParam<AuthorsListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: AuthorsListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AuthorsListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AuthorsListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

AuthorsListDataStruct createAuthorsListDataStruct() => AuthorsListDataStruct();
