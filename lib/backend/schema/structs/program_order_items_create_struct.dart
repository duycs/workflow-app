// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramOrderItemsCreateStruct extends BaseStruct {
  ProgramOrderItemsCreateStruct({
    String? id,
    int? totalItem,
  })  : _id = id,
        _totalItem = totalItem;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "total_item" field.
  int? _totalItem;
  int get totalItem => _totalItem ?? 0;
  set totalItem(int? val) => _totalItem = val;
  void incrementTotalItem(int amount) => _totalItem = totalItem + amount;
  bool hasTotalItem() => _totalItem != null;

  static ProgramOrderItemsCreateStruct fromMap(Map<String, dynamic> data) =>
      ProgramOrderItemsCreateStruct(
        id: data['id'] as String?,
        totalItem: castToType<int>(data['total_item']),
      );

  static ProgramOrderItemsCreateStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? ProgramOrderItemsCreateStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'total_item': _totalItem,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'total_item': serializeParam(
          _totalItem,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProgramOrderItemsCreateStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProgramOrderItemsCreateStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        totalItem: deserializeParam(
          data['total_item'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProgramOrderItemsCreateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProgramOrderItemsCreateStruct &&
        id == other.id &&
        totalItem == other.totalItem;
  }

  @override
  int get hashCode => const ListEquality().hash([id, totalItem]);
}

ProgramOrderItemsCreateStruct createProgramOrderItemsCreateStruct({
  String? id,
  int? totalItem,
}) =>
    ProgramOrderItemsCreateStruct(
      id: id,
      totalItem: totalItem,
    );
