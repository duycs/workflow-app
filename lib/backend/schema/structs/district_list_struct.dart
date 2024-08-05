// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DistrictListStruct extends BaseStruct {
  DistrictListStruct({
    String? id,
    String? name,
    List<WardsStruct>? wards,
    String? status,
    String? cityId,
  })  : _id = id,
        _name = name,
        _wards = wards,
        _status = status,
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

  // "wards" field.
  List<WardsStruct>? _wards;
  List<WardsStruct> get wards => _wards ?? const [];
  set wards(List<WardsStruct>? val) => _wards = val;

  void updateWards(Function(List<WardsStruct>) updateFn) {
    updateFn(_wards ??= []);
  }

  bool hasWards() => _wards != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "city_id" field.
  String? _cityId;
  String get cityId => _cityId ?? '';
  set cityId(String? val) => _cityId = val;

  bool hasCityId() => _cityId != null;

  static DistrictListStruct fromMap(Map<String, dynamic> data) =>
      DistrictListStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        wards: getStructList(
          data['wards'],
          WardsStruct.fromMap,
        ),
        status: data['status'] as String?,
        cityId: data['city_id'] as String?,
      );

  static DistrictListStruct? maybeFromMap(dynamic data) => data is Map
      ? DistrictListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'wards': _wards?.map((e) => e.toMap()).toList(),
        'status': _status,
        'city_id': _cityId,
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
        'wards': serializeParam(
          _wards,
          ParamType.DataStruct,
          isList: true,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'city_id': serializeParam(
          _cityId,
          ParamType.String,
        ),
      }.withoutNulls;

  static DistrictListStruct fromSerializableMap(Map<String, dynamic> data) =>
      DistrictListStruct(
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
        wards: deserializeStructParam<WardsStruct>(
          data['wards'],
          ParamType.DataStruct,
          true,
          structBuilder: WardsStruct.fromSerializableMap,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        cityId: deserializeParam(
          data['city_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DistrictListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DistrictListStruct &&
        id == other.id &&
        name == other.name &&
        listEquality.equals(wards, other.wards) &&
        status == other.status &&
        cityId == other.cityId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, wards, status, cityId]);
}

DistrictListStruct createDistrictListStruct({
  String? id,
  String? name,
  String? status,
  String? cityId,
}) =>
    DistrictListStruct(
      id: id,
      name: name,
      status: status,
      cityId: cityId,
    );
