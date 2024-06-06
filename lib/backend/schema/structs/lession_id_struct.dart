// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessionIdStruct extends BaseStruct {
  LessionIdStruct({
    String? id,
    String? name,
    String? description,
    String? content,
    String? imageCover,
    String? video,
    String? dateUpdated,
    String? status,
    String? dateCreated,
    int? durationHours,
    String? testId,
    FileStruct? file,
    List<ProgramsIdddStruct>? programs,
    int? estimateInDay,
  })  : _id = id,
        _name = name,
        _description = description,
        _content = content,
        _imageCover = imageCover,
        _video = video,
        _dateUpdated = dateUpdated,
        _status = status,
        _dateCreated = dateCreated,
        _durationHours = durationHours,
        _testId = testId,
        _file = file,
        _programs = programs,
        _estimateInDay = estimateInDay;

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

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;
  bool hasContent() => _content != null;

  // "image_cover" field.
  String? _imageCover;
  String get imageCover => _imageCover ?? '';
  set imageCover(String? val) => _imageCover = val;
  bool hasImageCover() => _imageCover != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  set video(String? val) => _video = val;
  bool hasVideo() => _video != null;

  // "date_updated" field.
  String? _dateUpdated;
  String get dateUpdated => _dateUpdated ?? '';
  set dateUpdated(String? val) => _dateUpdated = val;
  bool hasDateUpdated() => _dateUpdated != null;

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

  // "duration_hours" field.
  int? _durationHours;
  int get durationHours => _durationHours ?? 0;
  set durationHours(int? val) => _durationHours = val;
  void incrementDurationHours(int amount) =>
      _durationHours = durationHours + amount;
  bool hasDurationHours() => _durationHours != null;

  // "test_id" field.
  String? _testId;
  String get testId => _testId ?? '';
  set testId(String? val) => _testId = val;
  bool hasTestId() => _testId != null;

  // "file" field.
  FileStruct? _file;
  FileStruct get file => _file ?? FileStruct();
  set file(FileStruct? val) => _file = val;
  void updateFile(Function(FileStruct) updateFn) =>
      updateFn(_file ??= FileStruct());
  bool hasFile() => _file != null;

  // "programs" field.
  List<ProgramsIdddStruct>? _programs;
  List<ProgramsIdddStruct> get programs => _programs ?? const [];
  set programs(List<ProgramsIdddStruct>? val) => _programs = val;
  void updatePrograms(Function(List<ProgramsIdddStruct>) updateFn) =>
      updateFn(_programs ??= []);
  bool hasPrograms() => _programs != null;

  // "estimate_in_day" field.
  int? _estimateInDay;
  int get estimateInDay => _estimateInDay ?? 0;
  set estimateInDay(int? val) => _estimateInDay = val;
  void incrementEstimateInDay(int amount) =>
      _estimateInDay = estimateInDay + amount;
  bool hasEstimateInDay() => _estimateInDay != null;

  static LessionIdStruct fromMap(Map<String, dynamic> data) => LessionIdStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        content: data['content'] as String?,
        imageCover: data['image_cover'] as String?,
        video: data['video'] as String?,
        dateUpdated: data['date_updated'] as String?,
        status: data['status'] as String?,
        dateCreated: data['date_created'] as String?,
        durationHours: castToType<int>(data['duration_hours']),
        testId: data['test_id'] as String?,
        file: FileStruct.maybeFromMap(data['file']),
        programs: getStructList(
          data['programs'],
          ProgramsIdddStruct.fromMap,
        ),
        estimateInDay: castToType<int>(data['estimate_in_day']),
      );

  static LessionIdStruct? maybeFromMap(dynamic data) => data is Map
      ? LessionIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'description': _description,
        'content': _content,
        'image_cover': _imageCover,
        'video': _video,
        'date_updated': _dateUpdated,
        'status': _status,
        'date_created': _dateCreated,
        'duration_hours': _durationHours,
        'test_id': _testId,
        'file': _file?.toMap(),
        'programs': _programs?.map((e) => e.toMap()).toList(),
        'estimate_in_day': _estimateInDay,
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
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'image_cover': serializeParam(
          _imageCover,
          ParamType.String,
        ),
        'video': serializeParam(
          _video,
          ParamType.String,
        ),
        'date_updated': serializeParam(
          _dateUpdated,
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
        'duration_hours': serializeParam(
          _durationHours,
          ParamType.int,
        ),
        'test_id': serializeParam(
          _testId,
          ParamType.String,
        ),
        'file': serializeParam(
          _file,
          ParamType.DataStruct,
        ),
        'programs': serializeParam(
          _programs,
          ParamType.DataStruct,
          true,
        ),
        'estimate_in_day': serializeParam(
          _estimateInDay,
          ParamType.int,
        ),
      }.withoutNulls;

  static LessionIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      LessionIdStruct(
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
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        imageCover: deserializeParam(
          data['image_cover'],
          ParamType.String,
          false,
        ),
        video: deserializeParam(
          data['video'],
          ParamType.String,
          false,
        ),
        dateUpdated: deserializeParam(
          data['date_updated'],
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
        durationHours: deserializeParam(
          data['duration_hours'],
          ParamType.int,
          false,
        ),
        testId: deserializeParam(
          data['test_id'],
          ParamType.String,
          false,
        ),
        file: deserializeStructParam(
          data['file'],
          ParamType.DataStruct,
          false,
          structBuilder: FileStruct.fromSerializableMap,
        ),
        programs: deserializeStructParam<ProgramsIdddStruct>(
          data['programs'],
          ParamType.DataStruct,
          true,
          structBuilder: ProgramsIdddStruct.fromSerializableMap,
        ),
        estimateInDay: deserializeParam(
          data['estimate_in_day'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'LessionIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LessionIdStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        content == other.content &&
        imageCover == other.imageCover &&
        video == other.video &&
        dateUpdated == other.dateUpdated &&
        status == other.status &&
        dateCreated == other.dateCreated &&
        durationHours == other.durationHours &&
        testId == other.testId &&
        file == other.file &&
        listEquality.equals(programs, other.programs) &&
        estimateInDay == other.estimateInDay;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        description,
        content,
        imageCover,
        video,
        dateUpdated,
        status,
        dateCreated,
        durationHours,
        testId,
        file,
        programs,
        estimateInDay
      ]);
}

LessionIdStruct createLessionIdStruct({
  String? id,
  String? name,
  String? description,
  String? content,
  String? imageCover,
  String? video,
  String? dateUpdated,
  String? status,
  String? dateCreated,
  int? durationHours,
  String? testId,
  FileStruct? file,
  int? estimateInDay,
}) =>
    LessionIdStruct(
      id: id,
      name: name,
      description: description,
      content: content,
      imageCover: imageCover,
      video: video,
      dateUpdated: dateUpdated,
      status: status,
      dateCreated: dateCreated,
      durationHours: durationHours,
      testId: testId,
      file: file ?? FileStruct(),
      estimateInDay: estimateInDay,
    );
