// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestListDataStruct extends BaseStruct {
  TestListDataStruct({
    List<TestListStruct>? data,
  }) : _data = data;

  // "data" field.
  List<TestListStruct>? _data;
  List<TestListStruct> get data => _data ?? const [];
  set data(List<TestListStruct>? val) => _data = val;

  void updateData(Function(List<TestListStruct>) updateFn) {
    updateFn(data ??= []);
  }

  bool hasData() => _data != null;

  static TestListDataStruct fromMap(Map<String, dynamic> data) =>
      TestListDataStruct(
        data: getStructList(
          data['data'],
          TestListStruct.fromMap,
        ),
      );

  static TestListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? TestListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static TestListDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestListDataStruct(
        data: deserializeStructParam<TestListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: TestListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TestListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TestListDataStruct && listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

TestListDataStruct createTestListDataStruct() => TestListDataStruct();
