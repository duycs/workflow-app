// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataListNewsFeedStruct extends BaseStruct {
  DataListNewsFeedStruct({
    NewsfeedListStruct? data,
  }) : _data = data;

  // "data" field.
  NewsfeedListStruct? _data;
  NewsfeedListStruct get data => _data ?? NewsfeedListStruct();
  set data(NewsfeedListStruct? val) => _data = val;

  void updateData(Function(NewsfeedListStruct) updateFn) {
    updateFn(_data ??= NewsfeedListStruct());
  }

  bool hasData() => _data != null;

  static DataListNewsFeedStruct fromMap(Map<String, dynamic> data) =>
      DataListNewsFeedStruct(
        data: NewsfeedListStruct.maybeFromMap(data['data']),
      );

  static DataListNewsFeedStruct? maybeFromMap(dynamic data) => data is Map
      ? DataListNewsFeedStruct.fromMap(data.cast<String, dynamic>())
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

  static DataListNewsFeedStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DataListNewsFeedStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: NewsfeedListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DataListNewsFeedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataListNewsFeedStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

DataListNewsFeedStruct createDataListNewsFeedStruct({
  NewsfeedListStruct? data,
}) =>
    DataListNewsFeedStruct(
      data: data ?? NewsfeedListStruct(),
    );
