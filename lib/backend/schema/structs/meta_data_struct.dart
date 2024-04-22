// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MetaDataStruct extends BaseStruct {
  MetaDataStruct({
    int? totalCount,
    int? filterCount,
  })  : _totalCount = totalCount,
        _filterCount = filterCount;

  // "total_count" field.
  int? _totalCount;
  int get totalCount => _totalCount ?? 0;
  set totalCount(int? val) => _totalCount = val;
  void incrementTotalCount(int amount) => _totalCount = totalCount + amount;
  bool hasTotalCount() => _totalCount != null;

  // "filter_count" field.
  int? _filterCount;
  int get filterCount => _filterCount ?? 0;
  set filterCount(int? val) => _filterCount = val;
  void incrementFilterCount(int amount) => _filterCount = filterCount + amount;
  bool hasFilterCount() => _filterCount != null;

  static MetaDataStruct fromMap(Map<String, dynamic> data) => MetaDataStruct(
        totalCount: castToType<int>(data['total_count']),
        filterCount: castToType<int>(data['filter_count']),
      );

  static MetaDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? MetaDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'total_count': _totalCount,
        'filter_count': _filterCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'total_count': serializeParam(
          _totalCount,
          ParamType.int,
        ),
        'filter_count': serializeParam(
          _filterCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static MetaDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      MetaDataStruct(
        totalCount: deserializeParam(
          data['total_count'],
          ParamType.int,
          false,
        ),
        filterCount: deserializeParam(
          data['filter_count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MetaDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MetaDataStruct &&
        totalCount == other.totalCount &&
        filterCount == other.filterCount;
  }

  @override
  int get hashCode => const ListEquality().hash([totalCount, filterCount]);
}

MetaDataStruct createMetaDataStruct({
  int? totalCount,
  int? filterCount,
}) =>
    MetaDataStruct(
      totalCount: totalCount,
      filterCount: filterCount,
    );
