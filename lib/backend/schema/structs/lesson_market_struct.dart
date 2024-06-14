// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonMarketStruct extends BaseStruct {
  LessonMarketStruct({
    LessonIdMarketStruct? lessionsId,
  }) : _lessionsId = lessionsId;

  // "lessions_id" field.
  LessonIdMarketStruct? _lessionsId;
  LessonIdMarketStruct get lessionsId => _lessionsId ?? LessonIdMarketStruct();
  set lessionsId(LessonIdMarketStruct? val) => _lessionsId = val;

  void updateLessionsId(Function(LessonIdMarketStruct) updateFn) {
    updateFn(lessionsId ??= LessonIdMarketStruct());
  }

  bool hasLessionsId() => _lessionsId != null;

  static LessonMarketStruct fromMap(Map<String, dynamic> data) =>
      LessonMarketStruct(
        lessionsId: LessonIdMarketStruct.maybeFromMap(data['lessions_id']),
      );

  static LessonMarketStruct? maybeFromMap(dynamic data) => data is Map
      ? LessonMarketStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lessions_id': _lessionsId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lessions_id': serializeParam(
          _lessionsId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static LessonMarketStruct fromSerializableMap(Map<String, dynamic> data) =>
      LessonMarketStruct(
        lessionsId: deserializeStructParam(
          data['lessions_id'],
          ParamType.DataStruct,
          false,
          structBuilder: LessonIdMarketStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LessonMarketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LessonMarketStruct && lessionsId == other.lessionsId;
  }

  @override
  int get hashCode => const ListEquality().hash([lessionsId]);
}

LessonMarketStruct createLessonMarketStruct({
  LessonIdMarketStruct? lessionsId,
}) =>
    LessonMarketStruct(
      lessionsId: lessionsId ?? LessonIdMarketStruct(),
    );
