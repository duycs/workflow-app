// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BranchListDataStruct extends BaseStruct {
  BranchListDataStruct({
    List<BranchListStruct>? data,
  }) : _data = data;

  // "data" field.
  List<BranchListStruct>? _data;
  List<BranchListStruct> get data => _data ?? const [];
  set data(List<BranchListStruct>? val) => _data = val;

  void updateData(Function(List<BranchListStruct>) updateFn) {
    updateFn(data ??= []);
  }

  bool hasData() => _data != null;

  static BranchListDataStruct fromMap(Map<String, dynamic> data) =>
      BranchListDataStruct(
        data: getStructList(
          data['data'],
          BranchListStruct.fromMap,
        ),
      );

  static BranchListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? BranchListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static BranchListDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      BranchListDataStruct(
        data: deserializeStructParam<BranchListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: BranchListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'BranchListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BranchListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

BranchListDataStruct createBranchListDataStruct() => BranchListDataStruct();
