// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListDataCityStruct extends BaseStruct {
  ListDataCityStruct({
    List<ListCityStruct>? data,
  }) : _data = data;

  // "data" field.
  List<ListCityStruct>? _data;
  List<ListCityStruct> get data => _data ?? const [];
  set data(List<ListCityStruct>? val) => _data = val;

  void updateData(Function(List<ListCityStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static ListDataCityStruct fromMap(Map<String, dynamic> data) =>
      ListDataCityStruct(
        data: getStructList(
          data['data'],
          ListCityStruct.fromMap,
        ),
      );

  static ListDataCityStruct? maybeFromMap(dynamic data) => data is Map
      ? ListDataCityStruct.fromMap(data.cast<String, dynamic>())
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

  static ListDataCityStruct fromSerializableMap(Map<String, dynamic> data) =>
      ListDataCityStruct(
        data: deserializeStructParam<ListCityStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: ListCityStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ListDataCityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ListDataCityStruct && listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

ListDataCityStruct createListDataCityStruct() => ListDataCityStruct();
