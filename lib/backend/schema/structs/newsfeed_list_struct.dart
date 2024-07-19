// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsfeedListStruct extends BaseStruct {
  NewsfeedListStruct({
    String? id,
    String? status,
    UserStruct? userCreated,
    String? dateCreated,
    String? title,
    String? content,
    String? organizationId,
    BranchListStruct? branchId,
    DepartmentListStruct? departmentId,
    List<FileDataTypeStruct>? images,
    List<FileDataTypeStruct>? videos,
    List<FileDataTypeStruct>? files,
    List<CommentNewsfeedStruct>? comments,
    List<ReactsStruct>? reacts,
    List<ReadNewsfeedStruct>? reads,
  })  : _id = id,
        _status = status,
        _userCreated = userCreated,
        _dateCreated = dateCreated,
        _title = title,
        _content = content,
        _organizationId = organizationId,
        _branchId = branchId,
        _departmentId = departmentId,
        _images = images,
        _videos = videos,
        _files = files,
        _comments = comments,
        _reacts = reacts,
        _reads = reads;

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

  // "user_created" field.
  UserStruct? _userCreated;
  UserStruct get userCreated => _userCreated ?? UserStruct();
  set userCreated(UserStruct? val) => _userCreated = val;

  void updateUserCreated(Function(UserStruct) updateFn) {
    updateFn(_userCreated ??= UserStruct());
  }

  bool hasUserCreated() => _userCreated != null;

  // "date_created" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;

  bool hasDateCreated() => _dateCreated != null;

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

  // "organization_id" field.
  String? _organizationId;
  String get organizationId => _organizationId ?? '';
  set organizationId(String? val) => _organizationId = val;

  bool hasOrganizationId() => _organizationId != null;

  // "branch_id" field.
  BranchListStruct? _branchId;
  BranchListStruct get branchId => _branchId ?? BranchListStruct();
  set branchId(BranchListStruct? val) => _branchId = val;

  void updateBranchId(Function(BranchListStruct) updateFn) {
    updateFn(_branchId ??= BranchListStruct());
  }

  bool hasBranchId() => _branchId != null;

  // "department_id" field.
  DepartmentListStruct? _departmentId;
  DepartmentListStruct get departmentId =>
      _departmentId ?? DepartmentListStruct();
  set departmentId(DepartmentListStruct? val) => _departmentId = val;

  void updateDepartmentId(Function(DepartmentListStruct) updateFn) {
    updateFn(_departmentId ??= DepartmentListStruct());
  }

  bool hasDepartmentId() => _departmentId != null;

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

  // "comments" field.
  List<CommentNewsfeedStruct>? _comments;
  List<CommentNewsfeedStruct> get comments => _comments ?? const [];
  set comments(List<CommentNewsfeedStruct>? val) => _comments = val;

  void updateComments(Function(List<CommentNewsfeedStruct>) updateFn) {
    updateFn(_comments ??= []);
  }

  bool hasComments() => _comments != null;

  // "reacts" field.
  List<ReactsStruct>? _reacts;
  List<ReactsStruct> get reacts => _reacts ?? const [];
  set reacts(List<ReactsStruct>? val) => _reacts = val;

  void updateReacts(Function(List<ReactsStruct>) updateFn) {
    updateFn(_reacts ??= []);
  }

  bool hasReacts() => _reacts != null;

  // "reads" field.
  List<ReadNewsfeedStruct>? _reads;
  List<ReadNewsfeedStruct> get reads => _reads ?? const [];
  set reads(List<ReadNewsfeedStruct>? val) => _reads = val;

  void updateReads(Function(List<ReadNewsfeedStruct>) updateFn) {
    updateFn(_reads ??= []);
  }

  bool hasReads() => _reads != null;

  static NewsfeedListStruct fromMap(Map<String, dynamic> data) =>
      NewsfeedListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        userCreated: UserStruct.maybeFromMap(data['user_created']),
        dateCreated: data['date_created'] as String?,
        title: data['title'] as String?,
        content: data['content'] as String?,
        organizationId: data['organization_id'] as String?,
        branchId: BranchListStruct.maybeFromMap(data['branch_id']),
        departmentId: DepartmentListStruct.maybeFromMap(data['department_id']),
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
        comments: getStructList(
          data['comments'],
          CommentNewsfeedStruct.fromMap,
        ),
        reacts: getStructList(
          data['reacts'],
          ReactsStruct.fromMap,
        ),
        reads: getStructList(
          data['reads'],
          ReadNewsfeedStruct.fromMap,
        ),
      );

  static NewsfeedListStruct? maybeFromMap(dynamic data) => data is Map
      ? NewsfeedListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'user_created': _userCreated?.toMap(),
        'date_created': _dateCreated,
        'title': _title,
        'content': _content,
        'organization_id': _organizationId,
        'branch_id': _branchId?.toMap(),
        'department_id': _departmentId?.toMap(),
        'images': _images?.map((e) => e.toMap()).toList(),
        'videos': _videos?.map((e) => e.toMap()).toList(),
        'files': _files?.map((e) => e.toMap()).toList(),
        'comments': _comments?.map((e) => e.toMap()).toList(),
        'reacts': _reacts?.map((e) => e.toMap()).toList(),
        'reads': _reads?.map((e) => e.toMap()).toList(),
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
        'user_created': serializeParam(
          _userCreated,
          ParamType.DataStruct,
        ),
        'date_created': serializeParam(
          _dateCreated,
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
        'organization_id': serializeParam(
          _organizationId,
          ParamType.String,
        ),
        'branch_id': serializeParam(
          _branchId,
          ParamType.DataStruct,
        ),
        'department_id': serializeParam(
          _departmentId,
          ParamType.DataStruct,
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
        'comments': serializeParam(
          _comments,
          ParamType.DataStruct,
          isList: true,
        ),
        'reacts': serializeParam(
          _reacts,
          ParamType.DataStruct,
          isList: true,
        ),
        'reads': serializeParam(
          _reads,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static NewsfeedListStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewsfeedListStruct(
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
        userCreated: deserializeStructParam(
          data['user_created'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        dateCreated: deserializeParam(
          data['date_created'],
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
        organizationId: deserializeParam(
          data['organization_id'],
          ParamType.String,
          false,
        ),
        branchId: deserializeStructParam(
          data['branch_id'],
          ParamType.DataStruct,
          false,
          structBuilder: BranchListStruct.fromSerializableMap,
        ),
        departmentId: deserializeStructParam(
          data['department_id'],
          ParamType.DataStruct,
          false,
          structBuilder: DepartmentListStruct.fromSerializableMap,
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
        comments: deserializeStructParam<CommentNewsfeedStruct>(
          data['comments'],
          ParamType.DataStruct,
          true,
          structBuilder: CommentNewsfeedStruct.fromSerializableMap,
        ),
        reacts: deserializeStructParam<ReactsStruct>(
          data['reacts'],
          ParamType.DataStruct,
          true,
          structBuilder: ReactsStruct.fromSerializableMap,
        ),
        reads: deserializeStructParam<ReadNewsfeedStruct>(
          data['reads'],
          ParamType.DataStruct,
          true,
          structBuilder: ReadNewsfeedStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NewsfeedListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NewsfeedListStruct &&
        id == other.id &&
        status == other.status &&
        userCreated == other.userCreated &&
        dateCreated == other.dateCreated &&
        title == other.title &&
        content == other.content &&
        organizationId == other.organizationId &&
        branchId == other.branchId &&
        departmentId == other.departmentId &&
        listEquality.equals(images, other.images) &&
        listEquality.equals(videos, other.videos) &&
        listEquality.equals(files, other.files) &&
        listEquality.equals(comments, other.comments) &&
        listEquality.equals(reacts, other.reacts) &&
        listEquality.equals(reads, other.reads);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        userCreated,
        dateCreated,
        title,
        content,
        organizationId,
        branchId,
        departmentId,
        images,
        videos,
        files,
        comments,
        reacts,
        reads
      ]);
}

NewsfeedListStruct createNewsfeedListStruct({
  String? id,
  String? status,
  UserStruct? userCreated,
  String? dateCreated,
  String? title,
  String? content,
  String? organizationId,
  BranchListStruct? branchId,
  DepartmentListStruct? departmentId,
}) =>
    NewsfeedListStruct(
      id: id,
      status: status,
      userCreated: userCreated ?? UserStruct(),
      dateCreated: dateCreated,
      title: title,
      content: content,
      organizationId: organizationId,
      branchId: branchId ?? BranchListStruct(),
      departmentId: departmentId ?? DepartmentListStruct(),
    );
