// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramOrderStruct extends BaseStruct {
  ProgramOrderStruct({
    String? id,
    String? status,
    String? userCreated,
    String? dateCreated,
    String? userUpdated,
    String? dateUpdated,
    String? code,
    String? description,
    String? organizationId,
    int? totalItem,
    String? totalPrice,
    List<ProgramOrderItemsStruct>? programOrderItems,
    int? private,
  })  : _id = id,
        _status = status,
        _userCreated = userCreated,
        _dateCreated = dateCreated,
        _userUpdated = userUpdated,
        _dateUpdated = dateUpdated,
        _code = code,
        _description = description,
        _organizationId = organizationId,
        _totalItem = totalItem,
        _totalPrice = totalPrice,
        _programOrderItems = programOrderItems,
        _private = private;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "user_created" field.
  String? _userCreated;
  String get userCreated => _userCreated ?? '';
  set userCreated(String? val) => _userCreated = val;

  bool hasUserCreated() => _userCreated != null;

  // "date_created" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;

  bool hasDateCreated() => _dateCreated != null;

  // "user_updated" field.
  String? _userUpdated;
  String get userUpdated => _userUpdated ?? '';
  set userUpdated(String? val) => _userUpdated = val;

  bool hasUserUpdated() => _userUpdated != null;

  // "date_updated" field.
  String? _dateUpdated;
  String get dateUpdated => _dateUpdated ?? '';
  set dateUpdated(String? val) => _dateUpdated = val;

  bool hasDateUpdated() => _dateUpdated != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "organization_id" field.
  String? _organizationId;
  String get organizationId => _organizationId ?? '';
  set organizationId(String? val) => _organizationId = val;

  bool hasOrganizationId() => _organizationId != null;

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

  // "program_order_items" field.
  List<ProgramOrderItemsStruct>? _programOrderItems;
  List<ProgramOrderItemsStruct> get programOrderItems =>
      _programOrderItems ?? const [];
  set programOrderItems(List<ProgramOrderItemsStruct>? val) =>
      _programOrderItems = val;

  void updateProgramOrderItems(
      Function(List<ProgramOrderItemsStruct>) updateFn) {
    updateFn(_programOrderItems ??= []);
  }

  bool hasProgramOrderItems() => _programOrderItems != null;

  // "private" field.
  int? _private;
  int get private => _private ?? 0;
  set private(int? val) => _private = val;

  void incrementPrivate(int amount) => private = private + amount;

  bool hasPrivate() => _private != null;

  static ProgramOrderStruct fromMap(Map<String, dynamic> data) =>
      ProgramOrderStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        userCreated: data['user_created'] as String?,
        dateCreated: data['date_created'] as String?,
        userUpdated: data['user_updated'] as String?,
        dateUpdated: data['date_updated'] as String?,
        code: data['code'] as String?,
        description: data['description'] as String?,
        organizationId: data['organization_id'] as String?,
        totalItem: castToType<int>(data['total_item']),
        totalPrice: data['total_price'] as String?,
        programOrderItems: getStructList(
          data['program_order_items'],
          ProgramOrderItemsStruct.fromMap,
        ),
        private: castToType<int>(data['private']),
      );

  static ProgramOrderStruct? maybeFromMap(dynamic data) => data is Map
      ? ProgramOrderStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'user_created': _userCreated,
        'date_created': _dateCreated,
        'user_updated': _userUpdated,
        'date_updated': _dateUpdated,
        'code': _code,
        'description': _description,
        'organization_id': _organizationId,
        'total_item': _totalItem,
        'total_price': _totalPrice,
        'program_order_items':
            _programOrderItems?.map((e) => e.toMap()).toList(),
        'private': _private,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'user_created': serializeParam(
          _userCreated,
          ParamType.String,
        ),
        'date_created': serializeParam(
          _dateCreated,
          ParamType.String,
        ),
        'user_updated': serializeParam(
          _userUpdated,
          ParamType.String,
        ),
        'date_updated': serializeParam(
          _dateUpdated,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'organization_id': serializeParam(
          _organizationId,
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
        'program_order_items': serializeParam(
          _programOrderItems,
          ParamType.DataStruct,
          isList: true,
        ),
        'private': serializeParam(
          _private,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProgramOrderStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProgramOrderStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        userCreated: deserializeParam(
          data['user_created'],
          ParamType.String,
          false,
        ),
        dateCreated: deserializeParam(
          data['date_created'],
          ParamType.String,
          false,
        ),
        userUpdated: deserializeParam(
          data['user_updated'],
          ParamType.String,
          false,
        ),
        dateUpdated: deserializeParam(
          data['date_updated'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        organizationId: deserializeParam(
          data['organization_id'],
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
        programOrderItems: deserializeStructParam<ProgramOrderItemsStruct>(
          data['program_order_items'],
          ParamType.DataStruct,
          true,
          structBuilder: ProgramOrderItemsStruct.fromSerializableMap,
        ),
        private: deserializeParam(
          data['private'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProgramOrderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProgramOrderStruct &&
        id == other.id &&
        status == other.status &&
        userCreated == other.userCreated &&
        dateCreated == other.dateCreated &&
        userUpdated == other.userUpdated &&
        dateUpdated == other.dateUpdated &&
        code == other.code &&
        description == other.description &&
        organizationId == other.organizationId &&
        totalItem == other.totalItem &&
        totalPrice == other.totalPrice &&
        listEquality.equals(programOrderItems, other.programOrderItems) &&
        private == other.private;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        userCreated,
        dateCreated,
        userUpdated,
        dateUpdated,
        code,
        description,
        organizationId,
        totalItem,
        totalPrice,
        programOrderItems,
        private
      ]);
}

ProgramOrderStruct createProgramOrderStruct({
  String? id,
  String? status,
  String? userCreated,
  String? dateCreated,
  String? userUpdated,
  String? dateUpdated,
  String? code,
  String? description,
  String? organizationId,
  int? totalItem,
  String? totalPrice,
  int? private,
}) =>
    ProgramOrderStruct(
      id: id,
      status: status,
      userCreated: userCreated,
      dateCreated: dateCreated,
      userUpdated: userUpdated,
      dateUpdated: dateUpdated,
      code: code,
      description: description,
      organizationId: organizationId,
      totalItem: totalItem,
      totalPrice: totalPrice,
      private: private,
    );
