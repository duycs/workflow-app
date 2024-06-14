// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestOneDataStruct extends BaseStruct {
  TestOneDataStruct({
    TestListStruct? data,
  }) : _data = data;

  // "data" field.
  TestListStruct? _data;
  TestListStruct get data => _data ?? TestListStruct();
  set data(TestListStruct? val) => _data = val;

  void updateData(Function(TestListStruct) updateFn) {
    updateFn(data ??= TestListStruct());
  }

  bool hasData() => _data != null;

  static TestOneDataStruct fromMap(Map<String, dynamic> data) =>
      TestOneDataStruct(
        data: TestListStruct.maybeFromMap(data['data']),
      );

  static TestOneDataStruct? maybeFromMap(dynamic data) => data is Map
      ? TestOneDataStruct.fromMap(data.cast<String, dynamic>())
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

  static TestOneDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestOneDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: TestListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TestOneDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TestOneDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

TestOneDataStruct createTestOneDataStruct({
  TestListStruct? data,
}) =>
    TestOneDataStruct(
      data: data ?? TestListStruct(),
    );
