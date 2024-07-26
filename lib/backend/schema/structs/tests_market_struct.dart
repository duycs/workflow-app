// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestsMarketStruct extends BaseStruct {
  TestsMarketStruct({
    TestsIdMarketStruct? testsId,
  }) : _testsId = testsId;

  // "tests_id" field.
  TestsIdMarketStruct? _testsId;
  TestsIdMarketStruct get testsId => _testsId ?? TestsIdMarketStruct();
  set testsId(TestsIdMarketStruct? val) => _testsId = val;

  void updateTestsId(Function(TestsIdMarketStruct) updateFn) {
    updateFn(_testsId ??= TestsIdMarketStruct());
  }

  bool hasTestsId() => _testsId != null;

  static TestsMarketStruct fromMap(Map<String, dynamic> data) =>
      TestsMarketStruct(
        testsId: TestsIdMarketStruct.maybeFromMap(data['tests_id']),
      );

  static TestsMarketStruct? maybeFromMap(dynamic data) => data is Map
      ? TestsMarketStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tests_id': _testsId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tests_id': serializeParam(
          _testsId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static TestsMarketStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestsMarketStruct(
        testsId: deserializeStructParam(
          data['tests_id'],
          ParamType.DataStruct,
          false,
          structBuilder: TestsIdMarketStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TestsMarketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TestsMarketStruct && testsId == other.testsId;
  }

  @override
  int get hashCode => const ListEquality().hash([testsId]);
}

TestsMarketStruct createTestsMarketStruct({
  TestsIdMarketStruct? testsId,
}) =>
    TestsMarketStruct(
      testsId: testsId ?? TestsIdMarketStruct(),
    );
