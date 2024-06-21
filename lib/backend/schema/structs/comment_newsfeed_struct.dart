// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentNewsfeedStruct extends BaseStruct {
  CommentNewsfeedStruct({
    CommentStruct? commentsId,
  }) : _commentsId = commentsId;

  // "comments_id" field.
  CommentStruct? _commentsId;
  CommentStruct get commentsId => _commentsId ?? CommentStruct();
  set commentsId(CommentStruct? val) => _commentsId = val;

  void updateCommentsId(Function(CommentStruct) updateFn) {
    updateFn(commentsId ??= CommentStruct());
  }

  bool hasCommentsId() => _commentsId != null;

  static CommentNewsfeedStruct fromMap(Map<String, dynamic> data) =>
      CommentNewsfeedStruct(
        commentsId: CommentStruct.maybeFromMap(data['comments_id']),
      );

  static CommentNewsfeedStruct? maybeFromMap(dynamic data) => data is Map
      ? CommentNewsfeedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'comments_id': _commentsId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'comments_id': serializeParam(
          _commentsId,
          ParamType.DataStruct,
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
      );

  @override
  String toString() => 'CommentNewsfeedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommentNewsfeedStruct && commentsId == other.commentsId;
  }

  @override
  int get hashCode => const ListEquality().hash([commentsId]);
}

CommentNewsfeedStruct createCommentNewsfeedStruct({
  CommentStruct? commentsId,
}) =>
    CommentNewsfeedStruct(
      commentsId: commentsId ?? CommentStruct(),
    );
