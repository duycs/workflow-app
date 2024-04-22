// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ErorrsStruct extends BaseStruct {
  ErorrsStruct({
    List<ErorrItemStruct>? errors,
  }) : _errors = errors;

  // "errors" field.
  List<ErorrItemStruct>? _errors;
  List<ErorrItemStruct> get errors => _errors ?? const [];
  set errors(List<ErorrItemStruct>? val) => _errors = val;
  void updateErrors(Function(List<ErorrItemStruct>) updateFn) =>
      updateFn(_errors ??= []);
  bool hasErrors() => _errors != null;

  static ErorrsStruct fromMap(Map<String, dynamic> data) => ErorrsStruct(
        errors: getStructList(
          data['errors'],
          ErorrItemStruct.fromMap,
        ),
      );

  static ErorrsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ErorrsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'errors': _errors?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'errors': serializeParam(
          _errors,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static ErorrsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ErorrsStruct(
        errors: deserializeStructParam<ErorrItemStruct>(
          data['errors'],
          ParamType.DataStruct,
          true,
          structBuilder: ErorrItemStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ErorrsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ErorrsStruct && listEquality.equals(errors, other.errors);
  }

  @override
  int get hashCode => const ListEquality().hash([errors]);
}

ErorrsStruct createErorrsStruct() => ErorrsStruct();
