// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarketLessonListDataStruct extends BaseStruct {
  MarketLessonListDataStruct({
    List<MarketLessonListStruct>? data,
  }) : _data = data;

  // "data" field.
  List<MarketLessonListStruct>? _data;
  List<MarketLessonListStruct> get data => _data ?? const [];
  set data(List<MarketLessonListStruct>? val) => _data = val;

  void updateData(Function(List<MarketLessonListStruct>) updateFn) {
    updateFn(data ??= []);
  }

  bool hasData() => _data != null;

  static MarketLessonListDataStruct fromMap(Map<String, dynamic> data) =>
      MarketLessonListDataStruct(
        data: getStructList(
          data['data'],
          MarketLessonListStruct.fromMap,
        ),
      );

  static MarketLessonListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? MarketLessonListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static MarketLessonListDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MarketLessonListDataStruct(
        data: deserializeStructParam<MarketLessonListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: MarketLessonListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MarketLessonListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MarketLessonListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

MarketLessonListDataStruct createMarketLessonListDataStruct() =>
    MarketLessonListDataStruct();
