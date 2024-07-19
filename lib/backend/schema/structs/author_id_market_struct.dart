// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthorIdMarketStruct extends BaseStruct {
  AuthorIdMarketStruct({
    String? id,
    String? status,
    String? alias,
    String? description,
    List<DomainsMarketStruct>? domains,
    String? avatar,
    String? organizationId,
  })  : _id = id,
        _status = status,
        _alias = alias,
        _description = description,
        _domains = domains,
        _avatar = avatar,
        _organizationId = organizationId;

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

  // "domains" field.
  List<DomainsMarketStruct>? _domains;
  List<DomainsMarketStruct> get domains => _domains ?? const [];
  set domains(List<DomainsMarketStruct>? val) => _domains = val;

  void updateDomains(Function(List<DomainsMarketStruct>) updateFn) {
    updateFn(_domains ??= []);
  }

  bool hasDomains() => _domains != null;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  set avatar(String? val) => _avatar = val;

  bool hasAvatar() => _avatar != null;

  // "organization_id" field.
  String? _organizationId;
  String get organizationId => _organizationId ?? '';
  set organizationId(String? val) => _organizationId = val;

  bool hasOrganizationId() => _organizationId != null;

  static AuthorIdMarketStruct fromMap(Map<String, dynamic> data) =>
      AuthorIdMarketStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        alias: data['alias'] as String?,
        description: data['description'] as String?,
        domains: getStructList(
          data['domains'],
          DomainsMarketStruct.fromMap,
        ),
        avatar: data['avatar'] as String?,
        organizationId: data['organization_id'] as String?,
      );

  static AuthorIdMarketStruct? maybeFromMap(dynamic data) => data is Map
      ? AuthorIdMarketStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'alias': _alias,
        'description': _description,
        'domains': _domains?.map((e) => e.toMap()).toList(),
        'avatar': _avatar,
        'organization_id': _organizationId,
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
        'alias': serializeParam(
          _alias,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
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
        'organization_id': serializeParam(
          _organizationId,
          ParamType.String,
        ),
      }.withoutNulls;

  static AuthorIdMarketStruct fromSerializableMap(Map<String, dynamic> data) =>
      AuthorIdMarketStruct(
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
        domains: deserializeStructParam<DomainsMarketStruct>(
          data['domains'],
          ParamType.DataStruct,
          true,
          structBuilder: DomainsMarketStruct.fromSerializableMap,
        ),
        avatar: deserializeParam(
          data['avatar'],
          ParamType.String,
          false,
        ),
        organizationId: deserializeParam(
          data['organization_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AuthorIdMarketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AuthorIdMarketStruct &&
        id == other.id &&
        status == other.status &&
        alias == other.alias &&
        description == other.description &&
        listEquality.equals(domains, other.domains) &&
        avatar == other.avatar &&
        organizationId == other.organizationId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, status, alias, description, domains, avatar, organizationId]);
}

AuthorIdMarketStruct createAuthorIdMarketStruct({
  String? id,
  String? status,
  String? alias,
  String? description,
  String? avatar,
  String? organizationId,
}) =>
    AuthorIdMarketStruct(
      id: id,
      status: status,
      alias: alias,
      description: description,
      avatar: avatar,
      organizationId: organizationId,
    );
