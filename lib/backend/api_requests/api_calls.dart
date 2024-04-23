import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start GroupTemplate Group Code

class GroupTemplateGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
}

/// End GroupTemplate Group Code

/// Start ProcedurePublished Group Code

class ProcedurePublishedGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
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
    return ApiManager.instance.makeApiCall(
      callName: 'ProcedurePublishedList',
      apiUrl: '${ProcedurePublishedGroup.baseUrl}/items/workflows',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "steps.tasks.id, steps.tasks.name, steps.tasks.workflow_id, steps.tasks.published_count, steps.tasks.date_created, steps.number, steps.tasks.operations.operations_id.content, steps.tasks.operations.operations_id.files.directus_files_id.id, steps.tasks.operations.operations_id.result,id,name,steps.id,steps.tasks.user_created.first_name,steps.tasks.status, steps.tasks.created_user_id.first_name, steps.tasks.created_user_id.email,organization_id,steps.staffs.staffs_id.id,departments.departments_id.staffs.id,branch_id, steps.tasks.date_end,steps.departments.departments_id.staffs.id,steps.departments.departments_id.id,departments.departments_id.id,steps.tasks.created_staff_id.branch_id, steps.tasks.created_staff_id.department_id, steps.tasks.created_staff_id.user_id",
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
      alwaysAllowBody: false,
    );
  }
}

class ProcedureTemplateUpdateLimitPublishedCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? limitPublished = 0,
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "limit_published": $limitPublished
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProcedureTemplateUpdateLimitPublished',
      apiUrl: '${ProcedurePublishedGroup.baseUrl}/items/workflows/$id',
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
      alwaysAllowBody: false,
    );
  }
}

class ProcedurePublishedCall {
  Future<ApiCallResponse> call({
    String? workflowId = '',
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "workflow_id": "$workflowId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProcedurePublished',
      apiUrl:
          '${ProcedurePublishedGroup.baseUrl}/flows/trigger/cb0b45cb-956a-410e-9f15-fd040a83a0e4',
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
      alwaysAllowBody: false,
    );
  }
}

/// End ProcedurePublished Group Code

/// Start Department Group Code

class DepartmentGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static GetDepartmentListCall getDepartmentListCall = GetDepartmentListCall();
  static PostdepartmentCall postdepartmentCall = PostdepartmentCall();
  static PathDepartmentCall pathDepartmentCall = PathDepartmentCall();
}

class GetDepartmentListCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetDepartmentList',
      apiUrl: '${DepartmentGroup.baseUrl}/items/departments',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields[]':
            "id, status, name, description, branch_id.id, branch_id.name, code,programs.programs_id.id, programs.programs_id.name, programs.programs_id.lessions.lessions_id.id, programs.programs_id.lessions.lessions_id.name,staffs.id, staffs.user_id.id, staffs.user_id.emaile,staffs.user_id.first_name,staffs.user_id.role,organization_id",
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
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
      apiUrl: '${DepartmentGroup.baseUrl}/items/departments',
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
    String? accessToken = '',
  }) async {
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
      callName: 'PathDepartment',
      apiUrl: '${DepartmentGroup.baseUrl}/items/departments/$departmentId',
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
      alwaysAllowBody: false,
    );
  }
}

/// End Department Group Code

/// Start UploadFile Group Code

class UploadFileGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static UploadFileCall uploadFileCall = UploadFileCall();
}

class UploadFileCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'UploadFile',
      apiUrl: '${UploadFileGroup.baseUrl}/files',
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
      alwaysAllowBody: false,
    );
  }
}

/// End UploadFile Group Code

/// Start User Group Code

class UserGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static UserMeCall userMeCall = UserMeCall();
  static GetStaffIdCall getStaffIdCall = GetStaffIdCall();
  static GetListUserCall getListUserCall = GetListUserCall();
}

class UserMeCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'UserMe',
      apiUrl: '${UserGroup.baseUrl}/users/me',
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
      alwaysAllowBody: false,
    );
  }
}

class GetStaffIdCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
"user_id":"$userId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetStaffId',
      apiUrl:
          '${UserGroup.baseUrl}/flows/trigger/414ee2de-1efe-4542-98d5-436eb0107ee0',
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
      alwaysAllowBody: false,
    );
  }
}

class GetListUserCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetListUser',
      apiUrl: '${UserGroup.baseUrl}/users',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields': "email",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End User Group Code

/// Start Authen Group Code

class AuthenGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
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
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${AuthenGroup.baseUrl}/auth/login',
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
      alwaysAllowBody: false,
    );
  }
}

class RefreshTokenCall {
  Future<ApiCallResponse> call({
    String? refreshToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "refresh_token": "$refreshToken",
  "mode": "json"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RefreshToken',
      apiUrl: '${AuthenGroup.baseUrl}/auth/refresh',
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
      alwaysAllowBody: false,
    );
  }
}

class CreateOrganizationUserCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'CreateOrganizationUser',
      apiUrl:
          '${AuthenGroup.baseUrl}/flows/trigger/c5d94aa6-ac37-4ece-bfc5-05503805ad8b',
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
      alwaysAllowBody: false,
    );
  }
}

/// End Authen Group Code

/// Start Lesson Group Code

class LessonGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
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
}

class GetLessonListCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetLessonList',
      apiUrl: '${LessonGroup.baseUrl}/items/lessions',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields[]':
            "file,file.id,file.type,duration_hours,comments.id, comments.comments_id.id, comments.comments_id.content,id, status, name, description, content, image_cover, video, date_created, date_updated,test_id,comments.comments_id.staff_id.id,comments.comments_id.staff_id,comments.comments_id.staff_id.user_id,comments.comments_id.staff_id.user_id.email,comments.comments_id.staff_id.user_id.first_name,comments.comments_id.staff_id.user_id.avatar,comments.comments_id.date_created,reacts.id, reacts.reacts_id.status,reacts.reacts_id.staff_id,file.filename_download,organization_id,programs.programs_id.id,programs.programs_id.name",
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetLessionsOneCall {
  Future<ApiCallResponse> call({
    String? lessionsId = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetLessionsOne',
      apiUrl: '${LessonGroup.baseUrl}/items/lessions/$lessionsId',
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
      alwaysAllowBody: false,
    );
  }
}

class EmployeeLessonListCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'EmployeeLessonList',
      apiUrl: '${LessonGroup.baseUrl}/items/staffs_lessions',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields[]':
            "lession_id.file.id,lession_id.file.type,id,status,progress,date_start,date_end,staff_id.id,staff_id.user_id.first_name,staff_id.user_id.last_name,lession_id.id,lession_id.name,lession_id.description,lession_id.content,lession_id.image_cover,lession_id.video,lession_id.date_updated,lession_id.comments.id,lession_id.comments.comments_id.id,lession_id.comments.comments_id.content,lession_id.status,lession_id.date_created,lession_id.test_id,lession_id.comments.comments_id.staff_id.user_id.avatar,lession_id.comments.comments_id.staff_id.user_id.first_name,lession_id.duration_hours,lession_id.comments.comments_id.date_created,lession_id.file.filename_download,lession_id.programs.programs_id.id,lession_id.programs.programs_id.name",
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class PostCommentCall {
  Future<ApiCallResponse> call({
    String? lessionId = '',
    String? content = '',
    String? staffId = '',
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "status": "published",
  "lession_id": "$lessionId",
  "content": "$content",
  "staff_id": "$staffId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostComment',
      apiUrl:
          '${LessonGroup.baseUrl}/flows/trigger/c9e1d3e3-cc5d-4b86-9f77-b2f561c7496a',
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
      alwaysAllowBody: false,
    );
  }
}

class PostLessonCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'PostLesson',
      apiUrl: '${LessonGroup.baseUrl}/items/lessions',
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
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'PathLesson',
      apiUrl: '${LessonGroup.baseUrl}/items/lessions/$idLesson',
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
      alwaysAllowBody: false,
    );
  }
}

