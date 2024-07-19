// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreateNNewsFeedDataStruct extends BaseStruct {
  CreateNNewsFeedDataStruct({
    String? status,
    String? userCreated,
    String? title,
    String? content,
    List<FileDataTypeStruct>? images,
    List<FileDataTypeStruct>? videos,
    List<FileDataTypeStruct>? files,
    String? departmentId,
    String? branchId,
    String? organizationId,
  })  : _status = status,
        _userCreated = userCreated,
        _title = title,
        _content = content,
        _images = images,
        _videos = videos,
        _files = files,
        _departmentId = departmentId,
        _branchId = branchId,
        _organizationId = organizationId;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "user_created" field.
  String? _userCreated;
  String get userCreated => _userCreated ?? '';
  set userCreated(String? val) => _userCreated = val;

  bool hasUserCreated() => _userCreated != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "images" field.
  List<FileDataTypeStruct>? _images;
  List<FileDataTypeStruct> get images => _images ?? const [];
  set images(List<FileDataTypeStruct>? val) => _images = val;

  void updateImages(Function(List<FileDataTypeStruct>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "videos" field.
  List<FileDataTypeStruct>? _videos;
  List<FileDataTypeStruct> get videos => _videos ?? const [];
  set videos(List<FileDataTypeStruct>? val) => _videos = val;

  void updateVideos(Function(List<FileDataTypeStruct>) updateFn) {
    updateFn(_videos ??= []);
  }

  bool hasVideos() => _videos != null;

  // "files" field.
  List<FileDataTypeStruct>? _files;
  List<FileDataTypeStruct> get files => _files ?? const [];
  set files(List<FileDataTypeStruct>? val) => _files = val;

  void updateFiles(Function(List<FileDataTypeStruct>) updateFn) {
    updateFn(_files ??= []);
  }

  bool hasFiles() => _files != null;

  // "department_id" field.
  String? _departmentId;
  String get departmentId => _departmentId ?? '';
  set departmentId(String? val) => _departmentId = val;

  bool hasDepartmentId() => _departmentId != null;

  // "branch_id" field.
  String? _branchId;
  String get branchId => _branchId ?? '';
  set branchId(String? val) => _branchId = val;

  bool hasBranchId() => _branchId != null;

  // "organization_id" field.
  String? _organizationId;
  String get organizationId => _organizationId ?? '';
  set organizationId(String? val) => _organizationId = val;

  bool hasOrganizationId() => _organizationId != null;

  static CreateNNewsFeedDataStruct fromMap(Map<String, dynamic> data) =>
      CreateNNewsFeedDataStruct(
        status: data['status'] as String?,
        userCreated: data['user_created'] as String?,
        title: data['title'] as String?,
        content: data['content'] as String?,
        images: getStructList(
          data['images'],
          FileDataTypeStruct.fromMap,
        ),
        videos: getStructList(
          data['videos'],
          FileDataTypeStruct.fromMap,
        ),
        files: getStructList(
          data['files'],
          FileDataTypeStruct.fromMap,
        ),
        departmentId: data['department_id'] as String?,
        branchId: data['branch_id'] as String?,
        organizationId: data['organization_id'] as String?,
      );

  static CreateNNewsFeedDataStruct? maybeFromMap(dynamic data) => data is Map
      ? CreateNNewsFeedDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'user_created': _userCreated,
        'title': _title,
        'content': _content,
        'images': _images?.map((e) => e.toMap()).toList(),
        'videos': _videos?.map((e) => e.toMap()).toList(),
        'files': _files?.map((e) => e.toMap()).toList(),
        'department_id': _departmentId,
        'branch_id': _branchId,
        'organization_id': _organizationId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'user_created': serializeParam(
          _userCreated,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.DataStruct,
          isList: true,
        ),
        'videos': serializeParam(
          _videos,
          ParamType.DataStruct,
          isList: true,
        ),
        'files': serializeParam(
          _files,
          ParamType.DataStruct,
          isList: true,
        ),
        'department_id': serializeParam(
          _departmentId,
          ParamType.String,
        ),
        'branch_id': serializeParam(
          _branchId,
          ParamType.String,
        ),
        'organization_id': serializeParam(
          _organizationId,
          ParamType.String,
        ),
      }.withoutNulls;

  static CreateNNewsFeedDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CreateNNewsFeedDataStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        userCreated: deserializeParam(
          data['user_created'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        images: deserializeStructParam<FileDataTypeStruct>(
          data['images'],
          ParamType.DataStruct,
          true,
          structBuilder: FileDataTypeStruct.fromSerializableMap,
        ),
        videos: deserializeStructParam<FileDataTypeStruct>(
          data['videos'],
          ParamType.DataStruct,
          true,
          structBuilder: FileDataTypeStruct.fromSerializableMap,
        ),
        files: deserializeStructParam<FileDataTypeStruct>(
          data['files'],
          ParamType.DataStruct,
          true,
          structBuilder: FileDataTypeStruct.fromSerializableMap,
        ),
        departmentId: deserializeParam(
          data['department_id'],
          ParamType.String,
          false,
        ),
        branchId: deserializeParam(
          data['branch_id'],
          ParamType.String,
          false,
        ),
        organizationId: deserializeParam(
          data['organization_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CreateNNewsFeedDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CreateNNewsFeedDataStruct &&
        status == other.status &&
        userCreated == other.userCreated &&
        title == other.title &&
        content == other.content &&
        listEquality.equals(images, other.images) &&
        listEquality.equals(videos, other.videos) &&
        listEquality.equals(files, other.files) &&
        departmentId == other.departmentId &&
        branchId == other.branchId &&
        organizationId == other.organizationId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        status,
        userCreated,
        title,
        content,
        images,
        videos,
        files,
        departmentId,
        branchId,
        organizationId
      ]);
}

CreateNNewsFeedDataStruct createCreateNNewsFeedDataStruct({
  String? status,
  String? userCreated,
  String? title,
  String? content,
  String? departmentId,
  String? branchId,
  String? organizationId,
}) =>
    CreateNNewsFeedDataStruct(
      status: status,
      userCreated: userCreated,
      title: title,
      content: content,
      departmentId: departmentId,
      branchId: branchId,
      organizationId: organizationId,
    );
