// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressWardStruct extends BaseStruct {
  AddressWardStruct({
    String? id,
    String? name,
    AddressDistrictStruct? districtId,
  })  : _id = id,
        _name = name,
        _districtId = districtId;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "district_id" field.
  AddressDistrictStruct? _districtId;
  AddressDistrictStruct get districtId =>
      _districtId ?? AddressDistrictStruct();
  set districtId(AddressDistrictStruct? val) => _districtId = val;

  void updateDistrictId(Function(AddressDistrictStruct) updateFn) {
    updateFn(_districtId ??= AddressDistrictStruct());
  }

  bool hasDistrictId() => _districtId != null;

  static AddressWardStruct fromMap(Map<String, dynamic> data) =>
      AddressWardStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        districtId: AddressDistrictStruct.maybeFromMap(data['district_id']),
      );

  static AddressWardStruct? maybeFromMap(dynamic data) => data is Map
      ? AddressWardStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'district_id': _districtId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'district_id': serializeParam(
          _districtId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AddressWardStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressWardStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        districtId: deserializeStructParam(
          data['district_id'],
          ParamType.DataStruct,
          false,
          structBuilder: AddressDistrictStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AddressWardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressWardStruct &&
        id == other.id &&
        name == other.name &&
        districtId == other.districtId;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, districtId]);
}

AddressWardStruct createAddressWardStruct({
  String? id,
  String? name,
  AddressDistrictStruct? districtId,
}) =>
    AddressWardStruct(
      id: id,
      name: name,
      districtId: districtId ?? AddressDistrictStruct(),
    );
