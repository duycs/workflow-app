// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreateDomainAuthorsListStruct extends BaseStruct {
  CreateDomainAuthorsListStruct({
    List<CreateDomainAuthorsStruct>? create,
  }) : _create = create;

  // "create" field.
  List<CreateDomainAuthorsStruct>? _create;
  List<CreateDomainAuthorsStruct> get create => _create ?? const [];
  set create(List<CreateDomainAuthorsStruct>? val) => _create = val;

  void updateCreate(Function(List<CreateDomainAuthorsStruct>) updateFn) {
    updateFn(_create ??= []);
  }

  bool hasCreate() => _create != null;

  static CreateDomainAuthorsListStruct fromMap(Map<String, dynamic> data) =>
      CreateDomainAuthorsListStruct(
        create: getStructList(
          data['create'],
          CreateDomainAuthorsStruct.fromMap,
        ),
      );

  static CreateDomainAuthorsListStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? CreateDomainAuthorsListStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'create': _create?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'create': serializeParam(
          _create,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static CreateDomainAuthorsListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CreateDomainAuthorsListStruct(
        create: deserializeStructParam<CreateDomainAuthorsStruct>(
          data['create'],
          ParamType.DataStruct,
          true,
          structBuilder: CreateDomainAuthorsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CreateDomainAuthorsListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CreateDomainAuthorsListStruct &&
        listEquality.equals(create, other.create);
  }

  @override
  int get hashCode => const ListEquality().hash([create]);
}

CreateDomainAuthorsListStruct createCreateDomainAuthorsListStruct() =>
    CreateDomainAuthorsListStruct();
