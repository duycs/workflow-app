// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmployeeLessonListStruct extends BaseStruct {
  EmployeeLessonListStruct({
    String? id,
    String? status,
    double? progress,
    String? dateStart,
    String? dateEnd,
    StaffIdStruct? staffId,
    LessionIdStruct? lessionId,
    ProgramsIdStruct? programsId,
  })  : _id = id,
        _status = status,
        _progress = progress,
        _dateStart = dateStart,
        _dateEnd = dateEnd,
        _staffId = staffId,
        _lessionId = lessionId,
        _programsId = programsId;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "progress" field.
  double? _progress;
  double get progress => _progress ?? 0.0;
  set progress(double? val) => _progress = val;
  void incrementProgress(double amount) => _progress = progress + amount;
  bool hasProgress() => _progress != null;

  // "date_start" field.
  String? _dateStart;
  String get dateStart => _dateStart ?? '';
  set dateStart(String? val) => _dateStart = val;
  bool hasDateStart() => _dateStart != null;

  // "date_end" field.
  String? _dateEnd;
  String get dateEnd => _dateEnd ?? '';
  set dateEnd(String? val) => _dateEnd = val;
  bool hasDateEnd() => _dateEnd != null;

  // "staff_id" field.
  StaffIdStruct? _staffId;
  StaffIdStruct get staffId => _staffId ?? StaffIdStruct();
  set staffId(StaffIdStruct? val) => _staffId = val;
  void updateStaffId(Function(StaffIdStruct) updateFn) =>
      updateFn(_staffId ??= StaffIdStruct());
  bool hasStaffId() => _staffId != null;

  // "lession_id" field.
  LessionIdStruct? _lessionId;
  LessionIdStruct get lessionId => _lessionId ?? LessionIdStruct();
  set lessionId(LessionIdStruct? val) => _lessionId = val;
  void updateLessionId(Function(LessionIdStruct) updateFn) =>
      updateFn(_lessionId ??= LessionIdStruct());
  bool hasLessionId() => _lessionId != null;

  // "programs_id" field.
  ProgramsIdStruct? _programsId;
  ProgramsIdStruct get programsId => _programsId ?? ProgramsIdStruct();
  set programsId(ProgramsIdStruct? val) => _programsId = val;
  void updateProgramsId(Function(ProgramsIdStruct) updateFn) =>
      updateFn(_programsId ??= ProgramsIdStruct());
  bool hasProgramsId() => _programsId != null;

  static EmployeeLessonListStruct fromMap(Map<String, dynamic> data) =>
      EmployeeLessonListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        progress: castToType<double>(data['progress']),
        dateStart: data['date_start'] as String?,
        dateEnd: data['date_end'] as String?,
        staffId: StaffIdStruct.maybeFromMap(data['staff_id']),
        lessionId: LessionIdStruct.maybeFromMap(data['lession_id']),
        programsId: ProgramsIdStruct.maybeFromMap(data['programs_id']),
      );

  static EmployeeLessonListStruct? maybeFromMap(dynamic data) => data is Map
      ? EmployeeLessonListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'progress': _progress,
        'date_start': _dateStart,
        'date_end': _dateEnd,
        'staff_id': _staffId?.toMap(),
        'lession_id': _lessionId?.toMap(),
        'programs_id': _programsId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'progress': serializeParam(
          _progress,
          ParamType.double,
        ),
        'date_start': serializeParam(
          _dateStart,
          ParamType.String,
        ),
        'date_end': serializeParam(
          _dateEnd,
          ParamType.String,
        ),
        'staff_id': serializeParam(
          _staffId,
          ParamType.DataStruct,
        ),
        'lession_id': serializeParam(
          _lessionId,
          ParamType.DataStruct,
        ),
        'programs_id': serializeParam(
          _programsId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static EmployeeLessonListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EmployeeLessonListStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        progress: deserializeParam(
          data['progress'],
          ParamType.double,
          false,
        ),
        dateStart: deserializeParam(
          data['date_start'],
          ParamType.String,
          false,
        ),
        dateEnd: deserializeParam(
          data['date_end'],
          ParamType.String,
          false,
        ),
        staffId: deserializeStructParam(
          data['staff_id'],
          ParamType.DataStruct,
          false,
          structBuilder: StaffIdStruct.fromSerializableMap,
        ),
        lessionId: deserializeStructParam(
          data['lession_id'],
          ParamType.DataStruct,
          false,
          structBuilder: LessionIdStruct.fromSerializableMap,
        ),
        programsId: deserializeStructParam(
          data['programs_id'],
          ParamType.DataStruct,
          false,
          structBuilder: ProgramsIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'EmployeeLessonListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EmployeeLessonListStruct &&
        id == other.id &&
        status == other.status &&
        progress == other.progress &&
        dateStart == other.dateStart &&
        dateEnd == other.dateEnd &&
        staffId == other.staffId &&
        lessionId == other.lessionId &&
        programsId == other.programsId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        progress,
        dateStart,
        dateEnd,
        staffId,
        lessionId,
        programsId
      ]);
}

EmployeeLessonListStruct createEmployeeLessonListStruct({
  String? id,
  String? status,
  double? progress,
  String? dateStart,
  String? dateEnd,
  StaffIdStruct? staffId,
  LessionIdStruct? lessionId,
  ProgramsIdStruct? programsId,
}) =>
    EmployeeLessonListStruct(
      id: id,
      status: status,
      progress: progress,
      dateStart: dateStart,
      dateEnd: dateEnd,
      staffId: staffId ?? StaffIdStruct(),
      lessionId: lessionId ?? LessionIdStruct(),
      programsId: programsId ?? ProgramsIdStruct(),
    );
