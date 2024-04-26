// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DomainsListDataStruct extends BaseStruct {
  DomainsListDataStruct({
    List<DomainsListStruct>? data,
  }) : _data = data;

  // "data" field.
  List<DomainsListStruct>? _data;
  List<DomainsListStruct> get data => _data ?? const [];
  set data(List<DomainsListStruct>? val) => _data = val;
  void updateData(Function(List<DomainsListStruct>) updateFn) =>
      updateFn(_data ??= []);
  bool hasData() => _data != null;

  static DomainsListDataStruct fromMap(Map<String, dynamic> data) =>
      DomainsListDataStruct(
        data: getStructList(
          data['data'],
          DomainsListStruct.fromMap,
        ),
      );

  static DomainsListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? DomainsListDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

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

  static DomainsListDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DomainsListDataStruct(
        data: deserializeStructParam<DomainsListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: DomainsListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DomainsListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DomainsListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

DomainsListDataStruct createDomainsListDataStruct() => DomainsListDataStruct();
