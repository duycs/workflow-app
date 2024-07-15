// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationStruct extends BaseStruct {
  LocationStruct({
    List<int>? coordinates,
    String? type,
  })  : _coordinates = coordinates,
        _type = type;

  // "coordinates" field.
  List<int>? _coordinates;
  List<int> get coordinates => _coordinates ?? const [];
  set coordinates(List<int>? val) => _coordinates = val;

  void updateCoordinates(Function(List<int>) updateFn) {
    updateFn(_coordinates ??= []);
  }

  bool hasCoordinates() => _coordinates != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  static LocationStruct fromMap(Map<String, dynamic> data) => LocationStruct(
        coordinates: getDataList(data['coordinates']),
        type: data['type'] as String?,
      );

  static LocationStruct? maybeFromMap(dynamic data) =>
      data is Map ? LocationStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'coordinates': _coordinates,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'coordinates': serializeParam(
          _coordinates,
          ParamType.int,
          isList: true,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static LocationStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationStruct(
        coordinates: deserializeParam<int>(
          data['coordinates'],
          ParamType.int,
          true,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LocationStruct &&
        listEquality.equals(coordinates, other.coordinates) &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([coordinates, type]);
}

LocationStruct createLocationStruct({
  String? type,
}) =>
    LocationStruct(
      type: type,
    );
