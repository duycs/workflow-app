import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

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
      errorBuilder: (context, state) => const LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => const LoginWidget(),
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
          ),
        ),
        FFRoute(
          name: 'LessonNote',
          path: '/lessonNote',
          builder: (context, params) => const LessonNoteWidget(),
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
          ),
        ),
        FFRoute(
          name: 'TrainingProgressUser',
          path: '/trainingProgressUser',
          builder: (context, params) => const TrainingProgressUserWidget(),
        ),
        FFRoute(
          name: 'QuanLyQuyTrinh_2',
          path: '/quanLyQuyTrinh2',
          builder: (context, params) => const QuanLyQuyTrinh2Widget(),
        ),
        FFRoute(
          name: 'TaoMoiQuyTrinh_1',
          path: '/taoMoiQuyTrinh1',
          builder: (context, params) => const TaoMoiQuyTrinh1Widget(),
        ),
        FFRoute(
          name: 'TaoMoiQuyTrinh-2',
          path: '/taoMoiQuyTrinh2',
          builder: (context, params) => const TaoMoiQuyTrinh2Widget(),
        ),
        FFRoute(
          name: 'chitietbuoc',
          path: '/chitietbuoc',
          builder: (context, params) => const ChitietbuocWidget(),
        ),
        FFRoute(
          name: 'ProcedurePublishedList',
          path: '/procedurePublishedList',
          builder: (context, params) => const ProcedurePublishedListWidget(),
        ),
        FFRoute(
          name: 'ChiTietTienDoCongViec',
          path: '/chiTietTienDoCongViec',
          builder: (context, params) => const ChiTietTienDoCongViecWidget(),
        ),
        FFRoute(
          name: 'StudyProgramList',
          path: '/studyProgramList',
          builder: (context, params) => const StudyProgramListWidget(),
        ),
        FFRoute(
          name: 'Tasks',
          path: '/tasks',
          builder: (context, params) => const TasksWidget(),
        ),
        FFRoute(
          name: 'TaoCongViecMoi_Nhap',
          path: '/taoCongViecMoiNhap',
          builder: (context, params) => const TaoCongViecMoiNhapWidget(),
        ),
        FFRoute(
          name: 'TrainingManage',
          path: '/trainingManage',
          builder: (context, params) => const TrainingManageWidget(),
        ),
        FFRoute(
          name: 'PersonnalDraft',
          path: '/personnalDraft',
          builder: (context, params) => const PersonnalDraftWidget(),
        ),
        FFRoute(
          name: 'TrainingRankList',
          path: '/trainingRankList',
          builder: (context, params) => const TrainingRankListWidget(),
        ),
        FFRoute(
          name: 'TrainingRankCreate',
          path: '/trainingRankCreate',
          builder: (context, params) => const TrainingRankCreateWidget(),
        ),
        FFRoute(
          name: 'StaffCreate',
          path: '/staffCreate',
          builder: (context, params) => const StaffCreateWidget(),
        ),
        FFRoute(
          name: 'ProdureStepDetailDraft',
          path: '/produreStepDetailDraft',
          builder: (context, params) => const ProdureStepDetailDraftWidget(),
        ),
        FFRoute(
          name: 'Home09Dashboard',
          path: '/home09Dashboard',
          builder: (context, params) => const Home09DashboardWidget(),
        ),
        FFRoute(
          name: 'QuanLyQuyTrinh-1',
          path: '/quanLyQuyTrinh1',
          builder: (context, params) => const QuanLyQuyTrinh1Widget(),
        ),
        FFRoute(
          name: 'ProcedureList',
          path: '/procedureList',
          builder: (context, params) => const ProcedureListWidget(),
        ),
        FFRoute(
          name: 'Nhap1',
          path: '/nhap1',
          builder: (context, params) => const Nhap1Widget(),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          builder: (context, params) => const ProfileWidget(),
        ),
        FFRoute(
          name: 'PersonnelList',
          path: '/personnelList',
          builder: (context, params) => const PersonnelListWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'ProdureStep01',
          path: '/produreStep01',
          builder: (context, params) => const ProdureStep01Widget(),
        ),
        FFRoute(
          name: 'ProdureStep02',
          path: '/produreStep02',
          builder: (context, params) => const ProdureStep02Widget(),
        ),
        FFRoute(
          name: 'ProdureStep03',
          path: '/produreStep03',
          builder: (context, params) => const ProdureStep03Widget(),
        ),
        FFRoute(
          name: 'ProdureStep04',
          path: '/produreStep04',
          builder: (context, params) => const ProdureStep04Widget(),
        ),
        FFRoute(
          name: 'ProdureStep05',
          path: '/produreStep05',
          builder: (context, params) => const ProdureStep05Widget(),
        ),
        FFRoute(
          name: 'chitietbuocnangcaoChay',
          path: '/chitietbuocnangcaoChay',
          builder: (context, params) => const ChitietbuocnangcaoChayWidget(),
        ),
        FFRoute(
          name: 'quytrinhduocchay_chitietcongviec',
          path: '/quytrinhduocchayChitietcongviec',
          builder: (context, params) => const QuytrinhduocchayChitietcongviecWidget(),
        ),
        FFRoute(
          name: 'ProcedurePublishing',
          path: '/procedurePublishing',
          builder: (context, params) => const ProcedurePublishingWidget(),
        ),
        FFRoute(
          name: 'ProcedurePublishedDetail',
          path: '/procedurePublishedDetail',
          builder: (context, params) => const ProcedurePublishedDetailWidget(),
        ),
        FFRoute(
          name: 'TestCreate',
          path: '/testCreate',
          builder: (context, params) => const TestCreateWidget(),
        ),
        FFRoute(
          name: 'TrainingRankDetail',
          path: '/trainingRankDetail',
          builder: (context, params) => TrainingRankDetailWidget(
            tenCapBac: params.getParam(
              'tenCapBac',
              ParamType.String,
            ),
            moTa: params.getParam(
              'moTa',
              ParamType.String,
            ),
            phongBan: params.getParam(
              'phongBan',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'LessonCreate',
          path: '/lessonCreate',
          builder: (context, params) => const LessonCreateWidget(),
        ),
        FFRoute(
          name: 'TrainingRankUpdate',
          path: '/trainingRankUpdate',
          builder: (context, params) => const TrainingRankUpdateWidget(),
        ),
        FFRoute(
          name: 'LessonUpdate',
          path: '/lessonUpdate',
          builder: (context, params) => LessonUpdateWidget(
            items: params.getParam(
              'items',
              ParamType.JSON,
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
              ParamType.int,
            ),
            goodScore: params.getParam(
              'goodScore',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'DoTestList',
          path: '/doTestList',
          builder: (context, params) => const DoTestListWidget(),
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
          builder: (context, params) => const TestListWidget(),
        ),
        FFRoute(
          name: 'QuestionList',
          path: '/questionList',
          builder: (context, params) => const QuestionListWidget(),
        ),
        FFRoute(
          name: 'StudyProgramListUser',
          path: '/studyProgramListUser',
          builder: (context, params) => const StudyProgramListUserWidget(),
        ),
        FFRoute(
          name: 'LessonsList',
          path: '/lessonsList',
          builder: (context, params) => const LessonsListWidget(),
        ),
        FFRoute(
          name: 'ProcedureCreate',
          path: '/procedureCreate',
          builder: (context, params) => const ProcedureCreateWidget(),
        ),
        FFRoute(
          name: 'ProcedureUpdate',
          path: '/procedureUpdate',
          builder: (context, params) => ProcedureUpdateWidget(
            itemData: params.getParam(
              'itemData',
              ParamType.DataStruct,
              false,
              WorkflowsStepCreateStruct.fromSerializableMap,
            ),
            stepListPar: params.getParam<WorkflowsStepCreateStruct>(
              'stepListPar',
              ParamType.DataStruct,
              true,
              WorkflowsStepCreateStruct.fromSerializableMap,
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
          ),
        ),
        FFRoute(
          name: 'TrainingProgress',
          path: '/trainingProgress',
          builder: (context, params) => const TrainingProgressWidget(),
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
              true,
            ),
            godScore: params.getParam(
              'godScore',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'BranchList',
          path: '/branchList',
          builder: (context, params) => const BranchListWidget(),
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
          builder: (context, params) => const DepartmentListWidget(),
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
              true,
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
              true,
            ),
          ),
        ),
        FFRoute(
          name: 'blogs',
          path: '/blogs',
          builder: (context, params) => const BlogsWidget(),
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
              true,
            ),
            status: params.getParam(
              'status',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'TaskList',
          path: '/taskList',
          builder: (context, params) => const TaskListWidget(),
        ),
        FFRoute(
          name: 'DepartmentUpdate',
          path: '/departmentUpdate',
          builder: (context, params) => DepartmentUpdateWidget(
            checkCode: params.getParam<String>(
              'checkCode',
              ParamType.String,
              true,
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
          builder: (context, params) => const SignUpWidget(),
        ),
        FFRoute(
          name: 'TaskListDone',
          path: '/taskListDone',
          builder: (context, params) => const TaskListDoneWidget(),
        ),
        FFRoute(
          name: 'TaskListWait',
          path: '/taskListWait',
          builder: (context, params) => const TaskListWaitWidget(),
        ),
        FFRoute(
          name: 'ListBranchProfile',
          path: '/listBranchProfile',
          builder: (context, params) => const ListBranchProfileWidget(),
        ),
        FFRoute(
          name: 'ReportImage',
          path: '/reportImage',
          builder: (context, params) => const ReportImageWidget(),
        ),
        FFRoute(
          name: 'ProfileCPN',
          path: '/profileCPN',
          builder: (context, params) => const ProfileCPNWidget(),
        ),
        FFRoute(
          name: 'UpdateProfileCPN',
          path: '/updateProfileCPN',
          builder: (context, params) => UpdateProfileCPNWidget(
            data: params.getParam(
              'data',
              ParamType.DataStruct,
              false,
              OrganizationListStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'listStaffProfileCompany',
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
          ),
        ),
        FFRoute(
          name: 'DetailProfileCPN',
          path: '/detailProfileCPN',
          builder: (context, params) => const DetailProfileCPNWidget(),
        ),
        FFRoute(
          name: 'LessonsListUser',
          path: '/lessonsListUser',
          builder: (context, params) => const LessonsListUserWidget(),
        ),
        FFRoute(
          name: 'ProfileUser',
          path: '/profileUser',
          builder: (context, params) => const ProfileUserWidget(),
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
          name: 'ProcedurePublishedListCopy',
          path: '/procedurePublishedListCopy',
          builder: (context, params) => const ProcedurePublishedListCopyWidget(),
        ),
        FFRoute(
          name: 'EditPassword',
          path: '/editPassword',
          builder: (context, params) => const EditPasswordWidget(),
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
          ),
        ),
        FFRoute(
          name: 'ProcessTemplateList',
          path: '/processTemplateList',
          builder: (context, params) => const ProcessTemplateListWidget(),
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
          name: 'ProcedurePublishedListCopy2',
          path: '/procedurePublishedListCopy2',
          builder: (context, params) => const ProcedurePublishedListCopy2Widget(),
        ),
        FFRoute(
          name: 'WorkResultList',
          path: '/workResultList',
          builder: (context, params) => const WorkResultListWidget(),
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
          builder: (context, params) => const OperationListWidget(),
        ),
        FFRoute(
          name: 'LessonList_HomepageCopy',
          path: '/lessonListHomepageCopy',
          builder: (context, params) => const LessonListHomepageCopyWidget(),
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
      (state.extraMap.length == 1 &&
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
    ParamType type, [
    bool isList = false,
    StructBuilder<T>? structBuilder,
  ]) {
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

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
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
