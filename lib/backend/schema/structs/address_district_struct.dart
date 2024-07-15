// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressDistrictStruct extends BaseStruct {
  AddressDistrictStruct({
    String? id,
    String? name,
    AddressCityStruct? cityId,
  })  : _id = id,
        _name = name,
        _cityId = cityId;

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

  // "city_id" field.
  AddressCityStruct? _cityId;
  AddressCityStruct get cityId => _cityId ?? AddressCityStruct();
  set cityId(AddressCityStruct? val) => _cityId = val;

  void updateCityId(Function(AddressCityStruct) updateFn) {
    updateFn(_cityId ??= AddressCityStruct());
  }

  bool hasCityId() => _cityId != null;

  static AddressDistrictStruct fromMap(Map<String, dynamic> data) =>
      AddressDistrictStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        cityId: AddressCityStruct.maybeFromMap(data['city_id']),
      );

  static AddressDistrictStruct? maybeFromMap(dynamic data) => data is Map
      ? AddressDistrictStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'city_id': _cityId?.toMap(),
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
        'city_id': serializeParam(
          _cityId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AddressDistrictStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressDistrictStruct(
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
        cityId: deserializeStructParam(
          data['city_id'],
          ParamType.DataStruct,
          false,
          structBuilder: AddressCityStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AddressDistrictStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressDistrictStruct &&
        id == other.id &&
        name == other.name &&
        cityId == other.cityId;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, cityId]);
}

AddressDistrictStruct createAddressDistrictStruct({
  String? id,
  String? name,
  AddressCityStruct? cityId,
}) =>
    AddressDistrictStruct(
      id: id,
      name: name,
      cityId: cityId ?? AddressCityStruct(),
    );
