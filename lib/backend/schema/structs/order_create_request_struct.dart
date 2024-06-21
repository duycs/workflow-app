// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderCreateRequestStruct extends BaseStruct {
  OrderCreateRequestStruct({
    String? customerId,
    String? description,
    int? private,
    String? status,
    List<OrderCreateProgramRequestStruct>? programs,
  })  : _customerId = customerId,
        _description = description,
        _private = private,
        _status = status,
        _programs = programs;

  // "customer_id" field.
  String? _customerId;
  String get customerId => _customerId ?? '';
  set customerId(String? val) => _customerId = val;

  bool hasCustomerId() => _customerId != null;

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

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "programs" field.
  List<OrderCreateProgramRequestStruct>? _programs;
  List<OrderCreateProgramRequestStruct> get programs => _programs ?? const [];
  set programs(List<OrderCreateProgramRequestStruct>? val) => _programs = val;

  void updatePrograms(
      Function(List<OrderCreateProgramRequestStruct>) updateFn) {
    updateFn(programs ??= []);
  }

  bool hasPrograms() => _programs != null;

  static OrderCreateRequestStruct fromMap(Map<String, dynamic> data) =>
      OrderCreateRequestStruct(
        customerId: data['customer_id'] as String?,
        description: data['description'] as String?,
        private: castToType<int>(data['private']),
        status: data['status'] as String?,
        programs: getStructList(
          data['programs'],
          OrderCreateProgramRequestStruct.fromMap,
        ),
      );

  static OrderCreateRequestStruct? maybeFromMap(dynamic data) => data is Map
      ? OrderCreateRequestStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'customer_id': _customerId,
        'description': _description,
        'private': _private,
        'status': _status,
        'programs': _programs?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'customer_id': serializeParam(
          _customerId,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'private': serializeParam(
          _private,
          ParamType.int,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'programs': serializeParam(
          _programs,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static OrderCreateRequestStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      OrderCreateRequestStruct(
        customerId: deserializeParam(
          data['customer_id'],
          ParamType.String,
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
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        programs: deserializeStructParam<OrderCreateProgramRequestStruct>(
          data['programs'],
          ParamType.DataStruct,
          true,
          structBuilder: OrderCreateProgramRequestStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'OrderCreateRequestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OrderCreateRequestStruct &&
        customerId == other.customerId &&
        description == other.description &&
        private == other.private &&
        status == other.status &&
        listEquality.equals(programs, other.programs);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([customerId, description, private, status, programs]);
}

OrderCreateRequestStruct createOrderCreateRequestStruct({
  String? customerId,
  String? description,
  int? private,
  String? status,
}) =>
    OrderCreateRequestStruct(
      customerId: customerId,
      description: description,
      private: private,
      status: status,
    );
