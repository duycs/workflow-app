// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudyProgramListTestIdStruct extends BaseStruct {
  StudyProgramListTestIdStruct({
    StaffsTestsListStruct? testsId,
  }) : _testsId = testsId;

  // "tests_id" field.
  StaffsTestsListStruct? _testsId;
  StaffsTestsListStruct get testsId => _testsId ?? StaffsTestsListStruct();
  set testsId(StaffsTestsListStruct? val) => _testsId = val;

  void updateTestsId(Function(StaffsTestsListStruct) updateFn) {
    updateFn(_testsId ??= StaffsTestsListStruct());
  }

  bool hasTestsId() => _testsId != null;

  static StudyProgramListTestIdStruct fromMap(Map<String, dynamic> data) =>
      StudyProgramListTestIdStruct(
        testsId: StaffsTestsListStruct.maybeFromMap(data['tests_id']),
      );

  static StudyProgramListTestIdStruct? maybeFromMap(dynamic data) => data is Map
      ? StudyProgramListTestIdStruct.fromMap(data.cast<String, dynamic>())
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

  static StudyProgramListTestIdStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StudyProgramListTestIdStruct(
        testsId: deserializeStructParam(
          data['tests_id'],
          ParamType.DataStruct,
          false,
          structBuilder: StaffsTestsListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StudyProgramListTestIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StudyProgramListTestIdStruct && testsId == other.testsId;
  }

  @override
  int get hashCode => const ListEquality().hash([testsId]);
}

StudyProgramListTestIdStruct createStudyProgramListTestIdStruct({
  StaffsTestsListStruct? testsId,
}) =>
    StudyProgramListTestIdStruct(
      testsId: testsId ?? StaffsTestsListStruct(),
    );
