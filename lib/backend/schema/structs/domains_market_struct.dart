// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DomainsMarketStruct extends BaseStruct {
  DomainsMarketStruct({
    DomainsIdMarketStruct? domainsId,
  }) : _domainsId = domainsId;

  // "domains_id" field.
  DomainsIdMarketStruct? _domainsId;
  DomainsIdMarketStruct get domainsId => _domainsId ?? DomainsIdMarketStruct();
  set domainsId(DomainsIdMarketStruct? val) => _domainsId = val;

  void updateDomainsId(Function(DomainsIdMarketStruct) updateFn) {
    updateFn(domainsId ??= DomainsIdMarketStruct());
  }

  bool hasDomainsId() => _domainsId != null;

  static DomainsMarketStruct fromMap(Map<String, dynamic> data) =>
      DomainsMarketStruct(
        domainsId: DomainsIdMarketStruct.maybeFromMap(data['domains_id']),
      );

  static DomainsMarketStruct? maybeFromMap(dynamic data) => data is Map
      ? DomainsMarketStruct.fromMap(data.cast<String, dynamic>())
      : null;

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

  static DomainsMarketStruct fromSerializableMap(Map<String, dynamic> data) =>
      DomainsMarketStruct(
        domainsId: deserializeStructParam(
          data['domains_id'],
          ParamType.DataStruct,
          false,
          structBuilder: DomainsIdMarketStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DomainsMarketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DomainsMarketStruct && domainsId == other.domainsId;
  }

  @override
  int get hashCode => const ListEquality().hash([domainsId]);
}

DomainsMarketStruct createDomainsMarketStruct({
  DomainsIdMarketStruct? domainsId,
}) =>
    DomainsMarketStruct(
      domainsId: domainsId ?? DomainsIdMarketStruct(),
    );
