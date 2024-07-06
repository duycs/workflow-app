// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReadNewsfeedStruct extends BaseStruct {
  ReadNewsfeedStruct({
    int? id,
    CommentStruct? readsId,
  })  : _id = id,
        _readsId = readsId;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "reads_id" field.
  CommentStruct? _readsId;
  CommentStruct get readsId => _readsId ?? CommentStruct();
  set readsId(CommentStruct? val) => _readsId = val;

  void updateReadsId(Function(CommentStruct) updateFn) {
    updateFn(_readsId ??= CommentStruct());
  }

  bool hasReadsId() => _readsId != null;

  static ReadNewsfeedStruct fromMap(Map<String, dynamic> data) =>
      ReadNewsfeedStruct(
        id: castToType<int>(data['id']),
        readsId: CommentStruct.maybeFromMap(data['reads_id']),
      );

  static ReadNewsfeedStruct? maybeFromMap(dynamic data) => data is Map
      ? ReadNewsfeedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'reads_id': _readsId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'reads_id': serializeParam(
          _readsId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ReadNewsfeedStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReadNewsfeedStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        readsId: deserializeStructParam(
          data['reads_id'],
          ParamType.DataStruct,
          false,
          structBuilder: CommentStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ReadNewsfeedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReadNewsfeedStruct &&
        id == other.id &&
        readsId == other.readsId;
  }

  @override
  int get hashCode => const ListEquality().hash([id, readsId]);
}

ReadNewsfeedStruct createReadNewsfeedStruct({
  int? id,
  CommentStruct? readsId,
}) =>
    ReadNewsfeedStruct(
      id: id,
      readsId: readsId ?? CommentStruct(),
    );
