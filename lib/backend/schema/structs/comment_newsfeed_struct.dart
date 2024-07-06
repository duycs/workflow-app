// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentNewsfeedStruct extends BaseStruct {
  CommentNewsfeedStruct({
    CommentStruct? commentsId,
    int? id,
  })  : _commentsId = commentsId,
        _id = id;

  // "comments_id" field.
  CommentStruct? _commentsId;
  CommentStruct get commentsId => _commentsId ?? CommentStruct();
  set commentsId(CommentStruct? val) => _commentsId = val;

  void updateCommentsId(Function(CommentStruct) updateFn) {
    updateFn(_commentsId ??= CommentStruct());
  }

  bool hasCommentsId() => _commentsId != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static CommentNewsfeedStruct fromMap(Map<String, dynamic> data) =>
      CommentNewsfeedStruct(
        commentsId: CommentStruct.maybeFromMap(data['comments_id']),
        id: castToType<int>(data['id']),
      );

  static CommentNewsfeedStruct? maybeFromMap(dynamic data) => data is Map
      ? CommentNewsfeedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'comments_id': _commentsId?.toMap(),
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'comments_id': serializeParam(
          _commentsId,
          ParamType.DataStruct,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static CommentNewsfeedStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommentNewsfeedStruct(
        commentsId: deserializeStructParam(
          data['comments_id'],
          ParamType.DataStruct,
          false,
          structBuilder: CommentStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CommentNewsfeedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommentNewsfeedStruct &&
        commentsId == other.commentsId &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([commentsId, id]);
}

CommentNewsfeedStruct createCommentNewsfeedStruct({
  CommentStruct? commentsId,
  int? id,
}) =>
    CommentNewsfeedStruct(
      commentsId: commentsId ?? CommentStruct(),
      id: id,
    );
