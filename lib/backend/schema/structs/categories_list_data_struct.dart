// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesListDataStruct extends BaseStruct {
  CategoriesListDataStruct({
    List<CategoriesListStruct>? data,
  }) : _data = data;

  // "data" field.
  List<CategoriesListStruct>? _data;
  List<CategoriesListStruct> get data => _data ?? const [];
  set data(List<CategoriesListStruct>? val) => _data = val;
  void updateData(Function(List<CategoriesListStruct>) updateFn) =>
      updateFn(_data ??= []);
  bool hasData() => _data != null;

  static CategoriesListDataStruct fromMap(Map<String, dynamic> data) =>
      CategoriesListDataStruct(
        data: getStructList(
          data['data'],
          CategoriesListStruct.fromMap,
        ),
      );

  static CategoriesListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? CategoriesListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static CategoriesListDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CategoriesListDataStruct(
        data: deserializeStructParam<CategoriesListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: CategoriesListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CategoriesListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CategoriesListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

CategoriesListDataStruct createCategoriesListDataStruct() =>
    CategoriesListDataStruct();
