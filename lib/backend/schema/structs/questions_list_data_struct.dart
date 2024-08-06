// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionsListDataStruct extends BaseStruct {
  QuestionsListDataStruct({
    List<QuestionsStruct>? data,
  }) : _data = data;

  // "data" field.
  List<QuestionsStruct>? _data;
  List<QuestionsStruct> get data => _data ?? const [];
  set data(List<QuestionsStruct>? val) => _data = val;

  void updateData(Function(List<QuestionsStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static QuestionsListDataStruct fromMap(Map<String, dynamic> data) =>
      QuestionsListDataStruct(
        data: getStructList(
          data['data'],
          QuestionsStruct.fromMap,
        ),
      );

  static QuestionsListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionsListDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static QuestionsListDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      QuestionsListDataStruct(
        data: deserializeStructParam<QuestionsStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: QuestionsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'QuestionsListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionsListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

QuestionsListDataStruct createQuestionsListDataStruct() =>
    QuestionsListDataStruct();
