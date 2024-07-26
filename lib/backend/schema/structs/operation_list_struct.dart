// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OperationListStruct extends BaseStruct {
  OperationListStruct({
    OperationsIdStruct? operationsId,
    int? id,
  })  : _operationsId = operationsId,
        _id = id;

  // "operations_id" field.
  OperationsIdStruct? _operationsId;
  OperationsIdStruct get operationsId => _operationsId ?? OperationsIdStruct();
  set operationsId(OperationsIdStruct? val) => _operationsId = val;

  void updateOperationsId(Function(OperationsIdStruct) updateFn) {
    updateFn(_operationsId ??= OperationsIdStruct());
  }

  bool hasOperationsId() => _operationsId != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static OperationListStruct fromMap(Map<String, dynamic> data) =>
      OperationListStruct(
        operationsId: OperationsIdStruct.maybeFromMap(data['operations_id']),
        id: castToType<int>(data['id']),
      );

  static OperationListStruct? maybeFromMap(dynamic data) => data is Map
      ? OperationListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'operations_id': _operationsId?.toMap(),
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'operations_id': serializeParam(
          _operationsId,
          ParamType.DataStruct,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static OperationListStruct fromSerializableMap(Map<String, dynamic> data) =>
      OperationListStruct(
        operationsId: deserializeStructParam(
          data['operations_id'],
          ParamType.DataStruct,
          false,
          structBuilder: OperationsIdStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'OperationListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OperationListStruct &&
        operationsId == other.operationsId &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([operationsId, id]);
}

OperationListStruct createOperationListStruct({
  OperationsIdStruct? operationsId,
  int? id,
}) =>
    OperationListStruct(
      operationsId: operationsId ?? OperationsIdStruct(),
      id: id,
    );
