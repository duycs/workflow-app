// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrganizationListStruct extends BaseStruct {
  OrganizationListStruct({
    String? id,
    String? status,
    String? name,
    String? description,
    String? avatar,
    String? logo,
    String? hotline,
    String? address,
    String? video,
    List<OrganizationBranchStruct>? branchs,
    List<StaffsStruct>? staffs,
    String? image,
    List<FileDataTypeStruct>? files,
  })  : _id = id,
        _status = status,
        _name = name,
        _description = description,
        _avatar = avatar,
        _logo = logo,
        _hotline = hotline,
        _address = address,
        _video = video,
        _branchs = branchs,
        _staffs = staffs,
        _image = image,
        _files = files;

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

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  set avatar(String? val) => _avatar = val;

  bool hasAvatar() => _avatar != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  // "hotline" field.
  String? _hotline;
  String get hotline => _hotline ?? '';
  set hotline(String? val) => _hotline = val;

  bool hasHotline() => _hotline != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  set video(String? val) => _video = val;

  bool hasVideo() => _video != null;

  // "branchs" field.
  List<OrganizationBranchStruct>? _branchs;
  List<OrganizationBranchStruct> get branchs => _branchs ?? const [];
  set branchs(List<OrganizationBranchStruct>? val) => _branchs = val;

  void updateBranchs(Function(List<OrganizationBranchStruct>) updateFn) {
    updateFn(branchs ??= []);
  }

  bool hasBranchs() => _branchs != null;

  // "staffs" field.
  List<StaffsStruct>? _staffs;
  List<StaffsStruct> get staffs => _staffs ?? const [];
  set staffs(List<StaffsStruct>? val) => _staffs = val;

  void updateStaffs(Function(List<StaffsStruct>) updateFn) {
    updateFn(staffs ??= []);
  }

  bool hasStaffs() => _staffs != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "files" field.
  List<FileDataTypeStruct>? _files;
  List<FileDataTypeStruct> get files => _files ?? const [];
  set files(List<FileDataTypeStruct>? val) => _files = val;

  void updateFiles(Function(List<FileDataTypeStruct>) updateFn) {
    updateFn(files ??= []);
  }

  bool hasFiles() => _files != null;

  static OrganizationListStruct fromMap(Map<String, dynamic> data) =>
      OrganizationListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        avatar: data['avatar'] as String?,
        logo: data['logo'] as String?,
        hotline: data['hotline'] as String?,
        address: data['address'] as String?,
        video: data['video'] as String?,
        branchs: getStructList(
          data['branchs'],
          OrganizationBranchStruct.fromMap,
        ),
        staffs: getStructList(
          data['staffs'],
          StaffsStruct.fromMap,
        ),
        image: data['image'] as String?,
        files: getStructList(
          data['files'],
          FileDataTypeStruct.fromMap,
        ),
      );

  static OrganizationListStruct? maybeFromMap(dynamic data) => data is Map
      ? OrganizationListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'name': _name,
        'description': _description,
        'avatar': _avatar,
        'logo': _logo,
        'hotline': _hotline,
        'address': _address,
        'video': _video,
        'branchs': _branchs?.map((e) => e.toMap()).toList(),
        'staffs': _staffs?.map((e) => e.toMap()).toList(),
        'image': _image,
        'files': _files?.map((e) => e.toMap()).toList(),
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
        'avatar': serializeParam(
          _avatar,
          ParamType.String,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
        'hotline': serializeParam(
          _hotline,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'video': serializeParam(
          _video,
          ParamType.String,
        ),
        'branchs': serializeParam(
          _branchs,
          ParamType.DataStruct,
          isList: true,
        ),
        'staffs': serializeParam(
          _staffs,
          ParamType.DataStruct,
          isList: true,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'files': serializeParam(
          _files,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static OrganizationListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      OrganizationListStruct(
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
        avatar: deserializeParam(
          data['avatar'],
          ParamType.String,
          false,
        ),
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
        hotline: deserializeParam(
          data['hotline'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        video: deserializeParam(
          data['video'],
          ParamType.String,
          false,
        ),
        branchs: deserializeStructParam<OrganizationBranchStruct>(
          data['branchs'],
          ParamType.DataStruct,
          true,
          structBuilder: OrganizationBranchStruct.fromSerializableMap,
        ),
        staffs: deserializeStructParam<StaffsStruct>(
          data['staffs'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffsStruct.fromSerializableMap,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        files: deserializeStructParam<FileDataTypeStruct>(
          data['files'],
          ParamType.DataStruct,
          true,
          structBuilder: FileDataTypeStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'OrganizationListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OrganizationListStruct &&
        id == other.id &&
        status == other.status &&
        name == other.name &&
        description == other.description &&
        avatar == other.avatar &&
        logo == other.logo &&
        hotline == other.hotline &&
        address == other.address &&
        video == other.video &&
        listEquality.equals(branchs, other.branchs) &&
        listEquality.equals(staffs, other.staffs) &&
        image == other.image &&
        listEquality.equals(files, other.files);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        name,
        description,
        avatar,
        logo,
        hotline,
        address,
        video,
        branchs,
        staffs,
        image,
        files
      ]);
}

OrganizationListStruct createOrganizationListStruct({
  String? id,
  String? status,
  String? name,
  String? description,
  String? avatar,
  String? logo,
  String? hotline,
  String? address,
  String? video,
  String? image,
}) =>
    OrganizationListStruct(
      id: id,
      status: status,
      name: name,
      description: description,
      avatar: avatar,
      logo: logo,
      hotline: hotline,
      address: address,
      video: video,
      image: image,
    );
