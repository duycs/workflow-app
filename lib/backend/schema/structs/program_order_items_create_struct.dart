// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramOrderItemsCreateStruct extends BaseStruct {
  ProgramOrderItemsCreateStruct({
    String? id,
    int? totalItem,
    int? private,
  })  : _id = id,
        _totalItem = totalItem,
        _private = private;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "total_item" field.
  int? _totalItem;
  int get totalItem => _totalItem ?? 0;
  set totalItem(int? val) => _totalItem = val;

  void incrementTotalItem(int amount) => totalItem = totalItem + amount;

  bool hasTotalItem() => _totalItem != null;

  // "private" field.
  int? _private;
  int get private => _private ?? 0;
  set private(int? val) => _private = val;

  void incrementPrivate(int amount) => private = private + amount;

  bool hasPrivate() => _private != null;

  static ProgramOrderItemsCreateStruct fromMap(Map<String, dynamic> data) =>
      ProgramOrderItemsCreateStruct(
        id: data['id'] as String?,
        totalItem: castToType<int>(data['total_item']),
        private: castToType<int>(data['private']),
      );

  static ProgramOrderItemsCreateStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? ProgramOrderItemsCreateStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'total_item': _totalItem,
        'private': _private,
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
        'private': serializeParam(
          _private,
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
        private: deserializeParam(
          data['private'],
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
        totalItem == other.totalItem &&
        private == other.private;
  }

  @override
  int get hashCode => const ListEquality().hash([id, totalItem, private]);
}

ProgramOrderItemsCreateStruct createProgramOrderItemsCreateStruct({
  String? id,
  int? totalItem,
  int? private,
}) =>
    ProgramOrderItemsCreateStruct(
      id: id,
      totalItem: totalItem,
      private: private,
    );
