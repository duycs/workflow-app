// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthorsListStruct extends BaseStruct {
  AuthorsListStruct({
    String? id,
    String? status,
    String? userCreated,
    String? dateCreated,
    String? userUpdated,
    String? dateUpdated,
    String? staffId,
    String? alias,
    String? description,
    String? organizationId,
    List<DomainsStruct>? domains,
    String? avatar,
    int? orderCount,
  })  : _id = id,
        _status = status,
        _userCreated = userCreated,
        _dateCreated = dateCreated,
        _userUpdated = userUpdated,
        _dateUpdated = dateUpdated,
        _staffId = staffId,
        _alias = alias,
        _description = description,
        _organizationId = organizationId,
        _domains = domains,
        _avatar = avatar,
        _orderCount = orderCount;

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

  // "staff_id" field.
  String? _staffId;
  String get staffId => _staffId ?? '';
  set staffId(String? val) => _staffId = val;

  bool hasStaffId() => _staffId != null;

  // "alias" field.
  String? _alias;
  String get alias => _alias ?? '';
  set alias(String? val) => _alias = val;

  bool hasAlias() => _alias != null;

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

  // "domains" field.
  List<DomainsStruct>? _domains;
  List<DomainsStruct> get domains => _domains ?? const [];
  set domains(List<DomainsStruct>? val) => _domains = val;

  void updateDomains(Function(List<DomainsStruct>) updateFn) {
    updateFn(_domains ??= []);
  }

  bool hasDomains() => _domains != null;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  set avatar(String? val) => _avatar = val;

  bool hasAvatar() => _avatar != null;

  // "order_count" field.
  int? _orderCount;
  int get orderCount => _orderCount ?? 0;
  set orderCount(int? val) => _orderCount = val;

  void incrementOrderCount(int amount) => orderCount = orderCount + amount;

  bool hasOrderCount() => _orderCount != null;

  static AuthorsListStruct fromMap(Map<String, dynamic> data) =>
      AuthorsListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        userCreated: data['user_created'] as String?,
        dateCreated: data['date_created'] as String?,
        userUpdated: data['user_updated'] as String?,
        dateUpdated: data['date_updated'] as String?,
        staffId: data['staff_id'] as String?,
        alias: data['alias'] as String?,
        description: data['description'] as String?,
        organizationId: data['organization_id'] as String?,
        domains: getStructList(
          data['domains'],
          DomainsStruct.fromMap,
        ),
        avatar: data['avatar'] as String?,
        orderCount: castToType<int>(data['order_count']),
      );

  static AuthorsListStruct? maybeFromMap(dynamic data) => data is Map
      ? AuthorsListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'user_created': _userCreated,
        'date_created': _dateCreated,
        'user_updated': _userUpdated,
        'date_updated': _dateUpdated,
        'staff_id': _staffId,
        'alias': _alias,
        'description': _description,
        'organization_id': _organizationId,
        'domains': _domains?.map((e) => e.toMap()).toList(),
        'avatar': _avatar,
        'order_count': _orderCount,
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
        'staff_id': serializeParam(
          _staffId,
          ParamType.String,
        ),
        'alias': serializeParam(
          _alias,
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
        'domains': serializeParam(
          _domains,
          ParamType.DataStruct,
          isList: true,
        ),
        'avatar': serializeParam(
          _avatar,
          ParamType.String,
        ),
        'order_count': serializeParam(
          _orderCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static AuthorsListStruct fromSerializableMap(Map<String, dynamic> data) =>
      AuthorsListStruct(
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
        staffId: deserializeParam(
          data['staff_id'],
          ParamType.String,
          false,
        ),
        alias: deserializeParam(
          data['alias'],
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
        domains: deserializeStructParam<DomainsStruct>(
          data['domains'],
          ParamType.DataStruct,
          true,
          structBuilder: DomainsStruct.fromSerializableMap,
        ),
        avatar: deserializeParam(
          data['avatar'],
          ParamType.String,
          false,
        ),
        orderCount: deserializeParam(
          data['order_count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AuthorsListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AuthorsListStruct &&
        id == other.id &&
        status == other.status &&
        userCreated == other.userCreated &&
        dateCreated == other.dateCreated &&
        userUpdated == other.userUpdated &&
        dateUpdated == other.dateUpdated &&
        staffId == other.staffId &&
        alias == other.alias &&
        description == other.description &&
        organizationId == other.organizationId &&
        listEquality.equals(domains, other.domains) &&
        avatar == other.avatar &&
        orderCount == other.orderCount;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        userCreated,
        dateCreated,
        userUpdated,
        dateUpdated,
        staffId,
        alias,
        description,
        organizationId,
        domains,
        avatar,
        orderCount
      ]);
}

AuthorsListStruct createAuthorsListStruct({
  String? id,
  String? status,
  String? userCreated,
  String? dateCreated,
  String? userUpdated,
  String? dateUpdated,
  String? staffId,
  String? alias,
  String? description,
  String? organizationId,
  String? avatar,
  int? orderCount,
}) =>
    AuthorsListStruct(
      id: id,
      status: status,
      userCreated: userCreated,
      dateCreated: dateCreated,
      userUpdated: userUpdated,
      dateUpdated: dateUpdated,
      staffId: staffId,
      alias: alias,
      description: description,
      organizationId: organizationId,
      avatar: avatar,
      orderCount: orderCount,
    );
