// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DomainsListDataDataStruct extends BaseStruct {
  DomainsListDataDataStruct({
    List<DomainsListListStruct>? data,
  }) : _data = data;

  // "data" field.
  List<DomainsListListStruct>? _data;
  List<DomainsListListStruct> get data => _data ?? const [];
  set data(List<DomainsListListStruct>? val) => _data = val;

  void updateData(Function(List<DomainsListListStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static DomainsListDataDataStruct fromMap(Map<String, dynamic> data) =>
      DomainsListDataDataStruct(
        data: getStructList(
          data['data'],
          DomainsListListStruct.fromMap,
        ),
      );

  static DomainsListDataDataStruct? maybeFromMap(dynamic data) => data is Map
      ? DomainsListDataDataStruct.fromMap(data.cast<String, dynamic>())
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

  static DomainsListDataDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DomainsListDataDataStruct(
        data: deserializeStructParam<DomainsListListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: DomainsListListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DomainsListDataDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DomainsListDataDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

DomainsListDataDataStruct createDomainsListDataDataStruct() =>
    DomainsListDataDataStruct();
