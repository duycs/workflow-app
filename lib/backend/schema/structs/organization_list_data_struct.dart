// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrganizationListDataStruct extends BaseStruct {
  OrganizationListDataStruct({
    OrganizationListStruct? data,
  }) : _data = data;

  // "data" field.
  OrganizationListStruct? _data;
  OrganizationListStruct get data => _data ?? OrganizationListStruct();
  set data(OrganizationListStruct? val) => _data = val;

  void updateData(Function(OrganizationListStruct) updateFn) {
    updateFn(_data ??= OrganizationListStruct());
  }

  bool hasData() => _data != null;

  static OrganizationListDataStruct fromMap(Map<String, dynamic> data) =>
      OrganizationListDataStruct(
        data: OrganizationListStruct.maybeFromMap(data['data']),
      );

  static OrganizationListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? OrganizationListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static OrganizationListDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      OrganizationListDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: OrganizationListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'OrganizationListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrganizationListDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

OrganizationListDataStruct createOrganizationListDataStruct({
  OrganizationListStruct? data,
}) =>
    OrganizationListDataStruct(
      data: data ?? OrganizationListStruct(),
    );
