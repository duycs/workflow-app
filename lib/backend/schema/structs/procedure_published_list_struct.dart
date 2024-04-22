// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProcedurePublishedListStruct extends BaseStruct {
  ProcedurePublishedListStruct({
    String? id,
    String? name,
    List<ProcedurePublishedStepStruct>? steps,
  })  : _id = id,
        _name = name,
        _steps = steps;

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

  // "steps" field.
  List<ProcedurePublishedStepStruct>? _steps;
  List<ProcedurePublishedStepStruct> get steps => _steps ?? const [];
  set steps(List<ProcedurePublishedStepStruct>? val) => _steps = val;
  void updateSteps(Function(List<ProcedurePublishedStepStruct>) updateFn) =>
      updateFn(_steps ??= []);
  bool hasSteps() => _steps != null;

  static ProcedurePublishedListStruct fromMap(Map<String, dynamic> data) =>
      ProcedurePublishedListStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        steps: getStructList(
          data['steps'],
          ProcedurePublishedStepStruct.fromMap,
        ),
      );

  static ProcedurePublishedListStruct? maybeFromMap(dynamic data) => data is Map
      ? ProcedurePublishedListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'steps': _steps?.map((e) => e.toMap()).toList(),
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
        'steps': serializeParam(
          _steps,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static ProcedurePublishedListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProcedurePublishedListStruct(
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
        steps: deserializeStructParam<ProcedurePublishedStepStruct>(
          data['steps'],
          ParamType.DataStruct,
          true,
          structBuilder: ProcedurePublishedStepStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProcedurePublishedListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProcedurePublishedListStruct &&
        id == other.id &&
        name == other.name &&
        listEquality.equals(steps, other.steps);
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, steps]);
}

ProcedurePublishedListStruct createProcedurePublishedListStruct({
  String? id,
  String? name,
}) =>
    ProcedurePublishedListStruct(
      id: id,
      name: name,
    );
