// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListUserStruct extends BaseStruct {
  ListUserStruct({
    List<UserStruct>? data,
  }) : _data = data;

  // "data" field.
  List<UserStruct>? _data;
  List<UserStruct> get data => _data ?? const [];
  set data(List<UserStruct>? val) => _data = val;
  void updateData(Function(List<UserStruct>) updateFn) =>
      updateFn(_data ??= []);
  bool hasData() => _data != null;

  static ListUserStruct fromMap(Map<String, dynamic> data) => ListUserStruct(
        data: getStructList(
          data['data'],
          UserStruct.fromMap,
        ),
      );

  static ListUserStruct? maybeFromMap(dynamic data) =>
      data is Map ? ListUserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static ListUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      ListUserStruct(
        data: deserializeStructParam<UserStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: UserStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ListUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ListUserStruct && listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

ListUserStruct createListUserStruct() => ListUserStruct();
