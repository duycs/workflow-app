// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramsIddStruct extends BaseStruct {
  ProgramsIddStruct({
    String? name,
    int? estimateInDay,
    String? id,
  })  : _name = name,
        _estimateInDay = estimateInDay,
        _id = id;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "estimate_in_day" field.
  int? _estimateInDay;
  int get estimateInDay => _estimateInDay ?? 0;
  set estimateInDay(int? val) => _estimateInDay = val;

  void incrementEstimateInDay(int amount) =>
      estimateInDay = estimateInDay + amount;

  bool hasEstimateInDay() => _estimateInDay != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static ProgramsIddStruct fromMap(Map<String, dynamic> data) =>
      ProgramsIddStruct(
        name: data['name'] as String?,
        estimateInDay: castToType<int>(data['estimate_in_day']),
        id: data['id'] as String?,
      );

  static ProgramsIddStruct? maybeFromMap(dynamic data) => data is Map
      ? ProgramsIddStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'estimate_in_day': _estimateInDay,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'estimate_in_day': serializeParam(
          _estimateInDay,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProgramsIddStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProgramsIddStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        estimateInDay: deserializeParam(
          data['estimate_in_day'],
          ParamType.int,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProgramsIddStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProgramsIddStruct &&
        name == other.name &&
        estimateInDay == other.estimateInDay &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([name, estimateInDay, id]);
}

ProgramsIddStruct createProgramsIddStruct({
  String? name,
  int? estimateInDay,
  String? id,
}) =>
    ProgramsIddStruct(
      name: name,
      estimateInDay: estimateInDay,
      id: id,
    );
