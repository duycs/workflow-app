// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationStruct extends BaseStruct {
  LocationStruct({
    String? type,
    List<double>? coordinates,
  })  : _type = type,
        _coordinates = coordinates;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "coordinates" field.
  List<double>? _coordinates;
  List<double> get coordinates => _coordinates ?? const [];
  set coordinates(List<double>? val) => _coordinates = val;

  void updateCoordinates(Function(List<double>) updateFn) {
    updateFn(_coordinates ??= []);
  }

  bool hasCoordinates() => _coordinates != null;

  static LocationStruct fromMap(Map<String, dynamic> data) => LocationStruct(
        type: data['type'] as String?,
        coordinates: getDataList(data['coordinates']),
      );

  static LocationStruct? maybeFromMap(dynamic data) =>
      data is Map ? LocationStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'coordinates': _coordinates,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'coordinates': serializeParam(
          _coordinates,
          ParamType.double,
          isList: true,
        ),
      }.withoutNulls;

  static LocationStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        coordinates: deserializeParam<double>(
          data['coordinates'],
          ParamType.double,
          true,
        ),
      );

  @override
  String toString() => 'LocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LocationStruct &&
        type == other.type &&
        listEquality.equals(coordinates, other.coordinates);
  }

  @override
  int get hashCode => const ListEquality().hash([type, coordinates]);
}

LocationStruct createLocationStruct({
  String? type,
}) =>
    LocationStruct(
      type: type,
    );
