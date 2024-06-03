// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsStruct extends BaseStruct {
  CommentsStruct({
    String? id,
    CommentsIdStruct? commentsId,
  })  : _id = id,
        _commentsId = commentsId;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "comments_id" field.
  CommentsIdStruct? _commentsId;
  CommentsIdStruct get commentsId => _commentsId ?? CommentsIdStruct();
  set commentsId(CommentsIdStruct? val) => _commentsId = val;
  void updateCommentsId(Function(CommentsIdStruct) updateFn) =>
      updateFn(_commentsId ??= CommentsIdStruct());
  bool hasCommentsId() => _commentsId != null;

  static CommentsStruct fromMap(Map<String, dynamic> data) => CommentsStruct(
        id: data['id'] as String?,
        commentsId: CommentsIdStruct.maybeFromMap(data['comments_id']),
      );

  static CommentsStruct? maybeFromMap(dynamic data) =>
      data is Map ? CommentsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'comments_id': _commentsId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'comments_id': serializeParam(
          _commentsId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static CommentsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommentsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        commentsId: deserializeStructParam(
          data['comments_id'],
          ParamType.DataStruct,
          false,
          structBuilder: CommentsIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CommentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommentsStruct &&
        id == other.id &&
        commentsId == other.commentsId;
  }

  @override
  int get hashCode => const ListEquality().hash([id, commentsId]);
}

CommentsStruct createCommentsStruct({
  String? id,
  CommentsIdStruct? commentsId,
}) =>
    CommentsStruct(
      id: id,
      commentsId: commentsId ?? CommentsIdStruct(),
    );
