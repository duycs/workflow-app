// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckBoxGroupStruct extends BaseStruct {
  CheckBoxGroupStruct({
    bool? type,
    String? title,
  })  : _type = type,
        _title = title;

  // "type" field.
  bool? _type;
  bool get type => _type ?? false;
  set type(bool? val) => _type = val;
  bool hasType() => _type != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  static CheckBoxGroupStruct fromMap(Map<String, dynamic> data) =>
      CheckBoxGroupStruct(
        type: data['type'] as bool?,
        title: data['title'] as String?,
      );

  static CheckBoxGroupStruct? maybeFromMap(dynamic data) => data is Map
      ? CheckBoxGroupStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'title': _title,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.bool,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
      }.withoutNulls;

  static CheckBoxGroupStruct fromSerializableMap(Map<String, dynamic> data) =>
      CheckBoxGroupStruct(
        type: deserializeParam(
          data['type'],
          ParamType.bool,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CheckBoxGroupStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CheckBoxGroupStruct &&
        type == other.type &&
        title == other.title;
  }

  @override
  int get hashCode => const ListEquality().hash([type, title]);
}

CheckBoxGroupStruct createCheckBoxGroupStruct({
  bool? type,
  String? title,
}) =>
    CheckBoxGroupStruct(
      type: type,
      title: title,
    );
