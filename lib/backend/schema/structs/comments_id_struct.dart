// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsIdStruct extends BaseStruct {
  CommentsIdStruct({
    String? id,
    String? content,
  })  : _id = id,
        _content = content;

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

  static CommentsIdStruct fromMap(Map<String, dynamic> data) =>
      CommentsIdStruct(
        id: data['id'] as String?,
        content: data['content'] as String?,
      );

  static CommentsIdStruct? maybeFromMap(dynamic data) => data is Map
      ? CommentsIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'content': _content,
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
      }.withoutNulls;

  static CommentsIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommentsIdStruct(
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
      );

  @override
  String toString() => 'CommentsIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommentsIdStruct &&
        id == other.id &&
        content == other.content;
  }

  @override
  int get hashCode => const ListEquality().hash([id, content]);
}

CommentsIdStruct createCommentsIdStruct({
  String? id,
  String? content,
}) =>
    CommentsIdStruct(
      id: id,
      content: content,
    );
