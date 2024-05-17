// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreateDomainAuthorsStruct extends BaseStruct {
  CreateDomainAuthorsStruct({
    String? domainsId,
  }) : _domainsId = domainsId;

  // "domains_id" field.
  String? _domainsId;
  String get domainsId => _domainsId ?? '';
  set domainsId(String? val) => _domainsId = val;
  bool hasDomainsId() => _domainsId != null;

  static CreateDomainAuthorsStruct fromMap(Map<String, dynamic> data) =>
      CreateDomainAuthorsStruct(
        domainsId: data['domains_id'] as String?,
      );

  static CreateDomainAuthorsStruct? maybeFromMap(dynamic data) => data is Map
      ? CreateDomainAuthorsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'domains_id': _domainsId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'domains_id': serializeParam(
          _domainsId,
          ParamType.String,
        ),
      }.withoutNulls;

  static CreateDomainAuthorsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CreateDomainAuthorsStruct(
        domainsId: deserializeParam(
          data['domains_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CreateDomainAuthorsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CreateDomainAuthorsStruct && domainsId == other.domainsId;
  }

  @override
  int get hashCode => const ListEquality().hash([domainsId]);
}

CreateDomainAuthorsStruct createCreateDomainAuthorsStruct({
  String? domainsId,
}) =>
    CreateDomainAuthorsStruct(
      domainsId: domainsId,
    );
