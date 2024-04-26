// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProcedurePublishedStepTaskStruct extends BaseStruct {
  ProcedurePublishedStepTaskStruct({
    String? id,
    int? publishedCount,
    String? dateCreated,
    ProcedurePublishedUserCreatedStruct? userCreated,
    String? status,
    ProcedurePublishedUserCreatedIdStruct? createdUserId,
    String? dateEnd,
  })  : _id = id,
        _publishedCount = publishedCount,
        _dateCreated = dateCreated,
        _userCreated = userCreated,
        _status = status,
        _createdUserId = createdUserId,
        _dateEnd = dateEnd;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "published_count" field.
  int? _publishedCount;
  int get publishedCount => _publishedCount ?? 0;
  set publishedCount(int? val) => _publishedCount = val;
  void incrementPublishedCount(int amount) =>
      _publishedCount = publishedCount + amount;
  bool hasPublishedCount() => _publishedCount != null;

  // "date_created" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;
  bool hasDateCreated() => _dateCreated != null;

  // "user_created" field.
  ProcedurePublishedUserCreatedStruct? _userCreated;
  ProcedurePublishedUserCreatedStruct get userCreated =>
      _userCreated ?? ProcedurePublishedUserCreatedStruct();
  set userCreated(ProcedurePublishedUserCreatedStruct? val) =>
      _userCreated = val;
  void updateUserCreated(
          Function(ProcedurePublishedUserCreatedStruct) updateFn) =>
      updateFn(_userCreated ??= ProcedurePublishedUserCreatedStruct());
  bool hasUserCreated() => _userCreated != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "created_user_id" field.
  ProcedurePublishedUserCreatedIdStruct? _createdUserId;
  ProcedurePublishedUserCreatedIdStruct get createdUserId =>
      _createdUserId ?? ProcedurePublishedUserCreatedIdStruct();
  set createdUserId(ProcedurePublishedUserCreatedIdStruct? val) =>
      _createdUserId = val;
  void updateCreatedUserId(
          Function(ProcedurePublishedUserCreatedIdStruct) updateFn) =>
      updateFn(_createdUserId ??= ProcedurePublishedUserCreatedIdStruct());
  bool hasCreatedUserId() => _createdUserId != null;

  // "date_end" field.
  String? _dateEnd;
  String get dateEnd => _dateEnd ?? '';
  set dateEnd(String? val) => _dateEnd = val;
  bool hasDateEnd() => _dateEnd != null;

  static ProcedurePublishedStepTaskStruct fromMap(Map<String, dynamic> data) =>
      ProcedurePublishedStepTaskStruct(
        id: data['id'] as String?,
        publishedCount: castToType<int>(data['published_count']),
        dateCreated: data['date_created'] as String?,
        userCreated: ProcedurePublishedUserCreatedStruct.maybeFromMap(
            data['user_created']),
        status: data['status'] as String?,
        createdUserId: ProcedurePublishedUserCreatedIdStruct.maybeFromMap(
            data['created_user_id']),
        dateEnd: data['date_end'] as String?,
      );

  static ProcedurePublishedStepTaskStruct? maybeFromMap(dynamic data) => data
          is Map
      ? ProcedurePublishedStepTaskStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'published_count': _publishedCount,
        'date_created': _dateCreated,
        'user_created': _userCreated?.toMap(),
        'status': _status,
        'created_user_id': _createdUserId?.toMap(),
        'date_end': _dateEnd,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'published_count': serializeParam(
          _publishedCount,
          ParamType.int,
        ),
        'date_created': serializeParam(
          _dateCreated,
          ParamType.String,
        ),
        'user_created': serializeParam(
          _userCreated,
          ParamType.DataStruct,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'created_user_id': serializeParam(
          _createdUserId,
          ParamType.DataStruct,
        ),
        'date_end': serializeParam(
          _dateEnd,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProcedurePublishedStepTaskStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProcedurePublishedStepTaskStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        publishedCount: deserializeParam(
          data['published_count'],
          ParamType.int,
          false,
        ),
        dateCreated: deserializeParam(
          data['date_created'],
          ParamType.String,
          false,
        ),
        userCreated: deserializeStructParam(
          data['user_created'],
          ParamType.DataStruct,
          false,
          structBuilder:
              ProcedurePublishedUserCreatedStruct.fromSerializableMap,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        createdUserId: deserializeStructParam(
          data['created_user_id'],
          ParamType.DataStruct,
          false,
          structBuilder:
              ProcedurePublishedUserCreatedIdStruct.fromSerializableMap,
        ),
        dateEnd: deserializeParam(
          data['date_end'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProcedurePublishedStepTaskStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProcedurePublishedStepTaskStruct &&
        id == other.id &&
        publishedCount == other.publishedCount &&
        dateCreated == other.dateCreated &&
        userCreated == other.userCreated &&
        status == other.status &&
        createdUserId == other.createdUserId &&
        dateEnd == other.dateEnd;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        publishedCount,
        dateCreated,
        userCreated,
        status,
        createdUserId,
        dateEnd
      ]);
}

ProcedurePublishedStepTaskStruct createProcedurePublishedStepTaskStruct({
  String? id,
  int? publishedCount,
  String? dateCreated,
  ProcedurePublishedUserCreatedStruct? userCreated,
  String? status,
  ProcedurePublishedUserCreatedIdStruct? createdUserId,
  String? dateEnd,
}) =>
    ProcedurePublishedStepTaskStruct(
      id: id,
      publishedCount: publishedCount,
      dateCreated: dateCreated,
      userCreated: userCreated ?? ProcedurePublishedUserCreatedStruct(),
      status: status,
      createdUserId: createdUserId ?? ProcedurePublishedUserCreatedIdStruct(),
      dateEnd: dateEnd,
    );
