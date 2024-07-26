// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramOrderItemsStruct extends BaseStruct {
  ProgramOrderItemsStruct({
    String? id,
    String? description,
    int? totalItem,
    String? totalPrice,
    String? status,
    ProgramsIdStruct? programId,
  })  : _id = id,
        _description = description,
        _totalItem = totalItem,
        _totalPrice = totalPrice,
        _status = status,
        _programId = programId;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "total_item" field.
  int? _totalItem;
  int get totalItem => _totalItem ?? 0;
  set totalItem(int? val) => _totalItem = val;

  void incrementTotalItem(int amount) => totalItem = totalItem + amount;

  bool hasTotalItem() => _totalItem != null;

  // "total_price" field.
  String? _totalPrice;
  String get totalPrice => _totalPrice ?? '';
  set totalPrice(String? val) => _totalPrice = val;

  bool hasTotalPrice() => _totalPrice != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "program_id" field.
  ProgramsIdStruct? _programId;
  ProgramsIdStruct get programId => _programId ?? ProgramsIdStruct();
  set programId(ProgramsIdStruct? val) => _programId = val;

  void updateProgramId(Function(ProgramsIdStruct) updateFn) {
    updateFn(_programId ??= ProgramsIdStruct());
  }

  bool hasProgramId() => _programId != null;

  static ProgramOrderItemsStruct fromMap(Map<String, dynamic> data) =>
      ProgramOrderItemsStruct(
        id: data['id'] as String?,
        description: data['description'] as String?,
        totalItem: castToType<int>(data['total_item']),
        totalPrice: data['total_price'] as String?,
        status: data['status'] as String?,
        programId: ProgramsIdStruct.maybeFromMap(data['program_id']),
      );

  static ProgramOrderItemsStruct? maybeFromMap(dynamic data) => data is Map
      ? ProgramOrderItemsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'description': _description,
        'total_item': _totalItem,
        'total_price': _totalPrice,
        'status': _status,
        'program_id': _programId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'total_item': serializeParam(
          _totalItem,
          ParamType.int,
        ),
        'total_price': serializeParam(
          _totalPrice,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'program_id': serializeParam(
          _programId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ProgramOrderItemsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProgramOrderItemsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        totalItem: deserializeParam(
          data['total_item'],
          ParamType.int,
          false,
        ),
        totalPrice: deserializeParam(
          data['total_price'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        programId: deserializeStructParam(
          data['program_id'],
          ParamType.DataStruct,
          false,
          structBuilder: ProgramsIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProgramOrderItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProgramOrderItemsStruct &&
        id == other.id &&
        description == other.description &&
        totalItem == other.totalItem &&
        totalPrice == other.totalPrice &&
        status == other.status &&
        programId == other.programId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, description, totalItem, totalPrice, status, programId]);
}

ProgramOrderItemsStruct createProgramOrderItemsStruct({
  String? id,
  String? description,
  int? totalItem,
  String? totalPrice,
  String? status,
  ProgramsIdStruct? programId,
}) =>
    ProgramOrderItemsStruct(
      id: id,
      description: description,
      totalItem: totalItem,
      totalPrice: totalPrice,
      status: status,
      programId: programId ?? ProgramsIdStruct(),
    );
