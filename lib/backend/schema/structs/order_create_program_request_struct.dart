// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderCreateProgramRequestStruct extends BaseStruct {
  OrderCreateProgramRequestStruct({
    String? id,
    int? totalItem,
    String? description,
    int? private,
  })  : _id = id,
        _totalItem = totalItem,
        _description = description,
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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "private" field.
  int? _private;
  int get private => _private ?? 0;
  set private(int? val) => _private = val;

  void incrementPrivate(int amount) => private = private + amount;

  bool hasPrivate() => _private != null;

  static OrderCreateProgramRequestStruct fromMap(Map<String, dynamic> data) =>
      OrderCreateProgramRequestStruct(
        id: data['id'] as String?,
        totalItem: castToType<int>(data['total_item']),
        description: data['description'] as String?,
        private: castToType<int>(data['private']),
      );

  static OrderCreateProgramRequestStruct? maybeFromMap(dynamic data) => data
          is Map
      ? OrderCreateProgramRequestStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'total_item': _totalItem,
        'description': _description,
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
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'private': serializeParam(
          _private,
          ParamType.int,
        ),
      }.withoutNulls;

  static OrderCreateProgramRequestStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      OrderCreateProgramRequestStruct(
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
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        private: deserializeParam(
          data['private'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'OrderCreateProgramRequestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderCreateProgramRequestStruct &&
        id == other.id &&
        totalItem == other.totalItem &&
        description == other.description &&
        private == other.private;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, totalItem, description, private]);
}

OrderCreateProgramRequestStruct createOrderCreateProgramRequestStruct({
  String? id,
  int? totalItem,
  String? description,
  int? private,
}) =>
    OrderCreateProgramRequestStruct(
      id: id,
      totalItem: totalItem,
      description: description,
      private: private,
    );
