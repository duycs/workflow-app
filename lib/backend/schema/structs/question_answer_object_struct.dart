// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionAnswerObjectStruct extends BaseStruct {
  QuestionAnswerObjectStruct({
    QuestionAnswersIdStruct? answersId,
    int? id,
  })  : _answersId = answersId,
        _id = id;

  // "answers_id" field.
  QuestionAnswersIdStruct? _answersId;
  QuestionAnswersIdStruct get answersId =>
      _answersId ?? QuestionAnswersIdStruct();
  set answersId(QuestionAnswersIdStruct? val) => _answersId = val;

  void updateAnswersId(Function(QuestionAnswersIdStruct) updateFn) {
    updateFn(_answersId ??= QuestionAnswersIdStruct());
  }

  bool hasAnswersId() => _answersId != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static QuestionAnswerObjectStruct fromMap(Map<String, dynamic> data) =>
      QuestionAnswerObjectStruct(
        answersId: QuestionAnswersIdStruct.maybeFromMap(data['answers_id']),
        id: castToType<int>(data['id']),
      );

  static QuestionAnswerObjectStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionAnswerObjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'answers_id': _answersId?.toMap(),
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'answers_id': serializeParam(
          _answersId,
          ParamType.DataStruct,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static QuestionAnswerObjectStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      QuestionAnswerObjectStruct(
        answersId: deserializeStructParam(
          data['answers_id'],
          ParamType.DataStruct,
          false,
          structBuilder: QuestionAnswersIdStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'QuestionAnswerObjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuestionAnswerObjectStruct &&
        answersId == other.answersId &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([answersId, id]);
}

QuestionAnswerObjectStruct createQuestionAnswerObjectStruct({
  QuestionAnswersIdStruct? answersId,
  int? id,
}) =>
    QuestionAnswerObjectStruct(
      answersId: answersId ?? QuestionAnswersIdStruct(),
      id: id,
    );
