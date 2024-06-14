// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffsProgramsListStruct extends BaseStruct {
  StaffsProgramsListStruct({
    String? id,
    String? status,
    String? dateCreated,
    String? staffId,
    String? organizationId,
    int? lessionDone,
    int? lessionCount,
    String? dateStart,
    String? dateEnd,
    StudyProgramListStruct? programId,
  })  : _id = id,
        _status = status,
        _dateCreated = dateCreated,
        _staffId = staffId,
        _organizationId = organizationId,
        _lessionDone = lessionDone,
        _lessionCount = lessionCount,
        _dateStart = dateStart,
        _dateEnd = dateEnd,
        _programId = programId;

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

  // "date_created" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;

  bool hasDateCreated() => _dateCreated != null;

  // "staff_id" field.
  String? _staffId;
  String get staffId => _staffId ?? '';
  set staffId(String? val) => _staffId = val;

  bool hasStaffId() => _staffId != null;

  // "organization_id" field.
  String? _organizationId;
  String get organizationId => _organizationId ?? '';
  set organizationId(String? val) => _organizationId = val;

  bool hasOrganizationId() => _organizationId != null;

  // "lession_done" field.
  int? _lessionDone;
  int get lessionDone => _lessionDone ?? 0;
  set lessionDone(int? val) => _lessionDone = val;

  void incrementLessionDone(int amount) => lessionDone = lessionDone + amount;

  bool hasLessionDone() => _lessionDone != null;

  // "lession_count" field.
  int? _lessionCount;
  int get lessionCount => _lessionCount ?? 0;
  set lessionCount(int? val) => _lessionCount = val;

  void incrementLessionCount(int amount) =>
      lessionCount = lessionCount + amount;

  bool hasLessionCount() => _lessionCount != null;

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

  // "program_id" field.
  StudyProgramListStruct? _programId;
  StudyProgramListStruct get programId =>
      _programId ?? StudyProgramListStruct();
  set programId(StudyProgramListStruct? val) => _programId = val;

  void updateProgramId(Function(StudyProgramListStruct) updateFn) {
    updateFn(programId ??= StudyProgramListStruct());
  }

  bool hasProgramId() => _programId != null;

  static StaffsProgramsListStruct fromMap(Map<String, dynamic> data) =>
      StaffsProgramsListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        dateCreated: data['date_created'] as String?,
        staffId: data['staff_id'] as String?,
        organizationId: data['organization_id'] as String?,
        lessionDone: castToType<int>(data['lession_done']),
        lessionCount: castToType<int>(data['lession_count']),
        dateStart: data['date_start'] as String?,
        dateEnd: data['date_end'] as String?,
        programId: StudyProgramListStruct.maybeFromMap(data['program_id']),
      );

  static StaffsProgramsListStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffsProgramsListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'date_created': _dateCreated,
        'staff_id': _staffId,
        'organization_id': _organizationId,
        'lession_done': _lessionDone,
        'lession_count': _lessionCount,
        'date_start': _dateStart,
        'date_end': _dateEnd,
        'program_id': _programId?.toMap(),
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
        'date_created': serializeParam(
          _dateCreated,
          ParamType.String,
        ),
        'staff_id': serializeParam(
          _staffId,
          ParamType.String,
        ),
        'organization_id': serializeParam(
          _organizationId,
          ParamType.String,
        ),
        'lession_done': serializeParam(
          _lessionDone,
          ParamType.int,
        ),
        'lession_count': serializeParam(
          _lessionCount,
          ParamType.int,
        ),
        'date_start': serializeParam(
          _dateStart,
          ParamType.String,
        ),
        'date_end': serializeParam(
          _dateEnd,
          ParamType.String,
        ),
        'program_id': serializeParam(
          _programId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static StaffsProgramsListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StaffsProgramsListStruct(
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
        dateCreated: deserializeParam(
          data['date_created'],
          ParamType.String,
          false,
        ),
        staffId: deserializeParam(
          data['staff_id'],
          ParamType.String,
          false,
        ),
        organizationId: deserializeParam(
          data['organization_id'],
          ParamType.String,
          false,
        ),
        lessionDone: deserializeParam(
          data['lession_done'],
          ParamType.int,
          false,
        ),
        lessionCount: deserializeParam(
          data['lession_count'],
          ParamType.int,
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
        programId: deserializeStructParam(
          data['program_id'],
          ParamType.DataStruct,
          false,
          structBuilder: StudyProgramListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StaffsProgramsListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StaffsProgramsListStruct &&
        id == other.id &&
        status == other.status &&
        dateCreated == other.dateCreated &&
        staffId == other.staffId &&
        organizationId == other.organizationId &&
        lessionDone == other.lessionDone &&
        lessionCount == other.lessionCount &&
        dateStart == other.dateStart &&
        dateEnd == other.dateEnd &&
        programId == other.programId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        dateCreated,
        staffId,
        organizationId,
        lessionDone,
        lessionCount,
        dateStart,
        dateEnd,
        programId
      ]);
}

StaffsProgramsListStruct createStaffsProgramsListStruct({
  String? id,
  String? status,
  String? dateCreated,
  String? staffId,
  String? organizationId,
  int? lessionDone,
  int? lessionCount,
  String? dateStart,
  String? dateEnd,
  StudyProgramListStruct? programId,
}) =>
    StaffsProgramsListStruct(
      id: id,
      status: status,
      dateCreated: dateCreated,
      staffId: staffId,
      organizationId: organizationId,
      lessionDone: lessionDone,
      lessionCount: lessionCount,
      dateStart: dateStart,
      dateEnd: dateEnd,
      programId: programId ?? StudyProgramListStruct(),
    );
