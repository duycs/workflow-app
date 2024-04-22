// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswersListStruct extends BaseStruct {
  AnswersListStruct({
    TestAnswersIdStruct? answersId,
  }) : _answersId = answersId;

  // "answers_id" field.
  TestAnswersIdStruct? _answersId;
  TestAnswersIdStruct get answersId => _answersId ?? TestAnswersIdStruct();
  set answersId(TestAnswersIdStruct? val) => _answersId = val;
  void updateAnswersId(Function(TestAnswersIdStruct) updateFn) =>
      updateFn(_answersId ??= TestAnswersIdStruct());
  bool hasAnswersId() => _answersId != null;

  static AnswersListStruct fromMap(Map<String, dynamic> data) =>
      AnswersListStruct(
        answersId: TestAnswersIdStruct.maybeFromMap(data['answers_id']),
      );

  static AnswersListStruct? maybeFromMap(dynamic data) => data is Map
      ? AnswersListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'answers_id': _answersId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'answers_id': serializeParam(
          _answersId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AnswersListStruct fromSerializableMap(Map<String, dynamic> data) =>
      AnswersListStruct(
        answersId: deserializeStructParam(
          data['answers_id'],
          ParamType.DataStruct,
          false,
          structBuilder: TestAnswersIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AnswersListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AnswersListStruct && answersId == other.answersId;
  }

  @override
  int get hashCode => const ListEquality().hash([answersId]);
}

AnswersListStruct createAnswersListStruct({
  TestAnswersIdStruct? answersId,
}) =>
    AnswersListStruct(
      answersId: answersId ?? TestAnswersIdStruct(),
    );
