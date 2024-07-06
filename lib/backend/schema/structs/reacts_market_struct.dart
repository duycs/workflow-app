// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReactsMarketStruct extends BaseStruct {
  ReactsMarketStruct({
    int? id,
    ReactsIdMarketStruct? reactsId,
  })  : _id = id,
        _reactsId = reactsId;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "reacts_id" field.
  ReactsIdMarketStruct? _reactsId;
  ReactsIdMarketStruct get reactsId => _reactsId ?? ReactsIdMarketStruct();
  set reactsId(ReactsIdMarketStruct? val) => _reactsId = val;

  void updateReactsId(Function(ReactsIdMarketStruct) updateFn) {
    updateFn(_reactsId ??= ReactsIdMarketStruct());
  }

  bool hasReactsId() => _reactsId != null;

  static ReactsMarketStruct fromMap(Map<String, dynamic> data) =>
      ReactsMarketStruct(
        id: castToType<int>(data['id']),
        reactsId: ReactsIdMarketStruct.maybeFromMap(data['reacts_id']),
      );

  static ReactsMarketStruct? maybeFromMap(dynamic data) => data is Map
      ? ReactsMarketStruct.fromMap(data.cast<String, dynamic>())
      : null;

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

  static ReactsMarketStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReactsMarketStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        reactsId: deserializeStructParam(
          data['reacts_id'],
          ParamType.DataStruct,
          false,
          structBuilder: ReactsIdMarketStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ReactsMarketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReactsMarketStruct &&
        id == other.id &&
        reactsId == other.reactsId;
  }

  @override
  int get hashCode => const ListEquality().hash([id, reactsId]);
}

ReactsMarketStruct createReactsMarketStruct({
  int? id,
  ReactsIdMarketStruct? reactsId,
}) =>
    ReactsMarketStruct(
      id: id,
      reactsId: reactsId ?? ReactsIdMarketStruct(),
    );
