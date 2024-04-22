// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionObjectListDataStruct extends BaseStruct {
  QuestionObjectListDataStruct({
    List<QuestionObjectStruct>? data,
  }) : _data = data;

  // "data" field.
  List<QuestionObjectStruct>? _data;
  List<QuestionObjectStruct> get data => _data ?? const [];
  set data(List<QuestionObjectStruct>? val) => _data = val;
  void updateData(Function(List<QuestionObjectStruct>) updateFn) =>
      updateFn(_data ??= []);
  bool hasData() => _data != null;

  static QuestionObjectListDataStruct fromMap(Map<String, dynamic> data) =>
      QuestionObjectListDataStruct(
        data: getStructList(
          data['data'],
          QuestionObjectStruct.fromMap,
        ),
      );

  static QuestionObjectListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionObjectListDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static QuestionObjectListDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      QuestionObjectListDataStruct(
        data: deserializeStructParam<QuestionObjectStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: QuestionObjectStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'QuestionObjectListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionObjectListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

QuestionObjectListDataStruct createQuestionObjectListDataStruct() =>
    QuestionObjectListDataStruct();