class DeleteCommentCall {
  Future<ApiCallResponse> call({
    int? id,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteComment',
      apiUrl: '${LessonGroup.baseUrl}/items/lessions_comments/$id',
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
      alwaysAllowBody: false,
    );
  }
}

class ProgramsLessionsCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ProgramsLessions',
      apiUrl: '${LessonGroup.baseUrl}/items/programs_lessions',
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
    final ffApiRequestBody = '''
{
  "status": "$status",
  "lession_id": "$lessionId",
  "staff_id": "$staffId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postHeart',
      apiUrl:
          '${LessonGroup.baseUrl}/flows/trigger/b1e1fdf3-6656-4c9e-9c58-03feeee4ed7c',
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
      alwaysAllowBody: false,
    );
  }
}

class DeleteHeartCall {
  Future<ApiCallResponse> call({
    int? idHeart,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteHeart',
      apiUrl: '${LessonGroup.baseUrl}/items/lessions_reacts/$idHeart',
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
      alwaysAllowBody: false,
    );
  }
}

class UpdateStaffLessonStatusCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accessToken = '',
  }) async {
    const ffApiRequestBody = '''
{
  	  "status": "inprogress"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateStaffLessonStatus',
      apiUrl: '${LessonGroup.baseUrl}/items/staffs_lessions/$id',
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
      alwaysAllowBody: false,
    );
  }
}

/// End Lesson Group Code

/// Start StudyProgram Group Code

class StudyProgramGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static StudyProgramListCall studyProgramListCall = StudyProgramListCall();
  static StudyProgramOneCall studyProgramOneCall = StudyProgramOneCall();
  static StudyProgramCreateCall studyProgramCreateCall =
      StudyProgramCreateCall();
  static StudyProgramLessionsUpdateCall studyProgramLessionsUpdateCall =
      StudyProgramLessionsUpdateCall();
  static SynchronizedStaffLessonCall synchronizedStaffLessonCall =
      SynchronizedStaffLessonCall();
}

class StudyProgramListCall {
  Future<ApiCallResponse> call({
    String? filter = '{}',
    int? offset = 0,
    int? limit = 5000,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'StudyProgramList',
      apiUrl: '${StudyProgramGroup.baseUrl}/items/programs',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'filter': filter,
        'fields':
            "organization_id,id, status, name, description, duration_hours, lessions.lessions_id.id, lessions.lessions_id.name,tests.tests_id.id, tests.tests_id.name,tests.tests_id.description,tests.tests_id.duration_minutes,tests.tests_id.name,lessions.lessions_id.date_created,lessions.lessions_id.image_cover,tests.date_created,departments.departments_id",
        'offset': offset,
        'limit': limit,
        'meta': "total_count,filter_count",
        'sort': "-date_created",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class StudyProgramOneCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    int? offset = 0,
    int? limit = 5000,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'StudyProgramOne',
      apiUrl: '${StudyProgramGroup.baseUrl}/items/programs',
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
      alwaysAllowBody: false,
    );
  }
}

class StudyProgramCreateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'StudyProgramCreate',
      apiUrl: '${StudyProgramGroup.baseUrl}/items/programs',
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
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'StudyProgramLessionsUpdate',
      apiUrl: '${StudyProgramGroup.baseUrl}/items/programs/$id',
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
      alwaysAllowBody: false,
    );
  }
}

class SynchronizedStaffLessonCall {
  Future<ApiCallResponse> call({
    String? programId = '',
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "program_id": "$programId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SynchronizedStaffLesson',
      apiUrl:
          '${StudyProgramGroup.baseUrl}/flows/trigger/b1888ea3-9709-4c01-821d-9573d1171060',
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
      alwaysAllowBody: false,
    );
  }
}

/// End StudyProgram Group Code

/// Start DoTest Group Code

class DoTestGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
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
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'StaffsTestsList',
      apiUrl: '${DoTestGroup.baseUrl}/items/staffs_tests',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "id,status,test_id.id,test_id.name,score,date_start,date_end,total_correct,total_incorrect,test_id.duration_minutes,date_created,percent_correct,test_id.good_score",
        'filter': filter,
        'sort': "-date_created",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class StaffAnswerListCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'StaffAnswerList',
      apiUrl: '${DoTestGroup.baseUrl}/items/staffs_answers',
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
      alwaysAllowBody: false,
    );
  }
}

class CreateStaffTestCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'CreateStaffTest',
      apiUrl: '${DoTestGroup.baseUrl}/items/staffs_tests',
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
      alwaysAllowBody: false,
    );
  }
}

class CreateStaffAnswerCall {
  Future<ApiCallResponse> call({
    dynamic requestJson,
    String? accessToken = '',
  }) async {
    final request = _serializeJson(requestJson, true);
    final ffApiRequestBody = request;
    return ApiManager.instance.makeApiCall(
      callName: 'CreateStaffAnswer',
      apiUrl: '${DoTestGroup.baseUrl}/items/staffs_answers',
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
      alwaysAllowBody: false,
    );
  }
}

class CalculateTestScoresCall {
  Future<ApiCallResponse> call({
    String? staffTestId = '',
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "staff_test_id": "$staffTestId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CalculateTestScores',
      apiUrl:
          '${DoTestGroup.baseUrl}/flows/trigger/44b43c13-8b8e-4032-b528-ae3be7c52a7d',
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
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'CreateStaffTests',
      apiUrl: '${DoTestGroup.baseUrl}/items/staffs_tests?fields=$fields',
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
      alwaysAllowBody: false,
    );
  }
}

/// End DoTest Group Code

/// Start Test Group Code

class TestGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
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
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'CreateTest',
      apiUrl: '${TestGroup.baseUrl}/items/tests',
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
      alwaysAllowBody: false,
    );
  }
}

class QuestionTestAddCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'QuestionTestAdd',
      apiUrl: '${TestGroup.baseUrl}/items/tests_questions',
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
      alwaysAllowBody: false,
    );
  }
}

class TestListCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TestList',
      apiUrl: '${TestGroup.baseUrl}/items/tests',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "questions.id, questions.questions_id.answers.answers_id.id, questions.questions_id.answers.answers_id.content, questions.questions_id.answers.answers_id.correct,id, status, name, description, duration_minutes, questions.questions_id.id, questions.questions_id.content, questions.questions_id.status, questions.questions_id.content, questions.questions_id.answer_type, questions.questions_id.auto_correct,organization_id,good_score",
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class TestOneCall {
  Future<ApiCallResponse> call({
    String? testsId = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TestOne',
      apiUrl: '${TestGroup.baseUrl}/items/tests/$testsId',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "id, status, name, description, duration_minutes, questions.questions_id.id, questions.questions_id.content, questions.questions_id.status, questions.questions_id.content, questions.questions_id.answer_type, questions.questions_id.auto_correct,questions.id, questions.questions_id.answers.answers_id.id, questions.questions_id.answers.answers_id.content, questions.questions_id.answers.answers_id.correct",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'TestUpdate',
      apiUrl: '${TestGroup.baseUrl}/items/tests/$id',
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
      alwaysAllowBody: false,
    );
  }
}

/// End Test Group Code

/// Start Question Group Code

class QuestionGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
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
    return ApiManager.instance.makeApiCall(
      callName: 'questionList',
      apiUrl: '${QuestionGroup.baseUrl}/items/questions',
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
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class QuestionListOneCall {
  Future<ApiCallResponse> call({
    String? questionId = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'questionListOne',
      apiUrl: '${QuestionGroup.baseUrl}/items/questions/$questionId',
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
      alwaysAllowBody: false,
    );
  }
}

class QuestionCreateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'questionCreate',
      apiUrl:
          '${QuestionGroup.baseUrl}/flows/trigger/ab20019b-2912-40b4-8dcf-e3b010893396',
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
      alwaysAllowBody: false,
    );
  }
}

class QuestionUpdateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'questionUpdate',
      apiUrl:
          '${QuestionGroup.baseUrl}/flows/trigger/bd88689f-a050-44ac-b694-e2fe2c06e23c',
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
      alwaysAllowBody: false,
    );
  }
}

/// End Question Group Code

/// Start ProcedureTemplate Group Code

class ProcedureTemplateGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
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
}

class WorkflowsListCall {
  Future<ApiCallResponse> call({
    String? filter = '{}',
    int? offset = 0,
    int? limit = 5000,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'workflowsList',
      apiUrl: '${ProcedureTemplateGroup.baseUrl}/items/workflows',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "domain_id,category_id,template,organization_id,id, status, name, description,user_created.id,user_created.first_name,steps.id,steps.number, steps.name, steps.operations, steps.operations.operations_id.id, steps.operations.operations_id.name,steps.staffs.id, steps.staffs.staffs_id.id, steps.staffs.staffs_id.user_id.email,steps.staffs.staffs_id.user_id.last_name,cron,steps.staffs.staffs_id",
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
      alwaysAllowBody: false,
    );
  }
}

class OperationsListCall {
  Future<ApiCallResponse> call({
    String? filter = '{}',
    int? offset = 0,
    int? limit = 5000,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'operationsList',
      apiUrl: '${ProcedureTemplateGroup.baseUrl}/items/operations',
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
      alwaysAllowBody: false,
    );
  }
}

class OperationsCreateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'operationsCreate',
      apiUrl: '${ProcedureTemplateGroup.baseUrl}/items/operations',
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
      alwaysAllowBody: false,
    );
  }
}

class WorkflowsCreateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'workflowsCreate',
      apiUrl: '${ProcedureTemplateGroup.baseUrl}/items/workflows',
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
      alwaysAllowBody: false,
    );
  }
}

class TasksCreateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'tasksCreate',
      apiUrl: '${ProcedureTemplateGroup.baseUrl}/items/tasks',
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
    return ApiManager.instance.makeApiCall(
      callName: 'tasksList',
      apiUrl: '${ProcedureTemplateGroup.baseUrl}/items/tasks',
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
      alwaysAllowBody: false,
    );
  }
}

class StepsCreateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'stepsCreate',
      apiUrl: '${ProcedureTemplateGroup.baseUrl}/items/steps',
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
    return ApiManager.instance.makeApiCall(
      callName: 'stepsList',
      apiUrl: '${ProcedureTemplateGroup.baseUrl}/items/steps',
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
      alwaysAllowBody: false,
    );
  }
}

class StepCreateWorkflowsCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'stepCreateWorkflows',
      apiUrl:
          '${ProcedureTemplateGroup.baseUrl}/flows/trigger/b1ba3372-66bb-44c9-baec-c8db8c7511fe',
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
      alwaysAllowBody: false,
    );
  }
}

class WorkflowsOneCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'workflowsOne',
      apiUrl: '${ProcedureTemplateGroup.baseUrl}/items/workflows/$id',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "staffs.staffs_id.name,staffs.staffs_id.id,departments.departments_id.id,departments.departments_id.name,staffs.staffs_id.id,staffs.staffs_id.user_id.first_name,steps.staffs_alias,steps.id,id,description,name,cron,limit_published,remind,remind_in_second,estimate_in_second, deadline, cron,steps.name, steps.description, steps.date_start, steps.date_end, steps.execute_type, stepscron, steps.number, steps.status, steps.deadline, steps.estimate_in_second,steps.staffs.staffs_id.id,steps.tasks.id, steps.tasks.tasks_id.id, steps.tasks.tasks_id.name,steps.operations, steps.operations.operations_id.id, steps.operations.operations_id.name, steps.operations.operations_id.description, steps.operations.operations_id.action_type, steps.operations.operations_id.content, steps.operations.operations_id.date_start, steps.operations.operations_id.date_end,steps.operations.operations_id.staffs,steps.action_type,steps.staffs.staffs_id.user_id.first_name,remind_in_second,remind,published_count,limit_published,cron,estimate_in_second,steps.estimate_in_second,steps.time_operate,remind_2",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class WorkflowUpdateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'workflowUpdate',
      apiUrl:
          '${ProcedureTemplateGroup.baseUrl}/flows/trigger/ebd094ca-ca35-4867-8850-4db6d65ee569',
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
      alwaysAllowBody: false,
    );
  }
}

class StepUpdateCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'stepUpdate',
      apiUrl:
          '${ProcedureTemplateGroup.baseUrl}/flows/trigger/ad1865a8-6611-4c50-8777-15a871f52524',
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
    final stepId = _serializeList(stepIdList);

    final ffApiRequestBody = '''
{"steps":{"create":[],"update":[],"delete":$stepId}}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteWorkflowsStep',
      apiUrl:
          '${ProcedureTemplateGroup.baseUrl}/items/workflows/$workflowsId',
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
      alwaysAllowBody: false,
    );
  }
}

class WorkflowCopyCall {
  Future<ApiCallResponse> call({
    String? workflowId = '',
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "workflow_id": "$workflowId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'workflowCopy',
      apiUrl:
          '${ProcedureTemplateGroup.baseUrl}/flows/trigger/409e0add-4b94-419e-814d-ac787810e2b8',
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
    final ffApiRequestBody = '''
{
  "workflow_id": "$workflowId",
  "category_id": "$categoryId",
  "domain_id": "$domainId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'workflowMarket',
      apiUrl:
          '${ProcedureTemplateGroup.baseUrl}/flows/trigger/462eabbb-b130-4500-b4dd-32d4801cbdd0',
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
      alwaysAllowBody: false,
    );
  }
}

/// End ProcedureTemplate Group Code

/// Start Branch Group Code

class BranchGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
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
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BranchList',
      apiUrl: '${BranchGroup.baseUrl}/items/branchs',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'filter': filter,
        'fields[]':
            "id, status, name, description, code,departments.id, departments.name, departments.departments_id.id, departments.departments_id.name,staffs.id,staffs.name,staffs.title, staffs.user_id.first_name,organization_id.id",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BranchAddCall {
  Future<ApiCallResponse> call({
    dynamic requesDataJson,
    String? accessToken = '',
  }) async {
    final requesData = _serializeJson(requesDataJson);
    final ffApiRequestBody = requesData;
    return ApiManager.instance.makeApiCall(
      callName: 'BranchAdd',
      apiUrl: '${BranchGroup.baseUrl}/items/branchs',
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
    final requesData = _serializeJson(requesDataJson);
    final ffApiRequestBody = requesData;
    return ApiManager.instance.makeApiCall(
      callName: 'BranchUpdate',
      apiUrl: '${BranchGroup.baseUrl}/items/branchs/$id',
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
      alwaysAllowBody: false,
    );
  }
}

/// End Branch Group Code

/// Start Staff Group Code

class StaffGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static GetStaffListCall getStaffListCall = GetStaffListCall();
  static GetStaffGetOneCall getStaffGetOneCall = GetStaffGetOneCall();
  static CreateStaffCall createStaffCall = CreateStaffCall();
  static UpdateStaffCall updateStaffCall = UpdateStaffCall();
  static UpdateUserStaffCall updateUserStaffCall = UpdateUserStaffCall();
  static UpdatePasswordCall updatePasswordCall = UpdatePasswordCall();
}

class GetStaffListCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetStaffList',
      apiUrl: '${StaffGroup.baseUrl}/items/staffs',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "id, title, user_id.role, status,organization_id.id,organization_id.name, branch_id.id, branch_id.name, department_id.id, department_id.name, cccd, gender, phone, dob, user_id.id, user_id.email, user_id.first_name, user_id.last_name, user_id.status, user_id.avatar,staff_lessions.id,staff_lessions.status,staff_tests.id,staff_tests.status",
        'filter': filter,
        'sort': "-date_created",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetStaffGetOneCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? staffId = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetStaffGetOne',
      apiUrl: '${StaffGroup.baseUrl}/items/staffs/$staffId',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "id, title, user_id.role, status, branch_id.id, branch_id.name, department_id.id, department_id.name, cccd, gender, phone, dob, user_id.id, user_id.email, user_id.first_name, user_id.last_name, user_id.status, user_id.avatar,tasks.id, tasks.tasks_id.id, tasks.tasks_id.name, tasks.tasks_id.number, tasks.tasks_id.status, tasks.tasks_id.description, tasks.tasks_id.step_id, tasks.tasks_id.workflow_id, tasks.tasks_id.current,skills.id, skills.skills_id.id, skills.skills_id.name,current_step_id.id, current_step_id.name,tasks.tasks_id.operations.id, tasks.tasks_id.operations.operations_id.name, tasks.tasks_id.operations.operations_id.content, tasks.tasks_id.operations.operations_id.description, tasks.tasks_id.operations.operations_id.result, tasks.tasks_id.operations.operations_id.files",
        'filter': filter,
        'sort': "-date_created",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateStaffCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'CreateStaff',
      apiUrl:
          '${StaffGroup.baseUrl}/flows/trigger/3481e773-dacc-466a-b35a-fcff84464e87',
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
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateStaff',
      apiUrl: '${StaffGroup.baseUrl}/users/$id',
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
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateUserStaff',
      apiUrl: '${StaffGroup.baseUrl}/items/staffs/$staffId',
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
      alwaysAllowBody: false,
    );
  }
}

class UpdatePasswordCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'UpdatePassword',
      apiUrl:
          '${StaffGroup.baseUrl}/flows/trigger/a721cfaf-8453-4f0c-aff1-6839e9c8ddb1',
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
      alwaysAllowBody: false,
    );
  }
}

/// End Staff Group Code

/// Start Organization Group Code

class OrganizationGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
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
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetOneOrganization',
      apiUrl:
          '${OrganizationGroup.baseUrl}/items/organizations/$organizationId',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "id, status, name, description, code,hotline,avatar,logo,address,video,image,branchs.id, branchs.name,branchs.branchs_id.departments.departments_id.id, branchs.branchs_id.departments.departments_id.name,staffs.id, staffs.user_id.id, staffs.user_id.email",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateOrganization',
      apiUrl:
          '${OrganizationGroup.baseUrl}/items/organizations/$organizationId',
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
      alwaysAllowBody: false,
    );
  }
}

