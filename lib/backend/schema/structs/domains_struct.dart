// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DomainsStruct extends BaseStruct {
  DomainsStruct({
    DomainsIdStruct? domainsId,
  }) : _domainsId = domainsId;

  // "domains_id" field.
  DomainsIdStruct? _domainsId;
  DomainsIdStruct get domainsId => _domainsId ?? DomainsIdStruct();
  set domainsId(DomainsIdStruct? val) => _domainsId = val;
  void updateDomainsId(Function(DomainsIdStruct) updateFn) =>
      updateFn(_domainsId ??= DomainsIdStruct());
  bool hasDomainsId() => _domainsId != null;

  static DomainsStruct fromMap(Map<String, dynamic> data) => DomainsStruct(
        domainsId: DomainsIdStruct.maybeFromMap(data['domains_id']),
      );

  static DomainsStruct? maybeFromMap(dynamic data) =>
      data is Map ? DomainsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'domains_id': _domainsId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'domains_id': serializeParam(
          _domainsId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static DomainsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DomainsStruct(
        domainsId: deserializeStructParam(
          data['domains_id'],
          ParamType.DataStruct,
          false,
          structBuilder: DomainsIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DomainsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DomainsStruct && domainsId == other.domainsId;
  }

  @override
  int get hashCode => const ListEquality().hash([domainsId]);
}

DomainsStruct createDomainsStruct({
  DomainsIdStruct? domainsId,
}) =>
    DomainsStruct(
      domainsId: domainsId ?? DomainsIdStruct(),
    );
