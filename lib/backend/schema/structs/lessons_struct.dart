// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonsStruct extends BaseStruct {
  LessonsStruct({
    String? id,
    String? status,
    String? name,
    String? description,
    String? content,
    String? imageCover,
    String? video,
    String? dateCreated,
    String? dateUpdated,
    int? durationHours,
    FileStruct? file,
    List<ReactsStruct>? reacts,
    String? organizationId,
    List<ProgramsIdddStruct>? programs,
    int? estimateInDay,
    bool? checkLession,
  })  : _id = id,
        _status = status,
        _name = name,
        _description = description,
        _content = content,
        _imageCover = imageCover,
        _video = video,
        _dateCreated = dateCreated,
        _dateUpdated = dateUpdated,
        _durationHours = durationHours,
        _file = file,
        _reacts = reacts,
        _organizationId = organizationId,
        _programs = programs,
        _estimateInDay = estimateInDay,
        _checkLession = checkLession;

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

  // "date_created" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;
  bool hasDateCreated() => _dateCreated != null;

  // "date_updated" field.
  String? _dateUpdated;
  String get dateUpdated => _dateUpdated ?? '';
  set dateUpdated(String? val) => _dateUpdated = val;
  bool hasDateUpdated() => _dateUpdated != null;

  // "duration_hours" field.
  int? _durationHours;
  int get durationHours => _durationHours ?? 0;
  set durationHours(int? val) => _durationHours = val;
  void incrementDurationHours(int amount) =>
      _durationHours = durationHours + amount;
  bool hasDurationHours() => _durationHours != null;

  // "file" field.
  FileStruct? _file;
  FileStruct get file => _file ?? FileStruct();
  set file(FileStruct? val) => _file = val;
  void updateFile(Function(FileStruct) updateFn) =>
      updateFn(_file ??= FileStruct());
  bool hasFile() => _file != null;

  // "reacts" field.
  List<ReactsStruct>? _reacts;
  List<ReactsStruct> get reacts => _reacts ?? const [];
  set reacts(List<ReactsStruct>? val) => _reacts = val;
  void updateReacts(Function(List<ReactsStruct>) updateFn) =>
      updateFn(_reacts ??= []);
  bool hasReacts() => _reacts != null;

  // "organization_id" field.
  String? _organizationId;
  String get organizationId => _organizationId ?? '';
  set organizationId(String? val) => _organizationId = val;
  bool hasOrganizationId() => _organizationId != null;

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

  // "checkLession" field.
  bool? _checkLession;
  bool get checkLession => _checkLession ?? false;
  set checkLession(bool? val) => _checkLession = val;
  bool hasCheckLession() => _checkLession != null;

  static LessonsStruct fromMap(Map<String, dynamic> data) => LessonsStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        content: data['content'] as String?,
        imageCover: data['image_cover'] as String?,
        video: data['video'] as String?,
        dateCreated: data['date_created'] as String?,
        dateUpdated: data['date_updated'] as String?,
        durationHours: castToType<int>(data['duration_hours']),
        file: FileStruct.maybeFromMap(data['file']),
        reacts: getStructList(
          data['reacts'],
          ReactsStruct.fromMap,
        ),
        organizationId: data['organization_id'] as String?,
        programs: getStructList(
          data['programs'],
          ProgramsIdddStruct.fromMap,
        ),
        estimateInDay: castToType<int>(data['estimate_in_day']),
        checkLession: data['checkLession'] as bool?,
      );

  static LessonsStruct? maybeFromMap(dynamic data) =>
      data is Map ? LessonsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'name': _name,
        'description': _description,
        'content': _content,
        'image_cover': _imageCover,
        'video': _video,
        'date_created': _dateCreated,
        'date_updated': _dateUpdated,
        'duration_hours': _durationHours,
        'file': _file?.toMap(),
        'reacts': _reacts?.map((e) => e.toMap()).toList(),
        'organization_id': _organizationId,
        'programs': _programs?.map((e) => e.toMap()).toList(),
        'estimate_in_day': _estimateInDay,
        'checkLession': _checkLession,
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
        'date_created': serializeParam(
          _dateCreated,
          ParamType.String,
        ),
        'date_updated': serializeParam(
          _dateUpdated,
          ParamType.String,
        ),
        'duration_hours': serializeParam(
          _durationHours,
          ParamType.int,
        ),
        'file': serializeParam(
          _file,
          ParamType.DataStruct,
        ),
        'reacts': serializeParam(
          _reacts,
          ParamType.DataStruct,
          true,
        ),
        'organization_id': serializeParam(
          _organizationId,
          ParamType.String,
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
        'checkLession': serializeParam(
          _checkLession,
          ParamType.bool,
        ),
      }.withoutNulls;

  static LessonsStruct fromSerializableMap(Map<String, dynamic> data) =>
      LessonsStruct(
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
        dateCreated: deserializeParam(
          data['date_created'],
          ParamType.String,
          false,
        ),
        dateUpdated: deserializeParam(
          data['date_updated'],
          ParamType.String,
          false,
        ),
        durationHours: deserializeParam(
          data['duration_hours'],
          ParamType.int,
          false,
        ),
        file: deserializeStructParam(
          data['file'],
          ParamType.DataStruct,
          false,
          structBuilder: FileStruct.fromSerializableMap,
        ),
        reacts: deserializeStructParam<ReactsStruct>(
          data['reacts'],
          ParamType.DataStruct,
          true,
          structBuilder: ReactsStruct.fromSerializableMap,
        ),
        organizationId: deserializeParam(
          data['organization_id'],
          ParamType.String,
          false,
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
        checkLession: deserializeParam(
          data['checkLession'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'LessonsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LessonsStruct &&
        id == other.id &&
        status == other.status &&
        name == other.name &&
        description == other.description &&
        content == other.content &&
        imageCover == other.imageCover &&
        video == other.video &&
        dateCreated == other.dateCreated &&
        dateUpdated == other.dateUpdated &&
        durationHours == other.durationHours &&
        file == other.file &&
        listEquality.equals(reacts, other.reacts) &&
        organizationId == other.organizationId &&
        listEquality.equals(programs, other.programs) &&
        estimateInDay == other.estimateInDay &&
        checkLession == other.checkLession;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        name,
        description,
        content,
        imageCover,
        video,
        dateCreated,
        dateUpdated,
        durationHours,
        file,
        reacts,
        organizationId,
        programs,
        estimateInDay,
        checkLession
      ]);
}

LessonsStruct createLessonsStruct({
  String? id,
  String? status,
  String? name,
  String? description,
  String? content,
  String? imageCover,
  String? video,
  String? dateCreated,
  String? dateUpdated,
  int? durationHours,
  FileStruct? file,
  String? organizationId,
  int? estimateInDay,
  bool? checkLession,
}) =>
    LessonsStruct(
      id: id,
      status: status,
      name: name,
      description: description,
      content: content,
      imageCover: imageCover,
      video: video,
      dateCreated: dateCreated,
      dateUpdated: dateUpdated,
      durationHours: durationHours,
      file: file ?? FileStruct(),
      organizationId: organizationId,
      estimateInDay: estimateInDay,
      checkLession: checkLession,
    );
