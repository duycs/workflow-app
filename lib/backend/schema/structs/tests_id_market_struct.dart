// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestsIdMarketStruct extends BaseStruct {
  TestsIdMarketStruct({
    String? id,
    String? name,
    String? description,
    int? durationMinutes,
    String? dateCreated,
  })  : _id = id,
        _name = name,
        _description = description,
        _durationMinutes = durationMinutes,
        _dateCreated = dateCreated;

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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "duration_minutes" field.
  int? _durationMinutes;
  int get durationMinutes => _durationMinutes ?? 0;
  set durationMinutes(int? val) => _durationMinutes = val;

  void incrementDurationMinutes(int amount) =>
      durationMinutes = durationMinutes + amount;

  bool hasDurationMinutes() => _durationMinutes != null;

  // "date_created" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;

  bool hasDateCreated() => _dateCreated != null;

  static TestsIdMarketStruct fromMap(Map<String, dynamic> data) =>
      TestsIdMarketStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        durationMinutes: castToType<int>(data['duration_minutes']),
        dateCreated: data['date_created'] as String?,
      );

  static TestsIdMarketStruct? maybeFromMap(dynamic data) => data is Map
      ? TestsIdMarketStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'description': _description,
        'duration_minutes': _durationMinutes,
        'date_created': _dateCreated,
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
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'duration_minutes': serializeParam(
          _durationMinutes,
          ParamType.int,
        ),
        'date_created': serializeParam(
          _dateCreated,
          ParamType.String,
        ),
      }.withoutNulls;

  static TestsIdMarketStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestsIdMarketStruct(
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
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        durationMinutes: deserializeParam(
          data['duration_minutes'],
          ParamType.int,
          false,
        ),
        dateCreated: deserializeParam(
          data['date_created'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TestsIdMarketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TestsIdMarketStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        durationMinutes == other.durationMinutes &&
        dateCreated == other.dateCreated;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, description, durationMinutes, dateCreated]);
}

TestsIdMarketStruct createTestsIdMarketStruct({
  String? id,
  String? name,
  String? description,
  int? durationMinutes,
  String? dateCreated,
}) =>
    TestsIdMarketStruct(
      id: id,
      name: name,
      description: description,
      durationMinutes: durationMinutes,
      dateCreated: dateCreated,
    );
