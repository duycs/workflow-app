// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListCityStruct extends BaseStruct {
  ListCityStruct({
    String? id,
    String? name,
    String? status,
    List<DistrictListStruct>? districts,
  })  : _id = id,
        _name = name,
        _status = status,
        _districts = districts;

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

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "districts" field.
  List<DistrictListStruct>? _districts;
  List<DistrictListStruct> get districts => _districts ?? const [];
  set districts(List<DistrictListStruct>? val) => _districts = val;

  void updateDistricts(Function(List<DistrictListStruct>) updateFn) {
    updateFn(_districts ??= []);
  }

  bool hasDistricts() => _districts != null;

  static ListCityStruct fromMap(Map<String, dynamic> data) => ListCityStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        status: data['status'] as String?,
        districts: getStructList(
          data['districts'],
          DistrictListStruct.fromMap,
        ),
      );

  static ListCityStruct? maybeFromMap(dynamic data) =>
      data is Map ? ListCityStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'status': _status,
        'districts': _districts?.map((e) => e.toMap()).toList(),
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
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'districts': serializeParam(
          _districts,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ListCityStruct fromSerializableMap(Map<String, dynamic> data) =>
      ListCityStruct(
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
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        districts: deserializeStructParam<DistrictListStruct>(
          data['districts'],
          ParamType.DataStruct,
          true,
          structBuilder: DistrictListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ListCityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ListCityStruct &&
        id == other.id &&
        name == other.name &&
        status == other.status &&
        listEquality.equals(districts, other.districts);
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, status, districts]);
}

ListCityStruct createListCityStruct({
  String? id,
  String? name,
  String? status,
}) =>
    ListCityStruct(
      id: id,
      name: name,
      status: status,
    );
