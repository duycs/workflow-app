// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReactsStruct extends BaseStruct {
  ReactsStruct({
    int? id,
    ReactsIdStruct? reactsId,
  })  : _id = id,
        _reactsId = reactsId;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "reacts_id" field.
  ReactsIdStruct? _reactsId;
  ReactsIdStruct get reactsId => _reactsId ?? ReactsIdStruct();
  set reactsId(ReactsIdStruct? val) => _reactsId = val;
  void updateReactsId(Function(ReactsIdStruct) updateFn) =>
      updateFn(_reactsId ??= ReactsIdStruct());
  bool hasReactsId() => _reactsId != null;

  static ReactsStruct fromMap(Map<String, dynamic> data) => ReactsStruct(
        id: castToType<int>(data['id']),
        reactsId: ReactsIdStruct.maybeFromMap(data['reacts_id']),
      );

  static ReactsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ReactsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'reacts_id': _reactsId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'reacts_id': serializeParam(
          _reactsId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ReactsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReactsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        reactsId: deserializeStructParam(
          data['reacts_id'],
          ParamType.DataStruct,
          false,
          structBuilder: ReactsIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ReactsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReactsStruct &&
        id == other.id &&
        reactsId == other.reactsId;
  }

  @override
  int get hashCode => const ListEquality().hash([id, reactsId]);
}

ReactsStruct createReactsStruct({
  int? id,
  ReactsIdStruct? reactsId,
}) =>
    ReactsStruct(
      id: id,
      reactsId: reactsId ?? ReactsIdStruct(),
    );
