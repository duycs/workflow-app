// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestsionOneDataStruct extends BaseStruct {
  QuestsionOneDataStruct({
    QuestionObjectStruct? data,
  }) : _data = data;

  // "data" field.
  QuestionObjectStruct? _data;
  QuestionObjectStruct get data => _data ?? QuestionObjectStruct();
  set data(QuestionObjectStruct? val) => _data = val;
  void updateData(Function(QuestionObjectStruct) updateFn) =>
      updateFn(_data ??= QuestionObjectStruct());
  bool hasData() => _data != null;

  static QuestsionOneDataStruct fromMap(Map<String, dynamic> data) =>
      QuestsionOneDataStruct(
        data: QuestionObjectStruct.maybeFromMap(data['data']),
      );

  static QuestsionOneDataStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestsionOneDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static QuestsionOneDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      QuestsionOneDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: QuestionObjectStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'QuestsionOneDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuestsionOneDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

QuestsionOneDataStruct createQuestsionOneDataStruct({
  QuestionObjectStruct? data,
}) =>
    QuestsionOneDataStruct(
      data: data ?? QuestionObjectStruct(),
    );
