// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramsIdStruct extends BaseStruct {
  ProgramsIdStruct({
    String? id,
    String? name,
    List<LessionIdStruct>? lessions,
    String? imageCover,
    AuthorIdStruct? authorId,
    String? price,
  })  : _id = id,
        _name = name,
        _lessions = lessions,
        _imageCover = imageCover,
        _authorId = authorId,
        _price = price;

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

  // "lessions" field.
  List<LessionIdStruct>? _lessions;
  List<LessionIdStruct> get lessions => _lessions ?? const [];
  set lessions(List<LessionIdStruct>? val) => _lessions = val;
  void updateLessions(Function(List<LessionIdStruct>) updateFn) =>
      updateFn(_lessions ??= []);
  bool hasLessions() => _lessions != null;

  // "image_cover" field.
  String? _imageCover;
  String get imageCover => _imageCover ?? '';
  set imageCover(String? val) => _imageCover = val;
  bool hasImageCover() => _imageCover != null;

  // "author_id" field.
  AuthorIdStruct? _authorId;
  AuthorIdStruct get authorId => _authorId ?? AuthorIdStruct();
  set authorId(AuthorIdStruct? val) => _authorId = val;
  void updateAuthorId(Function(AuthorIdStruct) updateFn) =>
      updateFn(_authorId ??= AuthorIdStruct());
  bool hasAuthorId() => _authorId != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  set price(String? val) => _price = val;
  bool hasPrice() => _price != null;

  static ProgramsIdStruct fromMap(Map<String, dynamic> data) =>
      ProgramsIdStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        lessions: getStructList(
          data['lessions'],
          LessionIdStruct.fromMap,
        ),
        imageCover: data['image_cover'] as String?,
        authorId: AuthorIdStruct.maybeFromMap(data['author_id']),
        price: data['price'] as String?,
      );

  static ProgramsIdStruct? maybeFromMap(dynamic data) => data is Map
      ? ProgramsIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'lessions': _lessions?.map((e) => e.toMap()).toList(),
        'image_cover': _imageCover,
        'author_id': _authorId?.toMap(),
        'price': _price,
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
        'lessions': serializeParam(
          _lessions,
          ParamType.DataStruct,
          true,
        ),
        'image_cover': serializeParam(
          _imageCover,
          ParamType.String,
        ),
        'author_id': serializeParam(
          _authorId,
          ParamType.DataStruct,
        ),
        'price': serializeParam(
          _price,
          ParamType.String,
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
        lessions: deserializeStructParam<LessionIdStruct>(
          data['lessions'],
          ParamType.DataStruct,
          true,
          structBuilder: LessionIdStruct.fromSerializableMap,
        ),
        imageCover: deserializeParam(
          data['image_cover'],
          ParamType.String,
          false,
        ),
        authorId: deserializeStructParam(
          data['author_id'],
          ParamType.DataStruct,
          false,
          structBuilder: AuthorIdStruct.fromSerializableMap,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.String,
          false,
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
        listEquality.equals(lessions, other.lessions) &&
        imageCover == other.imageCover &&
        authorId == other.authorId &&
        price == other.price;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, lessions, imageCover, authorId, price]);
}

ProgramsIdStruct createProgramsIdStruct({
  String? id,
  String? name,
  String? imageCover,
  AuthorIdStruct? authorId,
  String? price,
}) =>
    ProgramsIdStruct(
      id: id,
      name: name,
      imageCover: imageCover,
      authorId: authorId ?? AuthorIdStruct(),
      price: price,
    );
