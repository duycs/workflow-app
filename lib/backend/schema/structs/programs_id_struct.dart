// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramsIdStruct extends BaseStruct {
  ProgramsIdStruct({
    String? id,
    String? name,
    String? authorId,
    List<LessionIdStruct>? lessions,
  })  : _id = id,
        _name = name,
        _authorId = authorId,
        _lessions = lessions;

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

  // "author_id" field.
  String? _authorId;
  String get authorId => _authorId ?? '';
  set authorId(String? val) => _authorId = val;
  bool hasAuthorId() => _authorId != null;

  // "lessions" field.
  List<LessionIdStruct>? _lessions;
  List<LessionIdStruct> get lessions => _lessions ?? const [];
  set lessions(List<LessionIdStruct>? val) => _lessions = val;
  void updateLessions(Function(List<LessionIdStruct>) updateFn) =>
      updateFn(_lessions ??= []);
  bool hasLessions() => _lessions != null;

  static ProgramsIdStruct fromMap(Map<String, dynamic> data) =>
      ProgramsIdStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        authorId: data['author_id'] as String?,
        lessions: getStructList(
          data['lessions'],
          LessionIdStruct.fromMap,
        ),
      );

  static ProgramsIdStruct? maybeFromMap(dynamic data) => data is Map
      ? ProgramsIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'author_id': _authorId,
        'lessions': _lessions?.map((e) => e.toMap()).toList(),
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
        'author_id': serializeParam(
          _authorId,
          ParamType.String,
        ),
        'lessions': serializeParam(
          _lessions,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static ProgramsIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProgramsIdStruct(
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
        authorId: deserializeParam(
          data['author_id'],
          ParamType.String,
          false,
        ),
        lessions: deserializeStructParam<LessionIdStruct>(
          data['lessions'],
          ParamType.DataStruct,
          true,
          structBuilder: LessionIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProgramsIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProgramsIdStruct &&
        id == other.id &&
        name == other.name &&
        authorId == other.authorId &&
        listEquality.equals(lessions, other.lessions);
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, authorId, lessions]);
}

ProgramsIdStruct createProgramsIdStruct({
  String? id,
  String? name,
  String? authorId,
}) =>
    ProgramsIdStruct(
      id: id,
      name: name,
      authorId: authorId,
    );
