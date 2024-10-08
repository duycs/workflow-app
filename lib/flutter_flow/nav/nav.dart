import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                child: Center(
                  child: Image.asset(
                    'assets/images/512.png',
                    width: 150.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    child: Center(
                      child: Image.asset(
                        'assets/images/512.png',
                        width: 150.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              : LoginWidget(),
        ),
        FFRoute(
          name: 'LessonList_Homepage',
          path: '/lessonListHomepage',
          builder: (context, params) => LessonListHomepageWidget(
            statusLesson: params.getParam(
              'statusLesson',
              ParamType.String,
            ),
            statusLove: params.getParam(
              'statusLove',
              ParamType.String,
            ),
            lessonNewCreate: params.getParam(
              'lessonNewCreate',
              ParamType.String,
            ),
            lesonHistory: params.getParam(
              'lesonHistory',
              ParamType.String,
            ),
            checkLesson: params.getParam(
              'checkLesson',
              ParamType.String,
            ),
            staffId: params.getParam(
              'staffId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'LessonDetail_HomePage',
          path: '/lessonDetailHomePage',
          builder: (context, params) => LessonDetailHomePageWidget(
            listItems: params.getParam(
              'listItems',
              ParamType.JSON,
            ),
            status: params.getParam(
              'status',
              ParamType.String,
            ),
            checkScroll: params.getParam(
              'checkScroll',
              ParamType.String,
            ),
            programId: params.getParam(
              'programId',
              ParamType.String,
            ),
            checkLesson: params.getParam(
              'checkLesson',
              ParamType.String,
            ),
            checkReload: params.getParam(
              'checkReload',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'DoTest',
          path: '/doTest',
          builder: (context, params) => DoTestWidget(
            testId: params.getParam(
              'testId',
              ParamType.String,
            ),
            lessionId: params.getParam(
              'lessionId',
              ParamType.String,
            ),
            avatar: params.getParam(
              'avatar',
              ParamType.String,
            ),
            goodScore: params.getParam(
              'goodScore',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'TestDetail',
          path: '/testDetail',
          builder: (context, params) => TestDetailWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            description: params.getParam(
              'description',
              ParamType.String,
            ),
            time: params.getParam(
              'time',
              ParamType.String,
            ),
            goodScore: params.getParam(
              'goodScore',
              ParamType.int,
            ),
            checkScroll: params.getParam(
              'checkScroll',
              ParamType.String,
            ),
            status: params.getParam(
              'status',
              ParamType.String,
            ),
            idUser: params.getParam(
              'idUser',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'TrainingProgressUser',
          path: '/trainingProgressUser',
          builder: (context, params) => TrainingProgressUserWidget(),
        ),
        FFRoute(
          name: 'ProcedurePublishedList',
          path: '/procedurePublishedList',
          builder: (context, params) => ProcedurePublishedListWidget(),
        ),
        FFRoute(
          name: 'StudyProgramList',
          path: '/studyProgramList',
          builder: (context, params) => StudyProgramListWidget(
            checkpage: params.getParam(
              'checkpage',
              ParamType.String,
            ),
            showModal: params.getParam(
              'showModal',
              ParamType.String,
            ),
            itemLesstion: params.getParam(
              'itemLesstion',
              ParamType.DataStruct,
              isList: false,
              structBuilder: LessonsStruct.fromSerializableMap,
            ),
            programsItem: params.getParam(
              'programsItem',
              ParamType.JSON,
            ),
            itemListLession: params.getParam(
              'itemListLession',
              ParamType.DataStruct,
              isList: false,
              structBuilder: StudyProgramListStruct.fromSerializableMap,
            ),
            imagesProgram: params.getParam(
              'imagesProgram',
              ParamType.FFUploadedFile,
            ),
            dataProframDeatail: params.getParam(
              'dataProframDeatail',
              ParamType.DataStruct,
              isList: false,
              structBuilder: StudyProgramListStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'TrainingManage',
          path: '/trainingManage',
          builder: (context, params) => TrainingManageWidget(),
        ),
        FFRoute(
          name: 'TrainingRankCreate',
          path: '/trainingRankCreate',
          builder: (context, params) => TrainingRankCreateWidget(),
        ),
        FFRoute(
          name: 'StaffCreate',
          path: '/staffCreate',
          builder: (context, params) => StaffCreateWidget(),
        ),
        FFRoute(
          name: 'ProdureStepDetailDraft',
          path: '/produreStepDetailDraft',
          builder: (context, params) => ProdureStepDetailDraftWidget(),
        ),
        FFRoute(
          name: 'ProcedureList',
          path: '/procedureList',
          builder: (context, params) => ProcedureListWidget(),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: 'PersonnelList',
          path: '/personnelList',
          builder: (context, params) => PersonnelListWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'ProdureStep05',
          path: '/produreStep05',
          builder: (context, params) => ProdureStep05Widget(),
        ),
        FFRoute(
          name: 'TestCreate',
          path: '/testCreate',
          builder: (context, params) => TestCreateWidget(
            checkScroll: params.getParam(
              'checkScroll',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'LessonCreate',
          path: '/lessonCreate',
          builder: (context, params) => LessonCreateWidget(
            checkScroll: params.getParam(
              'checkScroll',
              ParamType.String,
            ),
            checkPage: params.getParam(
              'checkPage',
              ParamType.String,
            ),
            programsItem: params.getParam(
              'programsItem',
              ParamType.JSON,
            ),
            listItemLession: params.getParam(
              'listItemLession',
              ParamType.DataStruct,
              isList: false,
              structBuilder: StudyProgramListStruct.fromSerializableMap,
            ),
            imageProgram: params.getParam(
              'imageProgram',
              ParamType.FFUploadedFile,
            ),
            dataProgramDetail: params.getParam(
              'dataProgramDetail',
              ParamType.DataStruct,
              isList: false,
              structBuilder: StudyProgramListStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'TrainingRankUpdate',
          path: '/trainingRankUpdate',
          builder: (context, params) => TrainingRankUpdateWidget(),
        ),
        FFRoute(
          name: 'LessonUpdate',
          path: '/lessonUpdate',
          builder: (context, params) => LessonUpdateWidget(
            items: params.getParam(
              'items',
              ParamType.JSON,
            ),
            checkPage: params.getParam(
              'checkPage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'DoTestDetail',
          path: '/doTestDetail',
          builder: (context, params) => DoTestDetailWidget(
            testId: params.getParam(
              'testId',
              ParamType.String,
            ),
            testName: params.getParam(
              'testName',
              ParamType.String,
            ),
            testTime: params.getParam(
              'testTime',
              ParamType.int,
            ),
            testDescription: params.getParam(
              'testDescription',
              ParamType.String,
            ),
            percentCorect: params.getParam(
              'percentCorect',
              ParamType.String,
            ),
            goodScore: params.getParam(
              'goodScore',
              ParamType.int,
            ),
            avatar: params.getParam(
              'avatar',
              ParamType.String,
            ),
            lessionId: params.getParam(
              'lessionId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'DoTestList',
          path: '/doTestList',
          builder: (context, params) => DoTestListWidget(
            lessionId: params.getParam(
              'lessionId',
              ParamType.String,
            ),
            status: params.getParam(
              'status',
              ParamType.int,
            ),
            staffId: params.getParam(
              'staffId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'StaffUpdate',
          path: '/staffUpdate',
          builder: (context, params) => StaffUpdateWidget(
            staffDetail: params.getParam(
              'staffDetail',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'TestList',
          path: '/testList',
          builder: (context, params) => TestListWidget(
            checkpage: params.getParam(
              'checkpage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'QuestionList',
          path: '/questionList',
          builder: (context, params) => QuestionListWidget(),
        ),
        FFRoute(
          name: 'StudyProgramListUserDraft',
          path: '/studyProgramListUserDraft',
          builder: (context, params) => StudyProgramListUserDraftWidget(),
        ),
        FFRoute(
          name: 'LessonsList',
          path: '/lessonsList',
          builder: (context, params) => LessonsListWidget(
            checkpage: params.getParam(
              'checkpage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ProcedureCreate',
          path: '/procedureCreate',
          builder: (context, params) => ProcedureCreateWidget(
            checkRouter: params.getParam(
              'checkRouter',
              ParamType.String,
            ),
            checkScroll: params.getParam(
              'checkScroll',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ProcedureUpdate',
          path: '/procedureUpdate',
          builder: (context, params) => ProcedureUpdateWidget(
            itemData: params.getParam(
              'itemData',
              ParamType.DataStruct,
              isList: false,
              structBuilder: WorkflowsStepCreateStruct.fromSerializableMap,
            ),
            stepListPar: params.getParam<WorkflowsStepCreateStruct>(
              'stepListPar',
              ParamType.DataStruct,
              isList: true,
              structBuilder: WorkflowsStepCreateStruct.fromSerializableMap,
            ),
            check: params.getParam(
              'check',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'ProcedureDetail',
          path: '/procedureDetail',
          builder: (context, params) => ProcedureDetailWidget(
            workflowsId: params.getParam(
              'workflowsId',
              ParamType.String,
            ),
            checkScroll: params.getParam(
              'checkScroll',
              ParamType.String,
            ),
            idCreate: params.getParam(
              'idCreate',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'LessonDetail',
          path: '/lessonDetail',
          builder: (context, params) => LessonDetailWidget(
            idLesson: params.getParam(
              'idLesson',
              ParamType.String,
            ),
            checkSrcoll: params.getParam(
              'checkSrcoll',
              ParamType.String,
            ),
            checkPage: params.getParam(
              'checkPage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'TrainingProgress',
          path: '/trainingProgress',
          builder: (context, params) => TrainingProgressWidget(),
        ),
        FFRoute(
          name: 'TestUpdate',
          path: '/testUpdate',
          builder: (context, params) => TestUpdateWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            time: params.getParam(
              'time',
              ParamType.String,
            ),
            description: params.getParam(
              'description',
              ParamType.String,
            ),
            questions: params.getParam<dynamic>(
              'questions',
              ParamType.JSON,
              isList: true,
            ),
            godScore: params.getParam(
              'godScore',
              ParamType.int,
            ),
            status: params.getParam(
              'status',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'BranchList',
          path: '/branchList',
          builder: (context, params) => BranchListWidget(),
        ),
        FFRoute(
          name: 'StaffDetail',
          path: '/staffDetail',
          builder: (context, params) => StaffDetailWidget(
            staffDetail: params.getParam(
              'staffDetail',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'DepartmentList',
          path: '/departmentList',
          builder: (context, params) => DepartmentListWidget(),
        ),
        FFRoute(
          name: 'DepartmentDetail',
          path: '/departmentDetail',
          builder: (context, params) => DepartmentDetailWidget(
            items: params.getParam(
              'items',
              ParamType.JSON,
            ),
            checkCode: params.getParam<String>(
              'checkCode',
              ParamType.String,
              isList: true,
            ),
            programs: params.getParam<ProgramStruct>(
              'programs',
              ParamType.DataStruct,
              isList: true,
              structBuilder: ProgramStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'DepartmentCreate',
          path: '/departmentCreate',
          builder: (context, params) => DepartmentCreateWidget(
            checkCode: params.getParam<String>(
              'checkCode',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'BranchDetail',
          path: '/branchDetail',
          builder: (context, params) => BranchDetailWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            code: params.getParam(
              'code',
              ParamType.String,
            ),
            description: params.getParam(
              'description',
              ParamType.String,
            ),
            codeListitem: params.getParam<String>(
              'codeListitem',
              ParamType.String,
              isList: true,
            ),
            status: params.getParam(
              'status',
              ParamType.String,
            ),
            itemNameList: params.getParam<String>(
              'itemNameList',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'TaskList',
          path: '/taskList',
          builder: (context, params) => TaskListWidget(
            checkRouter: params.getParam(
              'checkRouter',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'DepartmentUpdate',
          path: '/departmentUpdate',
          builder: (context, params) => DepartmentUpdateWidget(
            checkCode: params.getParam<String>(
              'checkCode',
              ParamType.String,
              isList: true,
            ),
            items: params.getParam(
              'items',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'SignUp',
          path: '/signUp',
          builder: (context, params) => SignUpWidget(),
        ),
        FFRoute(
          name: 'TaskListDone',
          path: '/taskListDone',
          builder: (context, params) => TaskListDoneWidget(),
        ),
        FFRoute(
          name: 'TaskListWait',
          path: '/taskListWait',
          builder: (context, params) => TaskListWaitWidget(),
        ),
        FFRoute(
          name: 'ListBranchProfile',
          path: '/listBranchProfile',
          builder: (context, params) => ListBranchProfileWidget(),
        ),
        FFRoute(
          name: 'ReportImage',
          path: '/reportImage',
          builder: (context, params) => ReportImageWidget(),
        ),
        FFRoute(
          name: 'ProfileCPN',
          path: '/profileCPN',
          builder: (context, params) => ProfileCPNWidget(),
        ),
        FFRoute(
          name: 'UpdateProfileCPN',
          path: '/updateProfileCPN',
          builder: (context, params) => UpdateProfileCPNWidget(
            data: params.getParam(
              'data',
              ParamType.DataStruct,
              isList: false,
              structBuilder: OrganizationListStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'ListStaffProfileCompany',
          path: '/listStaffProfileCompany',
          builder: (context, params) => ListStaffProfileCompanyWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            nameBranch: params.getParam(
              'nameBranch',
              ParamType.String,
            ),
            boPhan: params.getParam(
              'boPhan',
              ParamType.String,
            ),
            checkScroll: params.getParam(
              'checkScroll',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'DetailProfileCPN',
          path: '/detailProfileCPN',
          builder: (context, params) => DetailProfileCPNWidget(),
        ),
        FFRoute(
          name: 'LessonsListUser',
          path: '/lessonsListUser',
          builder: (context, params) => LessonsListUserWidget(),
        ),
        FFRoute(
          name: 'ProfileUser',
          path: '/profileUser',
          builder: (context, params) => ProfileUserWidget(),
        ),
        FFRoute(
          name: 'UpdateProfileUser',
          path: '/updateProfileUser',
          builder: (context, params) => UpdateProfileUserWidget(
            data: params.getParam(
              'data',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'EditPassword',
          path: '/editPassword',
          builder: (context, params) => EditPasswordWidget(),
        ),
        FFRoute(
          name: 'TaskDetail',
          path: '/taskDetail',
          builder: (context, params) => TaskDetailWidget(
            workflowId: params.getParam(
              'workflowId',
              ParamType.String,
            ),
            publishedCount: params.getParam(
              'publishedCount',
              ParamType.int,
            ),
            paramBack: params.getParam(
              'paramBack',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ProcessTemplateList',
          path: '/processTemplateList',
          builder: (context, params) => ProcessTemplateListWidget(),
        ),
        FFRoute(
          name: 'ProcessTemplateDetail',
          path: '/processTemplateDetail',
          builder: (context, params) => ProcessTemplateDetailWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'WorkResultList',
          path: '/workResultList',
          builder: (context, params) => WorkResultListWidget(),
        ),
        FFRoute(
          name: 'WorkResultDetail',
          path: '/workResultDetail',
          builder: (context, params) => WorkResultDetailWidget(
            workflowId: params.getParam(
              'workflowId',
              ParamType.String,
            ),
            publishedCount: params.getParam(
              'publishedCount',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'OperationList',
          path: '/operationList',
          builder: (context, params) => OperationListWidget(),
        ),
        FFRoute(
          name: 'LessonLists_Homepage',
          path: '/lessonListsHomepage',
          builder: (context, params) => LessonListsHomepageWidget(),
        ),
        FFRoute(
          name: 'MarketPlaceDraft',
          path: '/marketPlaceDraft',
          builder: (context, params) => MarketPlaceDraftWidget(),
        ),
        FFRoute(
          name: 'MarketPlace',
          path: '/marketPlace',
          builder: (context, params) => MarketPlaceWidget(),
        ),
        FFRoute(
          name: 'ProgramListMarket',
          path: '/programListMarket',
          builder: (context, params) => ProgramListMarketWidget(
            price: params.getParam(
              'price',
              ParamType.String,
            ),
            idAuthor: params.getParam(
              'idAuthor',
              ParamType.String,
            ),
            idDomain: params.getParam(
              'idDomain',
              ParamType.String,
            ),
            domainToProgramListMarket: params.getParam(
              'domainToProgramListMarket',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'CategoryMarket',
          path: '/categoryMarket',
          builder: (context, params) => CategoryMarketWidget(),
        ),
        FFRoute(
          name: 'AuthorList',
          path: '/authorList',
          builder: (context, params) => AuthorListWidget(),
        ),
        FFRoute(
          name: 'StudyProgramRank',
          path: '/studyProgramRank',
          builder: (context, params) => StudyProgramRankWidget(),
        ),
        FFRoute(
          name: 'AuthorMarketProfile',
          path: '/authorMarketProfile',
          builder: (context, params) => AuthorMarketProfileWidget(
            itemAuthors: params.getParam(
              'itemAuthors',
              ParamType.DataStruct,
              isList: false,
              structBuilder: AuthorsListStruct.fromSerializableMap,
            ),
            checkBackPage: params.getParam(
              'checkBackPage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ProgramMarketDetail',
          path: '/programMarketDetail',
          builder: (context, params) => ProgramMarketDetailWidget(
            idProgram: params.getParam(
              'idProgram',
              ParamType.String,
            ),
            price: params.getParam(
              'price',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'AuthorProfile',
          path: '/authorProfile',
          builder: (context, params) => AuthorProfileWidget(),
        ),
        FFRoute(
          name: 'OrderList',
          path: '/orderList',
          builder: (context, params) => OrderListWidget(),
        ),
        FFRoute(
          name: 'StudyProgramListUser',
          path: '/studyProgramListUser',
          builder: (context, params) => StudyProgramListUserWidget(
            checkStatusPrograms: params.getParam(
              'checkStatusPrograms',
              ParamType.String,
            ),
            staffId: params.getParam(
              'staffId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Staffs_programs_lesson',
          path: '/staffsProgramsLesson',
          builder: (context, params) => StaffsProgramsLessonWidget(
            programsId: params.getParam(
              'programsId',
              ParamType.String,
            ),
            lessionId: params.getParam(
              'lessionId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'StudyProgramListMarket',
          path: '/studyProgramListMarket',
          builder: (context, params) => StudyProgramListMarketWidget(
            checkpage: params.getParam(
              'checkpage',
              ParamType.String,
            ),
            checkback: params.getParam(
              'checkback',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ReportStaff',
          path: '/reportStaff',
          builder: (context, params) => ReportStaffWidget(),
        ),
        FFRoute(
          name: 'ReportStaffDetail',
          path: '/reportTaskDetail',
          builder: (context, params) => ReportStaffDetailWidget(
            staffId: params.getParam(
              'staffId',
              ParamType.String,
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            department: params.getParam(
              'department',
              ParamType.String,
            ),
            branch: params.getParam(
              'branch',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ProfileUserNew',
          path: '/profileUserNew',
          builder: (context, params) => ProfileUserNewWidget(
            staffId: params.getParam(
              'staffId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ProfileUserSetting',
          path: '/profileUserSetting',
          builder: (context, params) => ProfileUserSettingWidget(),
        ),
        FFRoute(
          name: 'Newsfeed',
          path: '/newsfeed',
          builder: (context, params) => NewsfeedWidget(),
        ),
        FFRoute(
          name: 'NewsfeedDetail',
          path: '/newsfeedDetail',
          builder: (context, params) => NewsfeedDetailWidget(
            newsfeedId: params.getParam(
              'newsfeedId',
              ParamType.String,
            ),
            checkpage: params.getParam(
              'checkpage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'NewsfeedListRequire',
          path: '/newsfeedListRequire',
          builder: (context, params) => NewsfeedListRequireWidget(
            checkScope: params.getParam(
              'checkScope',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Processing',
          path: '/processing',
          builder: (context, params) => ProcessingWidget(),
        ),
        FFRoute(
          name: 'CertificateList',
          path: '/certificateList',
          builder: (context, params) => CertificateListWidget(),
        ),
        FFRoute(
          name: 'Home',
          path: '/home',
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: 'IntroScreenDraft',
          path: '/introScreenDraft',
          builder: (context, params) => IntroScreenDraftWidget(),
        ),
        FFRoute(
          name: 'IntroScreen',
          path: '/introScreen',
          builder: (context, params) => IntroScreenWidget(),
        ),
        FFRoute(
          name: 'StudyProgramDetail',
          path: '/studyProgramDetail',
          builder: (context, params) => StudyProgramDetailWidget(
            studyProgramList: params.getParam(
              'studyProgramList',
              ParamType.DataStruct,
              isList: false,
              structBuilder: StudyProgramListStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'TimekeepingList',
          path: '/timekeepingList',
          builder: (context, params) => TimekeepingListWidget(),
        ),
        FFRoute(
          name: 'TimekeepingCreate',
          path: '/timekeepingCreate',
          builder: (context, params) => TimekeepingCreateWidget(),
        ),
        FFRoute(
          name: 'TimeKeeping',
          path: '/timeKeeping',
          builder: (context, params) => TimeKeepingWidget(
            checkShowFilter: params.getParam(
              'checkShowFilter',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'TimekeepingLocationList',
          path: '/timekeepingLocationList',
          builder: (context, params) => TimekeepingLocationListWidget(),
        ),
        FFRoute(
          name: 'TimekeepingShiftList',
          path: '/timekeepingShiftList',
          builder: (context, params) => TimekeepingShiftListWidget(),
        ),
        FFRoute(
          name: 'TimekeepingReport',
          path: '/timekeepingReport',
          builder: (context, params) => TimekeepingReportWidget(),
        ),
        FFRoute(
          name: 'TimekeepingDetail',
          path: '/timekeepingDetail',
          builder: (context, params) => TimekeepingDetailWidget(
            itemDetail: params.getParam(
              'itemDetail',
              ParamType.DataStruct,
              isList: false,
              structBuilder: ShiftConfigsStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'TimekeepingUpdate',
          path: '/timekeepingUpdate',
          builder: (context, params) => TimekeepingUpdateWidget(
            itemDetail: params.getParam(
              'itemDetail',
              ParamType.DataStruct,
              isList: false,
              structBuilder: ShiftConfigsStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'LessonLists_HomepageDraft',
          path: '/lessonListsHomepageDraft',
          builder: (context, params) => LessonListsHomepageDraftWidget(),
        ),
        FFRoute(
          name: 'LessonsListNavbar',
          path: '/lessonsListNavbar',
          builder: (context, params) => LessonsListNavbarWidget(
            checkpage: params.getParam(
              'checkpage',
              ParamType.String,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
