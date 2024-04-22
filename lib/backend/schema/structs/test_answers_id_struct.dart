// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestAnswersIdStruct extends BaseStruct {
  TestAnswersIdStruct({
    String? id,
    String? content,
    int? correct,
  })  : _id = id,
        _content = content,
        _correct = correct;

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
  void incrementCorrect(int amount) => _correct = correct + amount;
  bool hasCorrect() => _correct != null;

  static TestAnswersIdStruct fromMap(Map<String, dynamic> data) =>
      TestAnswersIdStruct(
        id: data['id'] as String?,
        content: data['content'] as String?,
        correct: castToType<int>(data['correct']),
      );

  static TestAnswersIdStruct? maybeFromMap(dynamic data) => data is Map
      ? TestAnswersIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'content': _content,
        'correct': _correct,
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
      }.withoutNulls;

  static TestAnswersIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestAnswersIdStruct(
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
      );

  @override
  String toString() => 'TestAnswersIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TestAnswersIdStruct &&
        id == other.id &&
        content == other.content &&
        correct == other.correct;
  }

  @override
  int get hashCode => const ListEquality().hash([id, content, correct]);
}

TestAnswersIdStruct createTestAnswersIdStruct({
  String? id,
  String? content,
  int? correct,
}) =>
    TestAnswersIdStruct(
      id: id,
      content: content,
      correct: correct,
    );
