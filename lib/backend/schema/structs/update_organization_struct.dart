// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UpdateOrganizationStruct extends BaseStruct {
  UpdateOrganizationStruct({
    String? name,
    String? hotline,
    String? avatar,
    String? logo,
    String? address,
    String? video,
    String? description,
    UploadListFileStruct? files,
  })  : _name = name,
        _hotline = hotline,
        _avatar = avatar,
        _logo = logo,
        _address = address,
        _video = video,
        _description = description,
        _files = files;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "hotline" field.
  String? _hotline;
  String get hotline => _hotline ?? '';
  set hotline(String? val) => _hotline = val;
  bool hasHotline() => _hotline != null;

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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "files" field.
  UploadListFileStruct? _files;
  UploadListFileStruct get files => _files ?? UploadListFileStruct();
  set files(UploadListFileStruct? val) => _files = val;
  void updateFiles(Function(UploadListFileStruct) updateFn) =>
      updateFn(_files ??= UploadListFileStruct());
  bool hasFiles() => _files != null;

  static UpdateOrganizationStruct fromMap(Map<String, dynamic> data) =>
      UpdateOrganizationStruct(
        name: data['name'] as String?,
        hotline: data['hotline'] as String?,
        avatar: data['avatar'] as String?,
        logo: data['logo'] as String?,
        address: data['address'] as String?,
        video: data['video'] as String?,
        description: data['description'] as String?,
        files: UploadListFileStruct.maybeFromMap(data['files']),
      );

  static UpdateOrganizationStruct? maybeFromMap(dynamic data) => data is Map
      ? UpdateOrganizationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'hotline': _hotline,
        'avatar': _avatar,
        'logo': _logo,
        'address': _address,
        'video': _video,
        'description': _description,
        'files': _files?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'hotline': serializeParam(
          _hotline,
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
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'video': serializeParam(
          _video,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'files': serializeParam(
          _files,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static UpdateOrganizationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UpdateOrganizationStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        hotline: deserializeParam(
          data['hotline'],
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
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        files: deserializeStructParam(
          data['files'],
          ParamType.DataStruct,
          false,
          structBuilder: UploadListFileStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UpdateOrganizationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UpdateOrganizationStruct &&
        name == other.name &&
        hotline == other.hotline &&
        avatar == other.avatar &&
        logo == other.logo &&
        address == other.address &&
        video == other.video &&
        description == other.description &&
        files == other.files;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, hotline, avatar, logo, address, video, description, files]);
}

UpdateOrganizationStruct createUpdateOrganizationStruct({
  String? name,
  String? hotline,
  String? avatar,
  String? logo,
  String? address,
  String? video,
  String? description,
  UploadListFileStruct? files,
}) =>
    UpdateOrganizationStruct(
      name: name,
      hotline: hotline,
      avatar: avatar,
      logo: logo,
      address: address,
      video: video,
      description: description,
      files: files ?? UploadListFileStruct(),
    );
