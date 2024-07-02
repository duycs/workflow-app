// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestQuestionsStruct extends BaseStruct {
  TestQuestionsStruct({
    TestQuestionsIdStruct? questionsId,
    int? id,
  })  : _questionsId = questionsId,
        _id = id;

  // "questions_id" field.
  TestQuestionsIdStruct? _questionsId;
  TestQuestionsIdStruct get questionsId =>
      _questionsId ?? TestQuestionsIdStruct();
  set questionsId(TestQuestionsIdStruct? val) => _questionsId = val;

  void updateQuestionsId(Function(TestQuestionsIdStruct) updateFn) {
    updateFn(_questionsId ??= TestQuestionsIdStruct());
  }

  bool hasQuestionsId() => _questionsId != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static TestQuestionsStruct fromMap(Map<String, dynamic> data) =>
      TestQuestionsStruct(
        questionsId: TestQuestionsIdStruct.maybeFromMap(data['questions_id']),
        id: castToType<int>(data['id']),
      );

  static TestQuestionsStruct? maybeFromMap(dynamic data) => data is Map
      ? TestQuestionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'questions_id': _questionsId?.toMap(),
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'questions_id': serializeParam(
          _questionsId,
          ParamType.DataStruct,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static TestQuestionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestQuestionsStruct(
        questionsId: deserializeStructParam(
          data['questions_id'],
          ParamType.DataStruct,
          false,
          structBuilder: TestQuestionsIdStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TestQuestionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TestQuestionsStruct &&
        questionsId == other.questionsId &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([questionsId, id]);
}

TestQuestionsStruct createTestQuestionsStruct({
  TestQuestionsIdStruct? questionsId,
  int? id,
}) =>
    TestQuestionsStruct(
      questionsId: questionsId ?? TestQuestionsIdStruct(),
      id: id,
    );
