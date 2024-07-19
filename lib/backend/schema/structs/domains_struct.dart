// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DomainsStruct extends BaseStruct {
  DomainsStruct({
    DomainsIdStruct? domainsId,
    int? id,
  })  : _domainsId = domainsId,
        _id = id;

  // "domains_id" field.
  DomainsIdStruct? _domainsId;
  DomainsIdStruct get domainsId => _domainsId ?? DomainsIdStruct();
  set domainsId(DomainsIdStruct? val) => _domainsId = val;

  void updateDomainsId(Function(DomainsIdStruct) updateFn) {
    updateFn(_domainsId ??= DomainsIdStruct());
  }

  bool hasDomainsId() => _domainsId != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static DomainsStruct fromMap(Map<String, dynamic> data) => DomainsStruct(
        domainsId: DomainsIdStruct.maybeFromMap(data['domains_id']),
        id: castToType<int>(data['id']),
      );

  static DomainsStruct? maybeFromMap(dynamic data) =>
      data is Map ? DomainsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'domains_id': _domainsId?.toMap(),
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'domains_id': serializeParam(
          _domainsId,
          ParamType.DataStruct,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
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
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DomainsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DomainsStruct &&
        domainsId == other.domainsId &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([domainsId, id]);
}

DomainsStruct createDomainsStruct({
  DomainsIdStruct? domainsId,
  int? id,
}) =>
    DomainsStruct(
      domainsId: domainsId ?? DomainsIdStruct(),
      id: id,
    );