class GetOrganizationCall {
  Future<ApiCallResponse> call({
    String? organizationId = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetOrganization',
      apiUrl:
          '${OrganizationGroup.baseUrl}/items/organizations/$organizationId',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "id, status, name, description, code,hotline,avatar,description,logo,video,address,image,branchs.departments.id, branchs.departments.name,staffs.id, staffs.user_id.id, staffs.user_id.email,id, status, name, description, code,branchs.id, branchs.name, staffs.user_id.role, staffs.user_id.first_name,staffs.user_id.avatar",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Organization Group Code

/// Start Task Group Code

class TaskGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [accessToken]',
  };
  static GetListTaskCall getListTaskCall = GetListTaskCall();
  static UpdateOperationCall updateOperationCall = UpdateOperationCall();
  static ConfirmOperationCall confirmOperationCall = ConfirmOperationCall();
  static ReceiveTaskCall receiveTaskCall = ReceiveTaskCall();
}

class GetListTaskCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetListTask',
      apiUrl: '${TaskGroup.baseUrl}/items/tasks',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "id, status, name, description, content, date_start, date_end, deadline, estimate_in_second, workflow_id.id,workflow_id.name, number, published_count, step_id, execute_type, action_type, current,staffs.id, staffs.staffs_id.id, staffs.staffs_id.user_id.id, staffs.staffs_id.user_id.first_name,operations.id, operations.operations_id.id, operations.operations_id.name, operations.operations_id.date_start, operations.operations_id.date_end, operations.operations_id.deadline, operations.operations_id.estimate_in_second, operations.operations_id.operation_id,operations.operations_id.action_type, operations.operations_id.step_id,operations.operations_id.content, operations.operations_id.result, operations.operations_id.staffs.id, operations.operations_id.staffs.staffs_id.id,  operations.operations_id.staffs.staffs_id.user_id.email,operations.operations_id.status,staffs.staffs_id.department_id.name,step_id.id,step_id.name,step_id.number, operations.operations_id.files.directus_files_id.id,operations.operations_id.files.directus_files_id.type,operations.operations_id.files.directus_files_id.filename_download,operations.operations_id.files.directus_files_id.id,operations.operations_id.files.directus_files_id.type,operations.operations_id.date_updated,workflow_id.name,staffs.staffs_id.user_id.avatar, organization_id.id, workflow_id.organization_id,submit_staff_id.id, submit_staff_id.user_id.first_name,submit_staff_id.user_id.avatar,date_created,time_operate,created_user_id.first_name",
        'filter': filter,
        'sort': "number",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateOperationCall {
  Future<ApiCallResponse> call({
    String? operationId = '',
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateOperation',
      apiUrl: '${TaskGroup.baseUrl}/items/operations/$operationId',
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
    final ffApiRequestBody = '''
{
  "task_id": "$taskId",
  "staff_id": "$staffId",
  "submit_type": "$submitType"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ConfirmOperation',
      apiUrl:
          '${TaskGroup.baseUrl}/flows/trigger/f3371d44-ab81-45f4-97dd-d616ddbc2a82',
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
      alwaysAllowBody: false,
    );
  }
}

class ReceiveTaskCall {
  Future<ApiCallResponse> call({
    String? staffId = '',
    String? workflowId = '',
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "staff_id": "$staffId",
  "workflow_id": "$workflowId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ReceiveTask',
      apiUrl:
          '${TaskGroup.baseUrl}/flows/trigger/cb967d02-d828-4896-85cf-f2340f9b3fb2',
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
      alwaysAllowBody: false,
    );
  }
}

/// End Task Group Code

/// Start Operation Group Code

class OperationGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
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
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'OperationList',
      apiUrl: '${OperationGroup.baseUrl}/items/operations',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "id, status, name, description, content, date_start, date_end, deadline, estimate_in_second, operation_id, step_id, action_type, execute_id,staffs.staffs_id.id, staffs.staffs_id.user_id.email,files, files.directus_files_id.id, result,settings.id, settings.settings_id.id, settings.settings_id.name, settings.settings_id.type, settings.settings_id.key, settings.settings_id.value, settings.settings_id.description,configurations.id, configurations.configurations_id.id, configurations.configurations_id.name, configurations.configurations_id.description,organization_id,user_created,date_created",
        'filter': filter,
        'sort': "-date_created",
        'total_count': 5000,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class OperationAddCall {
  Future<ApiCallResponse> call({
    dynamic requestDataJson,
    String? accessToken = '',
  }) async {
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'OperationAdd',
      apiUrl: '${OperationGroup.baseUrl}/items/operations',
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
    final requestData = _serializeJson(requestDataJson);
    final ffApiRequestBody = requestData;
    return ApiManager.instance.makeApiCall(
      callName: 'OperationsUpdate',
      apiUrl: '${OperationGroup.baseUrl}/items/operations/$operationId',
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
      alwaysAllowBody: false,
    );
  }
}

/// End Operation Group Code

/// Start Categories Group Code

class CategoriesGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
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
    return ApiManager.instance.makeApiCall(
      callName: 'GetCategoriesList',
      apiUrl: '${CategoriesGroup.baseUrl}/items/categories',
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
      alwaysAllowBody: false,
    );
  }
}

/// End Categories Group Code

/// Start Domain Group Code

class DomainGroup {
  static String baseUrl = 'https://workflow-api.pexnic.com';
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
    return ApiManager.instance.makeApiCall(
      callName: 'GetDomainsList',
      apiUrl: '${DomainGroup.baseUrl}/items/domains',
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
      alwaysAllowBody: false,
    );
  }
}

/// End Domain Group Code

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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
