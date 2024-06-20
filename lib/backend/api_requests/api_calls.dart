import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';
import 'interceptors.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start GroupTemplate Group Code

class GroupTemplateGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
}

/// End GroupTemplate Group Code

/// Start ProcedurePublished Group Code

class ProcedurePublishedGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static ProcedurePublishedListCall procedurePublishedListCall =
      ProcedurePublishedListCall();
  static ProcedureTemplateUpdateLimitPublishedCall
      procedureTemplateUpdateLimitPublishedCall =
      ProcedureTemplateUpdateLimitPublishedCall();
  static ProcedurePublishedCall procedurePublishedCall =
      ProcedurePublishedCall();
}

class ProcedurePublishedListCall {
  Future<ApiCallResponse> call({
    String? filter = '{}',
    int? offset = 0,
    int? limit = 5000,
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedurePublishedGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'ProcedurePublishedList',
        apiUrl: '$baseUrl/items/workflows',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'fields':
              "steps.tasks.id, steps.tasks.name, steps.tasks.workflow_id, steps.tasks.published_count, steps.tasks.date_created, steps.number, steps.tasks.operations.operations_id.content, steps.tasks.operations.operations_id.files.directus_files_id.id, steps.tasks.operations.operations_id.result,id,name,steps.id,steps.tasks.user_created.first_name,steps.tasks.status, steps.tasks.created_user_id.first_name, steps.tasks.created_user_id.email,organization_id,steps.staffs.staffs_id.id,departments.departments_id.staffs.id,branch_id, steps.tasks.date_end,steps.departments.departments_id.staffs.id,steps.departments.departments_id.id,departments.departments_id.id,steps.tasks.created_staff_id.branch_id, steps.tasks.created_staff_id.department_id, steps.tasks.created_staff_id.user_id,steps.tasks.submit_staff_id.branch_id, steps.tasks.submit_staff_id.department_id,steps.tasks.submit_staff_id.id,steps.tasks.submit_staff_id.user_id.first_name",
          'filter': filter,
          'offset': offset,
          'limit': limit,
          'meta': "total_count,filter_count",
          'sort': "-date_created",
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class ProcedureTemplateUpdateLimitPublishedCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? limitPublished = 0,
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedurePublishedGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "limit_published": $limitPublished
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProcedureTemplateUpdateLimitPublished',
      apiUrl: '$baseUrl/items/workflows/$id',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProcedurePublishedCall {
  Future<ApiCallResponse> call({
    String? workflowId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedurePublishedGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "workflow_id": "$workflowId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProcedurePublished',
      apiUrl: '$baseUrl/flows/trigger/cb0b45cb-956a-410e-9f15-fd040a83a0e4',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End ProcedurePublished Group Code

/// Start Department Group Code

class DepartmentGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static GetDepartmentListCall getDepartmentListCall = GetDepartmentListCall();
  static PostdepartmentCall postdepartmentCall = PostdepartmentCall();
  static PathDepartmentCall pathDepartmentCall = PathDepartmentCall();
  static UpdateProgramsCall updateProgramsCall = UpdateProgramsCall();
  static ProgramSynchronizedCall programSynchronizedCall =
      ProgramSynchronizedCall();
}

class GetDepartmentListCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? limit = 5000,
    int? offset = 0,
    String? accessToken = '',
  }) async {
    final baseUrl = DepartmentGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'GetDepartmentList',
        apiUrl: '$baseUrl/items/departments',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'fields[]':
              "id, status, name, description, branch_id.id, branch_id.name, code,programs.programs_id.id, programs.programs_id.name, programs.programs_id.lessions.lessions_id.id, programs.programs_id.lessions.lessions_id.name,staffs.id, staffs.user_id.id, staffs.user_id.emaile,staffs.user_id.first_name,staffs.user_id.role,organization_id,programs.programs_id.status",
          'filter': filter,
          'sort': "-date_created",
          'limit': limit,
          'offset': offset,
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class PostdepartmentCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    String? branchId = '',
    String? code = '',
    dynamic programsIdJson,
    String? accessToken = '',
  }) async {
    final baseUrl = DepartmentGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final programsId = _serializeJson(programsIdJson, true);
    final ffApiRequestBody = '''
{
  "status": "published",
  "name": "$name",
  "description": "$description",
  "branch_id": "$branchId",
  "code": "$code",
  "programs": $programsId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Postdepartment',
      apiUrl: '$baseUrl/items/departments',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PathDepartmentCall {
  Future<ApiCallResponse> call({
    String? departmentId = '',
    String? name = '',
    String? description = '',
    String? branchId = '',
    String? code = '',
    dynamic programsIdJson,
    String? status = '',
    String? accessToken = '',
  }) async {
    final baseUrl = DepartmentGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final programsId = _serializeJson(programsIdJson, true);
    final ffApiRequestBody = '''
{
  "status": "$status",
  "name": "$name",
  "description": "$description",
  "branch_id": "$branchId",
  "code": "$code",
  "programs": $programsId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PathDepartment',
      apiUrl: '$baseUrl/items/departments/$departmentId',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateProgramsCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = DepartmentGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'UpdatePrograms',
      apiUrl: '$baseUrl/flows/trigger/d76ea3a4-88ff-4a81-b6c8-e6f8edc20652',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProgramSynchronizedCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = DepartmentGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'ProgramSynchronized',
      apiUrl: '$baseUrl/flows/trigger/b1888ea3-9709-4c01-821d-9573d1171060',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Department Group Code

/// Start UploadFile Group Code

class UploadFileGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static UploadFileCall uploadFileCall = UploadFileCall();
  static UploadListFileCall uploadListFileCall = UploadListFileCall();
}

class UploadFileCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? accessToken = '',
  }) async {
    final baseUrl = UploadFileGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'UploadFile',
      apiUrl: '$baseUrl/files',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadListFileCall {
  Future<ApiCallResponse> call({
    List<FFUploadedFile>? fileList,
    String? accessToken = '',
  }) async {
    final baseUrl = UploadFileGroup.getBaseUrl(
      accessToken: accessToken,
    );
    final file = fileList ?? [];

    return ApiManager.instance.makeApiCall(
      callName: 'UploadListFile',
      apiUrl: '$baseUrl/files',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End UploadFile Group Code

/// Start User Group Code

class UserGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static UserMeCall userMeCall = UserMeCall();
  static GetStaffIdCall getStaffIdCall = GetStaffIdCall();
  static GetListUserCall getListUserCall = GetListUserCall();
  static DeleteAccountCall deleteAccountCall = DeleteAccountCall();
}

class UserMeCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'UserMe',
      apiUrl: '$baseUrl/users/me',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetStaffIdCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
"user_id":"$userId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetStaffId',
      apiUrl: '$baseUrl/flows/trigger/414ee2de-1efe-4542-98d5-436eb0107ee0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetListUserCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetListUser',
      apiUrl: '$baseUrl/users',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields': "email",
        'limit': 5000,
        'offset': 0,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteAccountCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      accessToken: accessToken,
    );

    const ffApiRequestBody = '''
{
    "status": "archived"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteAccount',
      apiUrl: '$baseUrl/users/$userId',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End User Group Code

/// Start Authen Group Code

class AuthenGroup {
  static String getBaseUrl() => 'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static LoginCall loginCall = LoginCall();
  static RefreshTokenCall refreshTokenCall = RefreshTokenCall();
  static CreateOrganizationUserCall createOrganizationUserCall =
      CreateOrganizationUserCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = AuthenGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '$baseUrl/flows/trigger/104bce56-32bc-4140-a93d-5de3e5a46b39',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RefreshTokenCall {
  Future<ApiCallResponse> call({
    String? refreshToken = '',
  }) async {
    final baseUrl = AuthenGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "refresh_token": "$refreshToken",
  "mode": "json"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RefreshToken',
      apiUrl: '$baseUrl/auth/refresh',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateOrganizationUserCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
  }) async {
    final baseUrl = AuthenGroup.getBaseUrl();

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'CreateOrganizationUser',
      apiUrl: '$baseUrl/flows/trigger/c5d94aa6-ac37-4ece-bfc5-05503805ad8b',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Authen Group Code

/// Start Lesson Group Code

class LessonGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static GetLessonListCall getLessonListCall = GetLessonListCall();
  static GetLessionsOneCall getLessionsOneCall = GetLessionsOneCall();
  static EmployeeLessonListCall employeeLessonListCall =
      EmployeeLessonListCall();
  static PostCommentCall postCommentCall = PostCommentCall();
  static PostLessonCall postLessonCall = PostLessonCall();
  static PathLessonCall pathLessonCall = PathLessonCall();
  static DeleteCommentCall deleteCommentCall = DeleteCommentCall();
  static ProgramsLessionsCall programsLessionsCall = ProgramsLessionsCall();
  static PostHeartCall postHeartCall = PostHeartCall();
  static DeleteHeartCall deleteHeartCall = DeleteHeartCall();
  static UpdateStaffLessonStatusCall updateStaffLessonStatusCall =
      UpdateStaffLessonStatusCall();
  static UpdateLessonStatusMarketCall updateLessonStatusMarketCall =
      UpdateLessonStatusMarketCall();
  static UpdateStaffProgramStatusCall updateStaffProgramStatusCall =
      UpdateStaffProgramStatusCall();
}

class GetLessonListCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? limit = 5000,
    int? offset = 0,
    String? accessToken = '',
  }) async {
    final baseUrl = LessonGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'GetLessonList',
        apiUrl: '$baseUrl/items/lessions',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'fields[]':
              "user_created, file,file.id,file.type,duration_hours,comments.id, comments.comments_id.id, comments.comments_id.content,id, status, name, description, content, image_cover, video, date_created, date_updated,test_id,comments.comments_id.staff_id.id,comments.comments_id.staff_id,comments.comments_id.staff_id.user_id,comments.comments_id.staff_id.user_id.email,comments.comments_id.staff_id.user_id.first_name,comments.comments_id.staff_id.user_id.avatar,comments.comments_id.date_created,reacts.id, reacts.reacts_id.status,reacts.reacts_id.staff_id,file.filename_download,organization_id,programs.programs_id.id,programs.programs_id.name,estimate_in_day,programs.programs_id.departments.departments_id.id,programs.programs_id.departments.departments_id.name,user_created.first_name,user_created.id",
          'filter': filter,
          'limit': limit,
          'offset': offset,
          'sort': "-date_created",
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class GetLessionsOneCall {
  Future<ApiCallResponse> call({
    String? lessionsId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = LessonGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetLessionsOne',
      apiUrl: '$baseUrl/items/lessions/$lessionsId',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "id, status, name, description, content, image_cover, video, date_created, date_updated",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EmployeeLessonListCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? offset = 0,
    int? limit = 5000,
    String? accessToken = '',
  }) async {
    final baseUrl = LessonGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'EmployeeLessonList',
        apiUrl: '$baseUrl/items/staffs_lessions',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'fields[]':
              "lession_id.file.id,lession_id.file.type,id,status,progress,date_start,date_end,staff_id.id,staff_id.user_id.first_name,staff_id.user_id.last_name,lession_id.id,lession_id.name,lession_id.description,lession_id.content,lession_id.image_cover,lession_id.video,lession_id.date_updated,lession_id.comments.id,lession_id.comments.comments_id.id,lession_id.comments.comments_id.content,lession_id.status,lession_id.date_created,lession_id.test_id,lession_id.comments.comments_id.staff_id.user_id.avatar,lession_id.comments.comments_id.staff_id.user_id.first_name,lession_id.duration_hours,lession_id.comments.comments_id.date_created,lession_id.file.filename_download,lession_id.programs.programs_id.id,lession_id.programs.programs_id.name,lession_id.estimate_in_day,program_id.name, program_id.estimate_in_day,date_created, program_id.id",
          'filter': filter,
          'limit': limit,
          'offset': offset,
          'meta': "total_count,filter_count",
          'sort': "-date_created",
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class PostCommentCall {
  Future<ApiCallResponse> call({
    String? lessionId = '',
    String? content = '',
    String? staffId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = LessonGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "status": "published",
  "lession_id": "$lessionId",
  "content": "$content",
  "staff_id": "$staffId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostComment',
      apiUrl: '$baseUrl/flows/trigger/c9e1d3e3-cc5d-4b86-9f77-b2f561c7496a',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostLessonCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = LessonGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'PostLesson',
      apiUrl: '$baseUrl/items/lessions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PathLessonCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? idLesson = '',
    String? accessToken = '',
  }) async {
    final baseUrl = LessonGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'PathLesson',
      apiUrl: '$baseUrl/items/lessions/$idLesson',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteCommentCall {
  Future<ApiCallResponse> call({
    int? id,
    String? accessToken = '',
  }) async {
    final baseUrl = LessonGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DeleteComment',
      apiUrl: '$baseUrl/items/lessions_comments/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProgramsLessionsCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? accessToken = '',
  }) async {
    final baseUrl = LessonGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'ProgramsLessions',
      apiUrl: '$baseUrl/items/programs_lessions',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields[]':
            "programs_id.id, programs_id.name, lessions_id.id, lessions_id.name,lessions_id.status,lessions_id.name,lessions_id.description,lessions_id.content,lessions_id.image_cover,lessions_id.video,lessions_id.date_created,lessions_id.date_updated,lessions_id.duration_hours",
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostHeartCall {
  Future<ApiCallResponse> call({
    String? status = '',
    String? lessionId = '',
    String? staffId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = LessonGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "status": "$status",
  "lession_id": "$lessionId",
  "staff_id": "$staffId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postHeart',
      apiUrl: '$baseUrl/flows/trigger/b1e1fdf3-6656-4c9e-9c58-03feeee4ed7c',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteHeartCall {
  Future<ApiCallResponse> call({
    int? idHeart,
    String? accessToken = '',
  }) async {
    final baseUrl = LessonGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DeleteHeart',
      apiUrl: '$baseUrl/items/lessions_reacts/$idHeart',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateStaffLessonStatusCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? dateStart = '',
    String? accessToken = '',
  }) async {
    final baseUrl = LessonGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "status": "inprogress",
  "date_start": "$dateStart"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateStaffLessonStatus',
      apiUrl: '$baseUrl/items/staffs_lessions/$id',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateLessonStatusMarketCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? status = '',
    String? accessToken = '',
  }) async {
    final baseUrl = LessonGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "status": "$status"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateLessonStatusMarket',
      apiUrl: '$baseUrl/items/lessions/$id',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateStaffProgramStatusCall {
  Future<ApiCallResponse> call({
    String? staffId = '',
    String? programId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = LessonGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "staff_id": "$staffId",
  "program_id": "$programId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateStaffProgramStatus',
      apiUrl: '$baseUrl/flows/trigger/8c284328-1373-4da4-98f5-b3024d3e9861',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Lesson Group Code

/// Start StudyProgram Group Code

class StudyProgramGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static StudyProgramListCall studyProgramListCall = StudyProgramListCall();
  static StudyProgramOneCall studyProgramOneCall = StudyProgramOneCall();
  static StudyProgramGetOneCall studyProgramGetOneCall =
      StudyProgramGetOneCall();
  static StudyProgramCreateCall studyProgramCreateCall =
      StudyProgramCreateCall();
  static StudyProgramLessionsUpdateCall studyProgramLessionsUpdateCall =
      StudyProgramLessionsUpdateCall();
  static SynchronizedStaffLessonCall synchronizedStaffLessonCall =
      SynchronizedStaffLessonCall();
  static StaffsProgramsCall staffsProgramsCall = StaffsProgramsCall();
  static UpdateStudyProgramPriceCall updateStudyProgramPriceCall =
      UpdateStudyProgramPriceCall();
  static AddProgramMarketCall addProgramMarketCall = AddProgramMarketCall();
  static DeleteProgramCall deleteProgramCall = DeleteProgramCall();
  static StaffsProgramsPostCall staffsProgramsPostCall =
      StaffsProgramsPostCall();
  static CoppyStaffProgramsCall coppyStaffProgramsCall =
      CoppyStaffProgramsCall();
  static UpdateDepartmentSynchronizedCall updateDepartmentSynchronizedCall =
      UpdateDepartmentSynchronizedCall();
  static ReviewProgramCall reviewProgramCall = ReviewProgramCall();
}

class StudyProgramListCall {
  Future<ApiCallResponse> call({
    String? filter = '{}',
    int? offset = 0,
    int? limit = 5000,
    String? accessToken = '',
  }) async {
    final baseUrl = StudyProgramGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'StudyProgramList',
        apiUrl: '$baseUrl/items/programs',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'filter': filter,
          'fields':
              "user_created.first_name, user_created.id, category_id, domain_id, private, copyright_organization_id,template,date_create,estimate_in_day,organization_id,id, status, name, description, duration_hours, lessions.lessions_id.id, lessions.lessions_id.name,lessions.lessions_id.status,tests.tests_id.id, tests.tests_id.name,tests.tests_id.description,tests.tests_id.duration_minutes,tests.tests_id.name,lessions.lessions_id.date_created,lessions.lessions_id.image_cover,tests.date_created,departments.departments_id.id,departments.departments_id.name, image_cover, template, price, author_id, copyright_program_id, copyright_organization_id, version, limit_invite, invite_count,tests.tests_id.good_score,tests.tests_id.user_created.id, departments.departments_id.branch_id.id",
          'offset': offset,
          'limit': limit,
          'meta': "total_count,filter_count",
          'sort': "-date_created",
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class StudyProgramOneCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? offset = 0,
    int? limit = 5000,
    String? accessToken = '',
  }) async {
    final baseUrl = StudyProgramGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'StudyProgramOne',
      apiUrl: '$baseUrl/items/programs',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'filter': filter,
        'fields':
            "id, status, name, description, duration_hours, lessions.lessions_id.id, lessions.lessions_id.name,tests.tests_id.id, tests.tests_id.name,tests.tests_id.description,tests.tests_id.duration_minutes,tests.tests_id.name,lessions.lessions_id.date_created,lessions.lessions_id.image_cover,tests.date_created,departments.id, departments.departments_id.id",
        'offset': offset,
        'limit': limit,
        'meta': "total_count,filter_count",
        'sort': "-date_created",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StudyProgramGetOneCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accessToken = '',
  }) async {
    final baseUrl = StudyProgramGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'StudyProgramGetOne',
      apiUrl: '$baseUrl/items/programs/$id',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "lessions.id, lessions.lessions_id.id,  lessions.lessions_id.name, lessions.lessions_id.status,  lessions.lessions_id.description, lessions.lessions_id.content, lessions.lessions_id.duration_hours, lessions.lessions_id.estimate_in_day, lessions.lessions_id.image_cover, lessions.lessions_id.video, lessions.lessions_id.test_id, lessions.lessions_id.files, lessions.lessions_id.file",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StudyProgramCreateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = StudyProgramGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'StudyProgramCreate',
      apiUrl: '$baseUrl/items/programs',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StudyProgramLessionsUpdateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? id = '',
    String? accessToken = '',
  }) async {
    final baseUrl = StudyProgramGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'StudyProgramLessionsUpdate',
      apiUrl: '$baseUrl/items/programs/$id',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SynchronizedStaffLessonCall {
  Future<ApiCallResponse> call({
    String? programId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = StudyProgramGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "program_id": "$programId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SynchronizedStaffLesson',
      apiUrl: '$baseUrl/flows/trigger/b1888ea3-9709-4c01-821d-9573d1171060',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StaffsProgramsCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? offset = 0,
    int? limit = 5000,
    String? accessToken = '',
  }) async {
    final baseUrl = StudyProgramGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'StaffsPrograms',
        apiUrl: '$baseUrl/items/staffs_programs',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'fields[]':
              "id, status, date_created, staff_id, organization_id, progress, lession_done, lession_count, date_start, date_end, deadline,program_id.id, program_id.name, program_id.lessions.lessions_id,program_id.description,program_id.duration_hours,program_id.organization_id,program_id.estimate_in_day,program_id.date_create,program_id.lessions.lessions_id.id,program_id.lessions.lessions_id.status,program_id.lessions.lessions_id.name,program_id.lessions.lessions_id.description,program_id.lessions.lessions_id.content,program_id.lessions.lessions_id.image_cover,program_id.lessions.lessions_id.video,program_id.lessions.lessions_id.date_created,program_id.lessions.lessions_id.date_updated,program_id.lessions.lessions_id.duration_hours,program_id.lessions.lessions_id.organization_id,program_id.lessions.lessions_id.estimate_in_day,program_id.tests.tests_id.id,program_id.tests.tests_id.status,program_id.status,program_id.date_created,program_id.image_cover",
          'filter': filter,
          'limit': limit,
          'offset': offset,
          'sort': "-date_created",
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class UpdateStudyProgramPriceCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? price,
    String? authorId = '',
    int? version,
    String? category = '',
    String? domain = '',
    String? accessToken = '',
  }) async {
    final baseUrl = StudyProgramGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "price": $price,
  "author_id": "$authorId",
  "category_id": "$category",
  "domain_id": "$domain",
  "version": $version
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateStudyProgramPrice',
      apiUrl: '$baseUrl/items/programs/$id',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddProgramMarketCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? domainId = '',
    String? categoryId = '',
    String? fields = 'lessions.lessions_id.id,lessions.lessions_id.status',
    String? accessToken = '',
  }) async {
    final baseUrl = StudyProgramGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "program_id": "$id",
  "category_id": "$categoryId",
  "domain_id": "$domainId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddProgramMarket',
      apiUrl: '$baseUrl/flows/trigger/39a06a6d-e1f8-4271-85e8-5773579b0c2c',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteProgramCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accessToken = '',
  }) async {
    final baseUrl = StudyProgramGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DeleteProgram',
      apiUrl: '$baseUrl/items/programs/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StaffsProgramsPostCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = StudyProgramGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'staffsProgramsPost',
      apiUrl: '$baseUrl/items/staffs_programs',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CoppyStaffProgramsCall {
  Future<ApiCallResponse> call({
    String? programId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = StudyProgramGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "programs": [
    {
      "program_id": "$programId",
      "limit_invite": 0,
      "private": 0
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'coppyStaffPrograms',
      apiUrl: '$baseUrl/flows/trigger/80fe65e9-f22f-4c5a-9ee2-39b4c1ddc462',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateDepartmentSynchronizedCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = StudyProgramGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateDepartmentSynchronized',
      apiUrl: '$baseUrl/flows/trigger/0b48f433-e632-4eee-84b9-9651d207de98',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReviewProgramCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = StudyProgramGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'ReviewProgram',
      apiUrl: '$baseUrl/flows/trigger/0b09d278-b3b0-4ac4-b523-a965c570a059',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End StudyProgram Group Code

/// Start DoTest Group Code

class DoTestGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static StaffsTestsListCall staffsTestsListCall = StaffsTestsListCall();
  static StaffAnswerListCall staffAnswerListCall = StaffAnswerListCall();
  static CreateStaffTestCall createStaffTestCall = CreateStaffTestCall();
  static CreateStaffAnswerCall createStaffAnswerCall = CreateStaffAnswerCall();
  static CalculateTestScoresCall calculateTestScoresCall =
      CalculateTestScoresCall();
  static CreateStaffTestsCall createStaffTestsCall = CreateStaffTestsCall();
}

class StaffsTestsListCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? limit = 5000,
    int? offset = 0,
    String? accessToken = '',
  }) async {
    final baseUrl = DoTestGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'StaffsTestsList',
        apiUrl: '$baseUrl/items/staffs_tests',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'fields':
              "id,status,test_id.id,test_id.name,score,date_start,date_end,total_correct,total_incorrect,test_id.duration_minutes,date_created,percent_correct,test_id.good_score,lession_id.name, lession_id.id, lession_id.image_cover,test_id.description",
          'filter': filter,
          'sort': "-date_created",
          'limit': limit,
          'offset': offset,
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class StaffAnswerListCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? accessToken = '',
  }) async {
    final baseUrl = DoTestGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'StaffAnswerList',
      apiUrl: '$baseUrl/items/staffs_answers',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'filter': filter,
        'fields':
            "id, status, staff_id.id, staff_id.user_id.email, question_id.id, question_id.content, test_id.id, test_id.name, correct, answers.answers_id.id, answers.answers_id.content, answers.answers_id.correct, answer_content, answer_type,question_id.answers.answers_id.content,question_id.answers.answers_id.id,question_id.answers.answers_id.correct,question_id.answers.answers_id.id,question_id.answers.answers_id.content,question_id.answers.answers_id.correct",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateStaffTestCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = DoTestGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'CreateStaffTest',
      apiUrl: '$baseUrl/items/staffs_tests',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateStaffAnswerCall {
  Future<ApiCallResponse> call({
    dynamic requestJson,
    String? accessToken = '',
  }) async {
    final baseUrl = DoTestGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final request = _serializeJson(requestJson, true);
    final ffApiRequestBody = request;
    return ApiManager.instance.makeApiCall(
      callName: 'CreateStaffAnswer',
      apiUrl: '$baseUrl/items/staffs_answers',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CalculateTestScoresCall {
  Future<ApiCallResponse> call({
    String? staffTestId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = DoTestGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "staff_test_id": "$staffTestId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CalculateTestScores',
      apiUrl: '$baseUrl/flows/trigger/44b43c13-8b8e-4032-b528-ae3be7c52a7d',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateStaffTestsCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? fields =
        'id,test_id.id, test_id.name, test_id.description, test_id.duration_minutes, code',
    String? accessToken = '',
  }) async {
    final baseUrl = DoTestGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'CreateStaffTests',
      apiUrl: '$baseUrl/items/staffs_tests?fields=$fields',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End DoTest Group Code

/// Start Test Group Code

class TestGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static CreateTestCall createTestCall = CreateTestCall();
  static QuestionTestAddCall questionTestAddCall = QuestionTestAddCall();
  static TestListCall testListCall = TestListCall();
  static TestOneCall testOneCall = TestOneCall();
  static TestUpdateCall testUpdateCall = TestUpdateCall();
}

class CreateTestCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = TestGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'CreateTest',
      apiUrl: '$baseUrl/items/tests',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class QuestionTestAddCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = TestGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'QuestionTestAdd',
      apiUrl: '$baseUrl/items/tests_questions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TestListCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? offset = 0,
    int? limit = 5000,
    String? accessToken = '',
  }) async {
    final baseUrl = TestGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'TestList',
        apiUrl: '$baseUrl/items/tests',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'fields':
              "questions.id, questions.questions_id.answers.answers_id.id, questions.questions_id.answers.answers_id.content, questions.questions_id.answers.answers_id.correct,id, status, name, description, duration_minutes, questions.questions_id.id, questions.questions_id.content, questions.questions_id.status, questions.questions_id.content, questions.questions_id.answer_type, questions.questions_id.auto_correct,organization_id,good_score,name,user_created.first_name,name,user_created.id",
          'filter': filter,
          'limit': limit,
          'offset': offset,
          'sort': "-date_created",
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class TestOneCall {
  Future<ApiCallResponse> call({
    String? testsId = '',
    int? offset = 0,
    int? limit = 5000,
    String? accessToken = '',
  }) async {
    final baseUrl = TestGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'TestOne',
      apiUrl: '$baseUrl/items/tests/$testsId',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "id, status, name, description, duration_minutes, questions.questions_id.id, questions.questions_id.content, questions.questions_id.status, questions.questions_id.content, questions.questions_id.answer_type, questions.questions_id.auto_correct,questions.id, questions.questions_id.answers.answers_id.id, questions.questions_id.answers.answers_id.content, questions.questions_id.answers.answers_id.correct,good_score",
        'limit': limit,
        'offset': offset,
        'sort': "-date_created",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TestUpdateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? id = '',
    String? accessToken = '',
  }) async {
    final baseUrl = TestGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'TestUpdate',
      apiUrl: '$baseUrl/items/tests/$id',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Test Group Code

/// Start Question Group Code

class QuestionGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static QuestionListCall questionListCall = QuestionListCall();
  static QuestionListOneCall questionListOneCall = QuestionListOneCall();
  static QuestionCreateCall questionCreateCall = QuestionCreateCall();
  static QuestionUpdateCall questionUpdateCall = QuestionUpdateCall();
}

class QuestionListCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? limit = 5000,
    int? offset = 0,
    String? accessToken = '',
  }) async {
    final baseUrl = QuestionGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'questionList',
        apiUrl: '$baseUrl/items/questions',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'fields':
              "organization_id,id, status, content, answer_type, auto_correct, date_created, date_updated,answers.id, answers.answers_id.id, answers.answers_id.content, answers.answers_id.correct",
          'filter': filter,
          'limit': limit,
          'sort': "-date_created",
          'offset': offset,
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class QuestionListOneCall {
  Future<ApiCallResponse> call({
    String? questionId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = QuestionGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'questionListOne',
      apiUrl: '$baseUrl/items/questions/$questionId',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "id, status, content, answer_type, auto_correct, date_created, date_updated,answers.id, answers.answers_id.id, answers.answers_id.content, answers.answers_id.correct",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class QuestionCreateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = QuestionGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'questionCreate',
      apiUrl: '$baseUrl/flows/trigger/ab20019b-2912-40b4-8dcf-e3b010893396',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class QuestionUpdateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = QuestionGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'questionUpdate',
      apiUrl: '$baseUrl/flows/trigger/bd88689f-a050-44ac-b694-e2fe2c06e23c',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Question Group Code

/// Start ProcedureTemplate Group Code

class ProcedureTemplateGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static WorkflowsListCall workflowsListCall = WorkflowsListCall();
  static OperationsListCall operationsListCall = OperationsListCall();
  static OperationsCreateCall operationsCreateCall = OperationsCreateCall();
  static WorkflowsCreateCall workflowsCreateCall = WorkflowsCreateCall();
  static TasksCreateCall tasksCreateCall = TasksCreateCall();
  static TasksListCall tasksListCall = TasksListCall();
  static StepsCreateCall stepsCreateCall = StepsCreateCall();
  static StepsListCall stepsListCall = StepsListCall();
  static StepCreateWorkflowsCall stepCreateWorkflowsCall =
      StepCreateWorkflowsCall();
  static WorkflowsOneCall workflowsOneCall = WorkflowsOneCall();
  static WorkflowUpdateCall workflowUpdateCall = WorkflowUpdateCall();
  static StepUpdateCall stepUpdateCall = StepUpdateCall();
  static DeleteWorkflowsStepCall deleteWorkflowsStepCall =
      DeleteWorkflowsStepCall();
  static WorkflowCopyCall workflowCopyCall = WorkflowCopyCall();
  static WorkflowMarketCall workflowMarketCall = WorkflowMarketCall();
  static CreateWorkflowsAllCall createWorkflowsAllCall =
      CreateWorkflowsAllCall();
  static UpdateWorkflowsAllCall updateWorkflowsAllCall =
      UpdateWorkflowsAllCall();
}

class WorkflowsListCall {
  Future<ApiCallResponse> call({
    String? filter = '{}',
    int? offset = 0,
    int? limit = 5000,
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedureTemplateGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'workflowsList',
        apiUrl: '$baseUrl/items/workflows',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'fields':
              "type, domain_id,category_id,template,organization_id,id, status, name, description,user_created.id,user_created.first_name,steps.id,steps.number, steps.name, steps.operations, steps.operations.operations_id.id, steps.operations.operations_id.name,steps.staffs.id, steps.staffs.staffs_id.id, steps.staffs.staffs_id.user_id.email,steps.staffs.staffs_id.user_id.last_name,cron,steps.staffs.staffs_id",
          'filter': filter,
          'offset': offset,
          'limit': limit,
          'meta': "total_count,filter_count",
          'sort': "-date_created",
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class OperationsListCall {
  Future<ApiCallResponse> call({
    String? filter = '{}',
    int? offset = 0,
    int? limit = 5000,
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedureTemplateGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'operationsList',
      apiUrl: '$baseUrl/items/operations',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields': "id, status, name, description",
        'filter': filter,
        'offset': offset,
        'limit': limit,
        'meta': "total_count,filter_count",
        'sort': "-date_created",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OperationsCreateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedureTemplateGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'operationsCreate',
      apiUrl: '$baseUrl/items/operations',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WorkflowsCreateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedureTemplateGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'workflowsCreate',
      apiUrl: '$baseUrl/items/workflows',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TasksCreateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedureTemplateGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'tasksCreate',
      apiUrl: '$baseUrl/items/tasks',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TasksListCall {
  Future<ApiCallResponse> call({
    String? filter = '{}',
    int? offset = 0,
    int? limit = 5000,
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedureTemplateGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'tasksList',
      apiUrl: '$baseUrl/items/tasks',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "id,status,name,description,content,date_start, date_end,staffs.id, staffs.staffs_id.id, staffs.staffs_id.user_id.id, staffs.staffs_id.user_id.first_name",
        'filter': filter,
        'offset': offset,
        'limit': limit,
        'meta': "total_count,filter_count",
        'sort': "-date_created",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StepsCreateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedureTemplateGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'stepsCreate',
      apiUrl: '$baseUrl/items/steps',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StepsListCall {
  Future<ApiCallResponse> call({
    String? filter = '{}',
    int? offset = 0,
    int? limit = 5000,
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedureTemplateGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'stepsList',
      apiUrl: '$baseUrl/items/steps',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "id, status, name, description, execute_type, date_start, date_end, cron, workflow_id.id, workflow_id.name, number,task_id.id, task_id.name,staffs.id, staffs.staffs_id.id, staffs.staffs_id.user_id.id, staffs.staffs_id.user_id.email, staffs.staffs_id.user_id.first_name,  staffs.staffs_id.user_id.last_name",
        'filter': filter,
        'offset': offset,
        'limit': limit,
        'meta': "total_count,filter_count",
        'sort': "-date_created",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StepCreateWorkflowsCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedureTemplateGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'stepCreateWorkflows',
      apiUrl: '$baseUrl/flows/trigger/b1ba3372-66bb-44c9-baec-c8db8c7511fe',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WorkflowsOneCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedureTemplateGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'workflowsOne',
      apiUrl: '$baseUrl/items/workflows/$id',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "steps.departments.departments_id.name,steps.departments.departments_id.id,staffs.staffs_id.name,staffs.staffs_id.id,departments.departments_id.id,departments.departments_id.name,staffs.staffs_id.id,staffs.staffs_id.user_id.first_name,steps.staffs_alias,steps.id,id,description,name,cron,limit_published,remind,remind_in_second,estimate_in_second, deadline, cron,steps.name, steps.description, steps.date_start, steps.date_end, steps.execute_type, stepscron, steps.number, steps.status, steps.deadline, steps.estimate_in_second,steps.staffs.staffs_id.id,steps.tasks.id, steps.tasks.tasks_id.id, steps.tasks.tasks_id.name,steps.operations, steps.operations.operations_id.id, steps.operations.operations_id.name, steps.operations.operations_id.description, steps.operations.operations_id.action_type, steps.operations.operations_id.content, steps.operations.operations_id.date_start, steps.operations.operations_id.date_end,steps.operations.operations_id.staffs,steps.action_type,steps.staffs.staffs_id.user_id.first_name,remind_in_second,remind,published_count,limit_published,cron,estimate_in_second,steps.estimate_in_second,steps.time_operate,remind_2",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WorkflowUpdateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedureTemplateGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'workflowUpdate',
      apiUrl: '$baseUrl/flows/trigger/ebd094ca-ca35-4867-8850-4db6d65ee569',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StepUpdateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedureTemplateGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'stepUpdate',
      apiUrl: '$baseUrl/flows/trigger/ad1865a8-6611-4c50-8777-15a871f52524',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteWorkflowsStepCall {
  Future<ApiCallResponse> call({
    List<String>? stepIdList,
    String? workflowsId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedureTemplateGroup.getBaseUrl(
      accessToken: accessToken,
    );
    final stepId = _serializeList(stepIdList);

    final ffApiRequestBody = '''
{"steps":{"create":[],"update":[],"delete":$stepId}}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteWorkflowsStep',
      apiUrl: '$baseUrl/items/workflows/$workflowsId',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WorkflowCopyCall {
  Future<ApiCallResponse> call({
    String? workflowId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedureTemplateGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "workflow_id": "$workflowId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'workflowCopy',
      apiUrl: '$baseUrl/flows/trigger/409e0add-4b94-419e-814d-ac787810e2b8',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WorkflowMarketCall {
  Future<ApiCallResponse> call({
    String? workflowId = '',
    String? categoryId = '',
    String? domainId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedureTemplateGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "workflow_id": "$workflowId",
  "category_id": "$categoryId",
  "domain_id": "$domainId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'workflowMarket',
      apiUrl: '$baseUrl/flows/trigger/462eabbb-b130-4500-b4dd-32d4801cbdd0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateWorkflowsAllCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedureTemplateGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'CreateWorkflowsAll',
      apiUrl: '$baseUrl/flows/trigger/70307d27-4a51-4562-968c-a07441932397',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateWorkflowsAllCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = ProcedureTemplateGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateWorkflowsAll',
      apiUrl: '$baseUrl/flows/trigger/86f7cb77-4c2b-4afe-9b21-248d70a9385e',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End ProcedureTemplate Group Code

/// Start Branch Group Code

class BranchGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static BranchListCall branchListCall = BranchListCall();
  static BranchAddCall branchAddCall = BranchAddCall();
  static BranchUpdateCall branchUpdateCall = BranchUpdateCall();
}

class BranchListCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? limit = 5000,
    int? offset = 0,
    String? accessToken = '',
  }) async {
    final baseUrl = BranchGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'BranchList',
        apiUrl: '$baseUrl/items/branchs',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'filter': filter,
          'fields[]':
              "departments.staffs.id,id, status, name, description, code,departments.id, departments.name, departments.departments_id.id, departments.departments_id.name,staffs.id,staffs.name,staffs.title, staffs.user_id.first_name,organization_id.id,departments.status,departments.staffs.status",
          'offset': offset,
          'limit': limit,
          'sort': "-date_created",
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class BranchAddCall {
  Future<ApiCallResponse> call({
    dynamic requesDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = BranchGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requesData = _serializeJson(requesDataJson);
    final ffApiRequestBody = requesData;
    return ApiManager.instance.makeApiCall(
      callName: 'BranchAdd',
      apiUrl: '$baseUrl/items/branchs',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BranchUpdateCall {
  Future<ApiCallResponse> call({
    dynamic requesDataJson,
    String? id = '',
    String? accessToken = '',
  }) async {
    final baseUrl = BranchGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requesData = _serializeJson(requesDataJson);
    final ffApiRequestBody = requesData;
    return ApiManager.instance.makeApiCall(
      callName: 'BranchUpdate',
      apiUrl: '$baseUrl/items/branchs/$id',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Branch Group Code

/// Start Staff Group Code

class StaffGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static GetStaffListCall getStaffListCall = GetStaffListCall();
  static GetListStaffReportCall getListStaffReportCall =
      GetListStaffReportCall();
  static StaffGetOneCall staffGetOneCall = StaffGetOneCall();
  static CreateStaffCall createStaffCall = CreateStaffCall();
  static UpdateStaffCall updateStaffCall = UpdateStaffCall();
  static UpdateUserStaffCall updateUserStaffCall = UpdateUserStaffCall();
  static UpdatePasswordCall updatePasswordCall = UpdatePasswordCall();
  static CreateProgramStaffCall createProgramStaffCall =
      CreateProgramStaffCall();
}

class GetStaffListCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? limit = 5000,
    int? offset = 0,
    String? sort = '-date_created',
    String? accessToken = '',
  }) async {
    final baseUrl = StaffGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'GetStaffList',
        apiUrl: '$baseUrl/items/staffs',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'fields':
              "sort,id, title, user_id.role, status,organization_id.id,organization_id.name, branch_id.id, branch_id.name, department_id.id, department_id.name, cccd, gender, phone, dob, user_id.id, user_id.email, user_id.first_name, user_id.last_name, user_id.status, user_id.avatar,staff_lessions.id,staff_lessions.status,staff_tests.id,staff_tests.status,tasks.tasks_id.status,staff_tests.percent_correct",
          'filter': filter,
          'sort': sort,
          'limit': limit,
          'offset': offset,
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class GetListStaffReportCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? limit = 5000,
    int? offset = 0,
    String? sort = '-date_created',
    String? accessToken = '',
  }) async {
    final baseUrl = StaffGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'GetListStaffReport',
        apiUrl: '$baseUrl/items/staffs',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'fields':
              "sort,id, title, user_id.role, status,organization_id.id,organization_id.name, branch_id.id, branch_id.name, department_id.id, department_id.name, cccd, gender, phone, dob, user_id.id, user_id.email, user_id.first_name, user_id.last_name, user_id.status, user_id.avatar,staff_lessions.id,staff_lessions.status,staff_tests.id,staff_tests.status,staff_tests.percent_correct,tasks.tasks_id.id,tasks.tasks_id.name,tasks.tasks_id.status,tasks.tasks_id.description,tasks.tasks_id.content,tasks.tasks_id.date_start,tasks.tasks_id.date_end,tasks.tasks_id.deadline,tasks.tasks_id.estimate_in_second,tasks.tasks_id.number,tasks.tasks_id.published_count,tasks.tasks_id.execute_type,tasks.tasks_id.action_type,tasks.tasks_id.current,tasks.tasks_id.date_created,tasks.tasks_id.workflow_id.name,tasks.tasks_id.workflow_id.id,tasks.tasks_id.workflow_id.organization_id",
          'filter': filter,
          'sort': sort,
          'limit': limit,
          'offset': offset,
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class StaffGetOneCall {
  Future<ApiCallResponse> call({
    String? staffId = '',
    String? filter = '',
    String? accessToken = '',
  }) async {
    final baseUrl = StaffGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'StaffGetOne',
      apiUrl: '$baseUrl/items/staffs/$staffId',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "staff_programs.program_id, staff_programs.status, id, title, user_id.role, status, branch_id.id, branch_id.name, department_id.id, department_id.name, cccd, gender, phone, dob, user_id.id, user_id.email, user_id.first_name, user_id.last_name, user_id.status, user_id.avatar,tasks.id, tasks.tasks_id.id, tasks.tasks_id.name, tasks.tasks_id.number, tasks.tasks_id.status, tasks.tasks_id.description, tasks.tasks_id.step_id, tasks.tasks_id.workflow_id, tasks.tasks_id.current,skills.id, skills.skills_id.id, skills.skills_id.name,current_step_id.id, current_step_id.name,tasks.tasks_id.operations.id, tasks.tasks_id.operations.operations_id.name, tasks.tasks_id.operations.operations_id.content, tasks.tasks_id.operations.operations_id.description, tasks.tasks_id.operations.operations_id.result, tasks.tasks_id.operations.operations_id.files,staff_lessions.id,staff_lessions.status,staff_tests.id,staff_tests.status,tasks.tasks_id.status,staff_tests.percent_correct,date_created",
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateStaffCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = StaffGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'CreateStaff',
      apiUrl: '$baseUrl/flows/trigger/3481e773-dacc-466a-b35a-fcff84464e87',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateStaffCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? id = '',
    String? accessToken = '',
  }) async {
    final baseUrl = StaffGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateStaff',
      apiUrl: '$baseUrl/users/$id',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserStaffCall {
  Future<ApiCallResponse> call({
    String? staffId = '',
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = StaffGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateUserStaff',
      apiUrl: '$baseUrl/items/staffs/$staffId',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdatePasswordCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = StaffGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'UpdatePassword',
      apiUrl: '$baseUrl/flows/trigger/a721cfaf-8453-4f0c-aff1-6839e9c8ddb1',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateProgramStaffCall {
  Future<ApiCallResponse> call({
    String? staffId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = StaffGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "staff_ids": [
    "$staffId"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateProgramStaff',
      apiUrl: '$baseUrl/flows/trigger/03cdb683-356a-46f0-be36-2893888d0263',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Staff Group Code

/// Start Organization Group Code

class OrganizationGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static GetOneOrganizationCall getOneOrganizationCall =
      GetOneOrganizationCall();
  static UpdateOrganizationCall updateOrganizationCall =
      UpdateOrganizationCall();
  static GetOrganizationCall getOrganizationCall = GetOrganizationCall();
}

class GetOneOrganizationCall {
  Future<ApiCallResponse> call({
    String? organizationId = '',
    int? limit = 5000,
    int? offset = 0,
    String? accessToken = '',
  }) async {
    final baseUrl = OrganizationGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetOneOrganization',
      apiUrl: '$baseUrl/items/organizations/$organizationId',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "id, status, name, description, code,hotline,avatar,logo,address,video,image,files.id,files.directus_files_id,files.directus_files_id.id,branchs.id, branchs.name,branchs.branchs_id.departments.departments_id.id, branchs.branchs_id.departments.departments_id.name,staffs.id, staffs.user_id.id, staffs.user_id.email",
        'limit': limit,
        'offset': offset,
        'sort': "-date_created",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateOrganizationCall {
  Future<ApiCallResponse> call({
    String? organizationId = '',
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = OrganizationGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateOrganization',
      apiUrl: '$baseUrl/items/organizations/$organizationId',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetOrganizationCall {
  Future<ApiCallResponse> call({
    String? organizationId = '',
    int? limit = 5000,
    int? offset = 0,
    String? accessToken = '',
  }) async {
    final baseUrl = OrganizationGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetOrganization',
      apiUrl: '$baseUrl/items/organizations/$organizationId',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "id, status, name, description, code,hotline,avatar,description,logo,video,address,image,branchs.departments.id, branchs.departments.name,staffs.id, staffs.user_id.id, staffs.user_id.email,id, status, name, description, code,branchs.id, branchs.name, staffs.user_id.role, staffs.user_id.first_name,staffs.user_id.avatar,files,files.directus_files_id,files.directus_files_id.id,staffs.user_id.title, branchs.title,branchs.status,branchs.departments.status,staffs.user_id.status,staffs.status",
        'limit': limit,
        'sort': "-date_created",
        'offset': offset,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Organization Group Code

/// Start Task Group Code

class TaskGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static GetListTaskCall getListTaskCall = GetListTaskCall();
  static GetNumberTaskCall getNumberTaskCall = GetNumberTaskCall();
  static UpdateOperationCall updateOperationCall = UpdateOperationCall();
  static ConfirmOperationCall confirmOperationCall = ConfirmOperationCall();
  static ReceiveTaskCall receiveTaskCall = ReceiveTaskCall();
}

class GetListTaskCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? limit = 20,
    int? offset = 0,
    String? sort = '',
    String? meta = '',
    String? accessToken = '',
  }) async {
    final baseUrl = TaskGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'GetListTask',
        apiUrl: '$baseUrl/items/tasks',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'fields':
              "id, status, name, description, content, date_start, date_end, deadline, estimate_in_second, workflow_id.id,workflow_id.name, number, published_count, step_id, execute_type, action_type, current,staffs.id, staffs.staffs_id.id, staffs.staffs_id.user_id.id, staffs.staffs_id.user_id.first_name,operations.id, operations.operations_id.id, operations.operations_id.name, operations.operations_id.date_start, operations.operations_id.date_end, operations.operations_id.deadline, operations.operations_id.estimate_in_second, operations.operations_id.operation_id,operations.operations_id.action_type, operations.operations_id.step_id,operations.operations_id.content, operations.operations_id.result, operations.operations_id.staffs.id, operations.operations_id.staffs.staffs_id.id,  operations.operations_id.staffs.staffs_id.user_id.email,operations.operations_id.status,staffs.staffs_id.department_id.name,step_id.id,step_id.name,step_id.number, operations.operations_id.files.directus_files_id.id,operations.operations_id.files.directus_files_id.type,operations.operations_id.files.directus_files_id.filename_download,operations.operations_id.files.directus_files_id.id,operations.operations_id.files.directus_files_id.type,operations.operations_id.date_updated,workflow_id.name,staffs.staffs_id.user_id.avatar, organization_id.id, workflow_id.organization_id,submit_staff_id.id, submit_staff_id.user_id.first_name,submit_staff_id.user_id.avatar,submit_staff_id.user_id.id,submit_staff_id.branch_id,submit_staff_id.department_id,created_user_id.first_name, date_created,time_operate",
          'filter': filter,
          'sort': sort,
          'limit': limit,
          'offset': offset,
          'meta': meta,
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class GetNumberTaskCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? meta = 'filter_count',
    String? fields = 'id',
    String? accessToken = '',
  }) async {
    final baseUrl = TaskGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'GetNumberTask',
        apiUrl: '$baseUrl/items/tasks',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'filter': filter,
          'meta': meta,
          'fields': fields,
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class UpdateOperationCall {
  Future<ApiCallResponse> call({
    String? operationId = '',
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = TaskGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateOperation',
      apiUrl: '$baseUrl/items/operations/$operationId',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ConfirmOperationCall {
  Future<ApiCallResponse> call({
    String? taskId = '',
    String? staffId = '',
    String? submitType = '',
    String? accessToken = '',
  }) async {
    final baseUrl = TaskGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "task_id": "$taskId",
  "staff_id": "$staffId",
  "submit_type": "$submitType"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ConfirmOperation',
      apiUrl: '$baseUrl/flows/trigger/f3371d44-ab81-45f4-97dd-d616ddbc2a82',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReceiveTaskCall {
  Future<ApiCallResponse> call({
    String? staffId = '',
    String? workflowId = '',
    int? publishedCount,
    String? accessToken = '',
  }) async {
    final baseUrl = TaskGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "staff_id": "$staffId",
  "workflow_id": "$workflowId",
  "published_count": $publishedCount
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ReceiveTask',
      apiUrl: '$baseUrl/flows/trigger/cb967d02-d828-4896-85cf-f2340f9b3fb2',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Task Group Code

/// Start Operation Group Code

class OperationGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static OperationListCall operationListCall = OperationListCall();
  static OperationAddCall operationAddCall = OperationAddCall();
  static OperationsUpdateCall operationsUpdateCall = OperationsUpdateCall();
}

class OperationListCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? limit = 5000,
    int? offset = 0,
    String? accessToken = '',
  }) async {
    final baseUrl = OperationGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'OperationList',
        apiUrl: '$baseUrl/items/operations',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'fields':
              "id, status, name, description, content, date_start, date_end, deadline, estimate_in_second, operation_id, step_id, action_type, execute_id,staffs.staffs_id.id, staffs.staffs_id.user_id.email,files, files.directus_files_id.id, result,settings.id, settings.settings_id.id, settings.settings_id.name, settings.settings_id.type, settings.settings_id.key, settings.settings_id.value, settings.settings_id.description,configurations.id, configurations.configurations_id.id, configurations.configurations_id.name, configurations.configurations_id.description,organization_id,user_created,date_created,flow_id,user_created.first_name",
          'filter': filter,
          'sort': "-date_created",
          'total_count': 5000,
          'limit': limit,
          'offset': offset,
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class OperationAddCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = OperationGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'OperationAdd',
      apiUrl: '$baseUrl/items/operations',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OperationsUpdateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? operationId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = OperationGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'OperationsUpdate',
      apiUrl: '$baseUrl/items/operations/$operationId',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Operation Group Code

/// Start Categories Group Code

class CategoriesGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static GetCategoriesListCall getCategoriesListCall = GetCategoriesListCall();
}

class GetCategoriesListCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = CategoriesGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetCategoriesList',
      apiUrl: '$baseUrl/items/categories',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Categories Group Code

/// Start Domain Group Code

class DomainGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static GetDomainsListCall getDomainsListCall = GetDomainsListCall();
}

class GetDomainsListCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = DomainGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetDomainsList',
      apiUrl: '$baseUrl/items/domains',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Domain Group Code

/// Start GroupMarketLesson Group Code

class GroupMarketLessonGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static GetListMarketLessonCall getListMarketLessonCall =
      GetListMarketLessonCall();
  static GetOneProgramsCall getOneProgramsCall = GetOneProgramsCall();
  static InviteStaffCall inviteStaffCall = InviteStaffCall();
}

class GetListMarketLessonCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? offset = 0,
    int? limit = 5000,
    String? accessToken = '',
  }) async {
    final baseUrl = GroupMarketLessonGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'GetListMarketLesson',
        apiUrl: '$baseUrl/items/programs',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'fields[]':
              "date_create,estimate_in_day,organization_id,id, status, name, description, duration_hours, lessions.lessions_id.id, lessions.lessions_id.name,tests.tests_id.id, tests.tests_id.name,tests.tests_id.description,tests.tests_id.duration_minutes,tests.tests_id.name,lessions.lessions_id.date_created,lessions.lessions_id.image_cover,tests.date_created,departments.departments_id,template,domain_id,category_id,author_id,price,author_id.id,author_id.status,author_id.alias,author_id.description,author_id.domains.domains_id.id,author_id.domains.domains_id.name,domain_id.name, domain_id.id,image_cover, order_count, reacts.id, reacts.reacts_id.id, reacts.reacts_id.staff_id, reacts.reacts_id.status,category_id.name,category_id.id,author_id.avatar,lessions.lessions_id.status",
          'filter': filter,
          'limit': limit,
          'offset': offset,
          'sort': "-date_created",
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class GetOneProgramsCall {
  Future<ApiCallResponse> call({
    String? idPrograms = '',
    int? limit = 5000,
    int? offset = 0,
    String? filter = '',
    String? accessToken = '',
  }) async {
    final baseUrl = GroupMarketLessonGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetOnePrograms',
      apiUrl: '$baseUrl/items/programs/$idPrograms',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields[]':
            "private, date_create,estimate_in_day,organization_id,id, status, name, description, duration_hours, lessions.lessions_id.id, lessions.lessions_id.name,tests.tests_id.id, tests.tests_id.name,tests.tests_id.description,tests.tests_id.duration_minutes,tests.tests_id.name,lessions.lessions_id.date_created,lessions.lessions_id.image_cover,tests.date_created,departments.departments_id,template,domain_id,category_id,author_id,price,author_id.id,author_id.status,author_id.alias,author_id.description,author_id.domains.domains_id.id,author_id.domains.domains_id.name,domain_id.name, domain_id.id,image_cover, order_count, reacts.id, reacts.reacts_id.id, reacts.reacts_id.staff_id, reacts.reacts_id.status,category_id.name,category_id.id,author_id.avatar, limit_invite, invite_count,lessions.lessions_id.status, author_id.organization_id",
        'offset': offset,
        'limit': limit,
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InviteStaffCall {
  Future<ApiCallResponse> call({
    String? staffId = '',
    String? programId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = GroupMarketLessonGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "staff_id": "$staffId",
  "program_id": "$programId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'InviteStaff',
      apiUrl: '$baseUrl/flows/trigger/b86eacb0-d17b-42aa-b401-82375d97f2b3',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End GroupMarketLesson Group Code

/// Start GroupAuthors Group Code

class GroupAuthorsGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static ListAuthorsCall listAuthorsCall = ListAuthorsCall();
  static GetOneAuthorsCall getOneAuthorsCall = GetOneAuthorsCall();
  static ListAthorsSortCall listAthorsSortCall = ListAthorsSortCall();
  static AuthorsSignUpCall authorsSignUpCall = AuthorsSignUpCall();
  static AuthorsUpdateCall authorsUpdateCall = AuthorsUpdateCall();
}

class ListAuthorsCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? limit = 5000,
    int? offset = 0,
    String? sort = '-date_created',
    String? accessToken = '',
  }) async {
    final baseUrl = GroupAuthorsGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'ListAuthors',
        apiUrl: '$baseUrl/items/authors',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'filter': filter,
          'fields[]':
              "id,status,sort,user_created,date_created,user_updated,date_updated,staff_id,alias,description,organization_id,domains.domains_id.name,domains.domains_id.id,avatar, order_count,domains.domains_id.image_cover",
          'offset': offset,
          'limit': limit,
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class GetOneAuthorsCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accessToken = '',
  }) async {
    final baseUrl = GroupAuthorsGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetOneAuthors',
      apiUrl: '$baseUrl/items/authors/$id',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "id,status,sort,user_created,date_created,user_updated,date_updated,staff_id,alias,description,organization_id,domains.domains_id.name,domains.domains_id.id,avatar, order_count, domains.id, domains.domains_id.image_cover",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListAthorsSortCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? limit = 5000,
    int? offset = 0,
    String? accessToken = '',
  }) async {
    final baseUrl = GroupAuthorsGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'ListAthorsSort',
      apiUrl: '$baseUrl/items/authors',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'filter': filter,
        'fields[]':
            "id,status,sort,user_created,date_created,user_updated,date_updated,staff_id,alias,description,organization_id,domains.domains_id.name,domains.domains_id.id,avatar, order_count,domains.domains_id.image_cover",
        'offset': offset,
        'limit': limit,
        'sort': "-order_count",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AuthorsSignUpCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = GroupAuthorsGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'AuthorsSignUp',
      apiUrl: '$baseUrl/items/authors',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AuthorsUpdateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? id = '',
    String? accessToken = '',
  }) async {
    final baseUrl = GroupAuthorsGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'AuthorsUpdate',
      apiUrl: '$baseUrl/items/authors/$id',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End GroupAuthors Group Code

/// Start GetDomains Group Code

class GetDomainsGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static GetDomainsCall getDomainsCall = GetDomainsCall();
}

class GetDomainsCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? limit = 5000,
    int? offset = 0,
    String? accessToken = '',
  }) async {
    final baseUrl = GetDomainsGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'GetDomains',
        apiUrl: '$baseUrl/items/domains',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'filter': filter,
          'limit': limit,
          'offset': offset,
          'fields[]':
              "image_cover,id,status,user_created,date_created,user_updated,date_updated,name,description,sort",
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

/// End GetDomains Group Code

/// Start Order Group Code

class OrderGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static GetListOrderCall getListOrderCall = GetListOrderCall();
  static GetOneOrderCall getOneOrderCall = GetOneOrderCall();
  static CreateOrderCall createOrderCall = CreateOrderCall();
  static UpdateOrderCall updateOrderCall = UpdateOrderCall();
  static QrCodeCall qrCodeCall = QrCodeCall();
  static OrderCompletedCall orderCompletedCall = OrderCompletedCall();
  static CheckTransferCall checkTransferCall = CheckTransferCall();
}

class GetListOrderCall {
  Future<ApiCallResponse> call({
    int? limit = 5000,
    int? offset = 0,
    String? filter = '',
    String? sort = '',
    String? accessToken = '',
  }) async {
    final baseUrl = OrderGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'GetListOrder',
        apiUrl: '$baseUrl/items/program_orders',
        callType: ApiCallType.GET,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        params: {
          'limit': limit,
          'offset': offset,
          'fields':
              " id, status, date_created, date_updated, code, description, organization_id, total_item, total_price, program_order_items.id, program_order_items.description, program_order_items.price, program_order_items.total_item, program_order_items.total_price, program_order_items.status, program_order_items.program_id.id, program_order_items.program_id.name, program_order_items.program_id.author_id.id, program_order_items.program_id.author_id.alias, program_order_items.program_id.tags.tags_id.name, customer_id.id, customer_id.user_id.email,program_order_items.program_id.lessions,program_order_items.program_id.image_cover,program_order_items.program_id.price,private",
          'filter': filter,
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    CheckTokenCallAPI(),
  ];
}

class GetOneOrderCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accessToken = '',
  }) async {
    final baseUrl = OrderGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetOneOrder',
      apiUrl: '$baseUrl/items/program_orders/$id',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            " id, status, date_created, date_updated, code, description, organization_id, total_item, total_price, program_order_items.id, program_order_items.description, program_order_items.price, program_order_items.total_item, program_order_items.total_price, program_order_items.status, program_order_items.program_id.id, program_order_items.program_id.name, program_order_items.program_id.author_id.id, program_order_items.program_id.author_id.alias, program_order_items.program_id.tags.tags_id.name, customer_id.id, customer_id.user_id.email,program_order_items.program_id.lessions,program_order_items.program_id.image_cover,program_order_items.program_id.price,private",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateOrderCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = OrderGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'CreateOrder',
      apiUrl: '$baseUrl/flows/trigger/cc1419dd-4f67-4049-8d30-8e26f7d715b0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateOrderCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = OrderGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateOrder',
      apiUrl: '$baseUrl/flows/trigger/7ac31b41-de6b-4d2a-91ce-e6ff18ee6c46',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class QrCodeCall {
  Future<ApiCallResponse> call({
    String? orderId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = OrderGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "program_order_id": "$orderId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'QrCode',
      apiUrl: '$baseUrl/flows/trigger/cfe5b9a4-1967-4cd3-9a1a-41aea2a76df4',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OrderCompletedCall {
  Future<ApiCallResponse> call({
    String? orderId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = OrderGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'OrderCompleted',
      apiUrl: '$baseUrl/flows/trigger/3b9cc77a-ddde-4098-a81f-b102f4daa429',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckTransferCall {
  Future<ApiCallResponse> call({
    String? value = '',
    String? accessToken = '',
  }) async {
    final baseUrl = OrderGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "type": 0,
  "value": "$value"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CheckTransfer',
      apiUrl: '$baseUrl/flows/trigger/d6cb057b-3036-4714-b0a0-c2cd21e3a739',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Order Group Code

/// Start STHLoginAcounts Group Code

class STHLoginAcountsGroup {
  static String getBaseUrl() => 'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static UpdateBiometricVerificationCall updateBiometricVerificationCall =
      UpdateBiometricVerificationCall();
  static LoginBiometricVerificationCall loginBiometricVerificationCall =
      LoginBiometricVerificationCall();
}

class UpdateBiometricVerificationCall {
  Future<ApiCallResponse> call({
    dynamic dataJson,
  }) async {
    final baseUrl = STHLoginAcountsGroup.getBaseUrl();

    final data = _serializeJson(dataJson);
    final ffApiRequestBody = data;
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateBiometricVerification',
      apiUrl: '$baseUrl/flows/trigger/a5385417-9c38-406f-8ce3-5b669409c3e6',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LoginBiometricVerificationCall {
  Future<ApiCallResponse> call({
    dynamic dataJson,
  }) async {
    final baseUrl = STHLoginAcountsGroup.getBaseUrl();

    final data = _serializeJson(dataJson);
    final ffApiRequestBody = data;
    return ApiManager.instance.makeApiCall(
      callName: 'LoginBiometricVerification',
      apiUrl: '$baseUrl/flows/trigger/54e3a167-dcee-4d34-8de5-96afa42c11fe',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End STHLoginAcounts Group Code

/// Start SettingAcount Group Code

class SettingAcountGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static UpdateBiometricVerificationCopyCall
      updateBiometricVerificationCopyCall =
      UpdateBiometricVerificationCopyCall();
  static LoginBiometricVerificationCopyCall loginBiometricVerificationCopyCall =
      LoginBiometricVerificationCopyCall();
}

class UpdateBiometricVerificationCopyCall {
  Future<ApiCallResponse> call({
    dynamic dataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = SettingAcountGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final data = _serializeJson(dataJson);
    final ffApiRequestBody = data;
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateBiometricVerification Copy',
      apiUrl: '$baseUrl/flows/trigger/a5385417-9c38-406f-8ce3-5b669409c3e6',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LoginBiometricVerificationCopyCall {
  Future<ApiCallResponse> call({
    dynamic dataJson,
    String? accessToken = '',
  }) async {
    final baseUrl = SettingAcountGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final data = _serializeJson(dataJson);
    final ffApiRequestBody = data;
    return ApiManager.instance.makeApiCall(
      callName: 'LoginBiometricVerification Copy',
      apiUrl: '$baseUrl/flows/trigger/54e3a167-dcee-4d34-8de5-96afa42c11fe',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End SettingAcount Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
