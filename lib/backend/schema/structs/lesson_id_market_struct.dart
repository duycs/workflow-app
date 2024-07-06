// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonIdMarketStruct extends BaseStruct {
  LessonIdMarketStruct({
    String? id,
    String? status,
    String? name,
    String? dateCreated,
    String? imageCover,
    String? description,
    String? content,
    String? video,
    String? dateUpdated,
    String? durationHours,
    FileStruct? file,
  })  : _id = id,
        _status = status,
        _name = name,
        _dateCreated = dateCreated,
        _imageCover = imageCover,
        _description = description,
        _content = content,
        _video = video,
        _dateUpdated = dateUpdated,
        _durationHours = durationHours,
        _file = file;

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

  // "date_created" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;

  bool hasDateCreated() => _dateCreated != null;

  // "image_cover" field.
  String? _imageCover;
  String get imageCover => _imageCover ?? '';
  set imageCover(String? val) => _imageCover = val;

  bool hasImageCover() => _imageCover != null;

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

  // "duration_hours" field.
  String? _durationHours;
  String get durationHours => _durationHours ?? '';
  set durationHours(String? val) => _durationHours = val;

  bool hasDurationHours() => _durationHours != null;

  // "file" field.
  FileStruct? _file;
  FileStruct get file => _file ?? FileStruct();
  set file(FileStruct? val) => _file = val;

  void updateFile(Function(FileStruct) updateFn) {
    updateFn(_file ??= FileStruct());
  }

  bool hasFile() => _file != null;

  static LessonIdMarketStruct fromMap(Map<String, dynamic> data) =>
      LessonIdMarketStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        name: data['name'] as String?,
        dateCreated: data['date_created'] as String?,
        imageCover: data['image_cover'] as String?,
        description: data['description'] as String?,
        content: data['content'] as String?,
        video: data['video'] as String?,
        dateUpdated: data['date_updated'] as String?,
        durationHours: data['duration_hours'] as String?,
        file: FileStruct.maybeFromMap(data['file']),
      );

  static LessonIdMarketStruct? maybeFromMap(dynamic data) => data is Map
      ? LessonIdMarketStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'name': _name,
        'date_created': _dateCreated,
        'image_cover': _imageCover,
        'description': _description,
        'content': _content,
        'video': _video,
        'date_updated': _dateUpdated,
        'duration_hours': _durationHours,
        'file': _file?.toMap(),
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
        'date_created': serializeParam(
          _dateCreated,
          ParamType.String,
        ),
        'image_cover': serializeParam(
          _imageCover,
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
        'video': serializeParam(
          _video,
          ParamType.String,
        ),
        'date_updated': serializeParam(
          _dateUpdated,
          ParamType.String,
        ),
        'duration_hours': serializeParam(
          _durationHours,
          ParamType.String,
        ),
        'file': serializeParam(
          _file,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static LessonIdMarketStruct fromSerializableMap(Map<String, dynamic> data) =>
      LessonIdMarketStruct(
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
        dateCreated: deserializeParam(
          data['date_created'],
          ParamType.String,
          false,
        ),
        imageCover: deserializeParam(
          data['image_cover'],
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
        durationHours: deserializeParam(
          data['duration_hours'],
          ParamType.String,
          false,
        ),
        file: deserializeStructParam(
          data['file'],
          ParamType.DataStruct,
          false,
          structBuilder: FileStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LessonIdMarketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LessonIdMarketStruct &&
        id == other.id &&
        status == other.status &&
        name == other.name &&
        dateCreated == other.dateCreated &&
        imageCover == other.imageCover &&
        description == other.description &&
        content == other.content &&
        video == other.video &&
        dateUpdated == other.dateUpdated &&
        durationHours == other.durationHours &&
        file == other.file;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        name,
        dateCreated,
        imageCover,
        description,
        content,
        video,
        dateUpdated,
        durationHours,
        file
      ]);
}

LessonIdMarketStruct createLessonIdMarketStruct({
  String? id,
  String? status,
  String? name,
  String? dateCreated,
  String? imageCover,
  String? description,
  String? content,
  String? video,
  String? dateUpdated,
  String? durationHours,
  FileStruct? file,
}) =>
    LessonIdMarketStruct(
      id: id,
      status: status,
      name: name,
      dateCreated: dateCreated,
      imageCover: imageCover,
      description: description,
      content: content,
      video: video,
      dateUpdated: dateUpdated,
      durationHours: durationHours,
      file: file ?? FileStruct(),
    );
