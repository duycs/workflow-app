// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentStruct extends BaseStruct {
  CommentStruct({
    String? id,
    StaffListStruct? staffId,
    String? content,
    String? image,
    String? file,
    String? video,
    String? dateCreated,
  })  : _id = id,
        _staffId = staffId,
        _content = content,
        _image = image,
        _file = file,
        _video = video,
        _dateCreated = dateCreated;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "staff_id" field.
  StaffListStruct? _staffId;
  StaffListStruct get staffId => _staffId ?? StaffListStruct();
  set staffId(StaffListStruct? val) => _staffId = val;

  void updateStaffId(Function(StaffListStruct) updateFn) {
    updateFn(_staffId ??= StaffListStruct());
  }

  bool hasStaffId() => _staffId != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "file" field.
  String? _file;
  String get file => _file ?? '';
  set file(String? val) => _file = val;

  bool hasFile() => _file != null;

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

  static CommentStruct fromMap(Map<String, dynamic> data) => CommentStruct(
        id: data['id'] as String?,
        staffId: StaffListStruct.maybeFromMap(data['staff_id']),
        content: data['content'] as String?,
        image: data['image'] as String?,
        file: data['file'] as String?,
        video: data['video'] as String?,
        dateCreated: data['date_created'] as String?,
      );

  static CommentStruct? maybeFromMap(dynamic data) =>
      data is Map ? CommentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'staff_id': _staffId?.toMap(),
        'content': _content,
        'image': _image,
        'file': _file,
        'video': _video,
        'date_created': _dateCreated,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'staff_id': serializeParam(
          _staffId,
          ParamType.DataStruct,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'file': serializeParam(
          _file,
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
      }.withoutNulls;

  static CommentStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommentStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        staffId: deserializeStructParam(
          data['staff_id'],
          ParamType.DataStruct,
          false,
          structBuilder: StaffListStruct.fromSerializableMap,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        file: deserializeParam(
          data['file'],
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
      );

  @override
  String toString() => 'CommentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommentStruct &&
        id == other.id &&
        staffId == other.staffId &&
        content == other.content &&
        image == other.image &&
        file == other.file &&
        video == other.video &&
        dateCreated == other.dateCreated;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, staffId, content, image, file, video, dateCreated]);
}

CommentStruct createCommentStruct({
  String? id,
  StaffListStruct? staffId,
  String? content,
  String? image,
  String? file,
  String? video,
  String? dateCreated,
}) =>
    CommentStruct(
      id: id,
      staffId: staffId ?? StaffListStruct(),
      content: content,
      image: image,
      file: file,
      video: video,
      dateCreated: dateCreated,
    );
