// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionAnswersIdStruct extends BaseStruct {
  QuestionAnswersIdStruct({
    String? id,
    String? content,
    int? correct,
    String? status,
  })  : _id = id,
        _content = content,
        _correct = correct,
        _status = status;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "correct" field.
  int? _correct;
  int get correct => _correct ?? 0;
  set correct(int? val) => _correct = val;

  void incrementCorrect(int amount) => correct = correct + amount;

  bool hasCorrect() => _correct != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  static QuestionAnswersIdStruct fromMap(Map<String, dynamic> data) =>
      QuestionAnswersIdStruct(
        id: data['id'] as String?,
        content: data['content'] as String?,
        correct: castToType<int>(data['correct']),
        status: data['status'] as String?,
      );

  static QuestionAnswersIdStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionAnswersIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'content': _content,
        'correct': _correct,
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'correct': serializeParam(
          _correct,
          ParamType.int,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuestionAnswersIdStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      QuestionAnswersIdStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        correct: deserializeParam(
          data['correct'],
          ParamType.int,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuestionAnswersIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuestionAnswersIdStruct &&
        id == other.id &&
        content == other.content &&
        correct == other.correct &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([id, content, correct, status]);
}

QuestionAnswersIdStruct createQuestionAnswersIdStruct({
  String? id,
  String? content,
  int? correct,
  String? status,
}) =>
    QuestionAnswersIdStruct(
      id: id,
      content: content,
      correct: correct,
      status: status,
    );
