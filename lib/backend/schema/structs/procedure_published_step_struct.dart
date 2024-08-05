// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProcedurePublishedStepStruct extends BaseStruct {
  ProcedurePublishedStepStruct({
    String? id,
    int? number,
    List<ProcedurePublishedStepTaskStruct>? tasks,
    List<StaffStepOneStruct>? staffs,
  })  : _id = id,
        _number = number,
        _tasks = tasks,
        _staffs = staffs;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;

  void incrementNumber(int amount) => number = number + amount;

  bool hasNumber() => _number != null;

  // "tasks" field.
  List<ProcedurePublishedStepTaskStruct>? _tasks;
  List<ProcedurePublishedStepTaskStruct> get tasks => _tasks ?? const [];
  set tasks(List<ProcedurePublishedStepTaskStruct>? val) => _tasks = val;

  void updateTasks(Function(List<ProcedurePublishedStepTaskStruct>) updateFn) {
    updateFn(_tasks ??= []);
  }

  bool hasTasks() => _tasks != null;

  // "staffs" field.
  List<StaffStepOneStruct>? _staffs;
  List<StaffStepOneStruct> get staffs => _staffs ?? const [];
  set staffs(List<StaffStepOneStruct>? val) => _staffs = val;

  void updateStaffs(Function(List<StaffStepOneStruct>) updateFn) {
    updateFn(_staffs ??= []);
  }

  bool hasStaffs() => _staffs != null;

  static ProcedurePublishedStepStruct fromMap(Map<String, dynamic> data) =>
      ProcedurePublishedStepStruct(
        id: data['id'] as String?,
        number: castToType<int>(data['number']),
        tasks: getStructList(
          data['tasks'],
          ProcedurePublishedStepTaskStruct.fromMap,
        ),
        staffs: getStructList(
          data['staffs'],
          StaffStepOneStruct.fromMap,
        ),
      );

  static ProcedurePublishedStepStruct? maybeFromMap(dynamic data) => data is Map
      ? ProcedurePublishedStepStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'number': _number,
        'tasks': _tasks?.map((e) => e.toMap()).toList(),
        'staffs': _staffs?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
        'tasks': serializeParam(
          _tasks,
          ParamType.DataStruct,
          isList: true,
        ),
        'staffs': serializeParam(
          _staffs,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ProcedurePublishedStepStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProcedurePublishedStepStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
        tasks: deserializeStructParam<ProcedurePublishedStepTaskStruct>(
          data['tasks'],
          ParamType.DataStruct,
          true,
          structBuilder: ProcedurePublishedStepTaskStruct.fromSerializableMap,
        ),
        staffs: deserializeStructParam<StaffStepOneStruct>(
          data['staffs'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffStepOneStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProcedurePublishedStepStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProcedurePublishedStepStruct &&
        id == other.id &&
        number == other.number &&
        listEquality.equals(tasks, other.tasks) &&
        listEquality.equals(staffs, other.staffs);
  }

  @override
  int get hashCode => const ListEquality().hash([id, number, tasks, staffs]);
}

ProcedurePublishedStepStruct createProcedurePublishedStepStruct({
  String? id,
  int? number,
}) =>
    ProcedurePublishedStepStruct(
      id: id,
      number: number,
    );
