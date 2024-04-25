import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'lesson_list_homepage_widget.dart' show LessonListHomepageWidget;
import 'package:flutter/material.dart';

class LessonListHomepageModel
    extends FlutterFlowModel<LessonListHomepageWidget> {
  ///  Local state fields for this page.

  List<EmployeeLessonListStruct> listLesson = [];
  void addToListLesson(EmployeeLessonListStruct item) => listLesson.add(item);
  void removeFromListLesson(EmployeeLessonListStruct item) =>
      listLesson.remove(item);
  void removeAtIndexFromListLesson(int index) => listLesson.removeAt(index);
  void insertAtIndexInListLesson(int index, EmployeeLessonListStruct item) =>
      listLesson.insert(index, item);
  void updateListLessonAtIndex(
          int index, Function(EmployeeLessonListStruct) updateFn) =>
      listLesson[index] = updateFn(listLesson[index]);

  String status = '';

  String? dateStartList = '0';

  String? dateEndList = '0';

  String statusLesson = '';

  String statusLove = '';

  String lessonFavoriteStatusList = '';

  String programsId = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nameSearch widget.
  FocusNode? nameSearchFocusNode;
  TextEditingController? nameSearchTextController;
  String? Function(BuildContext, String?)? nameSearchTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameSearchFocusNode?.dispose();
    nameSearchTextController?.dispose();
  }

  /// Action blocks.
  Future getListLesson(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock;

    apiResultList = await LessonGroup.employeeLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[{\"staff_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}}${nameSearchTextController.text != '' ? ',' : ' '}${nameSearchTextController.text != '' ? '{\"lession_id\":{\"name\":{\"_icontains\":\"' : ' '}${nameSearchTextController.text != '' ? nameSearchTextController.text : ' '}${nameSearchTextController.text != '' ? '\"}}}' : ' '}${(status != '') && (status != 'noData') ? ',' : ' '}${(status != '') && (status != 'noData') ? '{\"lession_id\":{\"status\":{\"_icontains\":\"' : ' '}${(status != '') && (status != 'noData') ? status : ' '}${(status != '') && (status != 'noData') ? '\"}}}' : ' '}${(dateStartList != null && dateStartList != '') && (dateStartList != '0') ? ',' : ' '}${(dateStartList != null && dateStartList != '') && (dateStartList != '0') ? '{\"lession_id\":{\"date_created\":{\"_gte\":\"' : ' '}${(dateStartList != null && dateStartList != '') && (dateStartList != '0') ? dateStartList : ' '}${(dateStartList != null && dateStartList != '') && (dateStartList != '0') ? '\"}}}' : ' '}${(dateEndList != null && dateEndList != '') && (dateEndList != '0') ? ',' : ' '}${(dateEndList != null && dateEndList != '') && (dateEndList != '0') ? '{\"lession_id\":{\"date_created\":{\"_lte\":\"' : ' '}${(dateEndList != null && dateEndList != '') && (dateEndList != '0') ? ((String var1) {
          return DateTime.parse(var1).add(const Duration(days: 1)).toString();
        }(dateEndList!)) : ' '}${(dateEndList != null && dateEndList != '') && (dateEndList != '0') ? '\"}}}' : ' '}${(statusLesson != '') && (statusLesson != 'noData') ? ',' : ' '}${(statusLesson != '') && (statusLesson != 'noData') ? '{\"status\":{\"_eq\":\"' : ' '}${(statusLesson != '') && (statusLesson != 'noData') ? statusLesson : ' '}${(statusLesson != '') && (statusLesson != 'noData') ? '\"}}' : ' '}${(lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? ',' : ' '}${(lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? '{\"lession_id\":{\"reacts\":{\"reacts_id\":{\"status\":{\"_eq\":\"' : ' '}${(lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? lessonFavoriteStatusList : ' '}${(lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? '\"}}}}}, {\"lession_id\":{\"reacts\":{\"reacts_id\":{\"staff_id\":{\"_eq\":\"' : ' '}${(lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? FFAppState().staffid : ' '}${(lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? '\"}}}}}' : ' '}${widget.statusLesson != null && widget.statusLesson != '' ? ',{\"status\":{\"_eq\":\"' : ' '}${widget.statusLesson != null && widget.statusLesson != '' ? widget.statusLesson : ' '}${widget.statusLesson != null && widget.statusLesson != '' ? '\"}}' : ' '}${(widget.statusLove != null && widget.statusLove != '') && (widget.statusLove == 'love') ? ',{\"lession_id\":{\"reacts\":{\"reacts_id\":{\"status\":{\"_eq\":\"love\"}}}}}, {\"lession_id\":{\"reacts\":{\"reacts_id\":{\"staff_id\":{\"_eq\":\"' : ' '}${(widget.statusLove != null && widget.statusLove != '') && (widget.statusLove == 'love') ? FFAppState().staffid : ' '}${(widget.statusLove != null && widget.statusLove != '') && (widget.statusLove == 'love') ? '\"}}}}}' : ' '}${(widget.lessonNewCreate != null && widget.lessonNewCreate != '') && (widget.lessonNewCreate == 'dateToday') ? ',{\"lession_id\":{\"date_created\":{\"_gte\":\"' : ' '}${(widget.lessonNewCreate != null && widget.lessonNewCreate != '') && (widget.lessonNewCreate == 'dateToday') ? functions.aDayInThePast(getCurrentTimestamp) : ' '}${(widget.lessonNewCreate != null && widget.lessonNewCreate != '') && (widget.lessonNewCreate == 'dateToday') ? '\"}}},{\"lession_id\":{\"date_created\":{\"_lte\":\"' : ' '}${(widget.lessonNewCreate != null && widget.lessonNewCreate != '') && (widget.lessonNewCreate == 'dateToday') ? ((String var1) {
          return DateTime.parse(var1).add(const Duration(days: 1)).toString();
        }(dateTimeFormat('yyyy-MM-dd', getCurrentTimestamp))) : ' '}${(widget.lessonNewCreate != null && widget.lessonNewCreate != '') && (widget.lessonNewCreate == 'dateToday') ? '\"}}}' : ' '}${(widget.lesonHistory != null && widget.lesonHistory != '') || (widget.lesonHistory == 'lessonHistory') ? ',{\"_and\":[{\"lession_id\":{\"date_created\":{\"_gte\":\"' : ' '}${(widget.lesonHistory != null && widget.lesonHistory != '') || (widget.lesonHistory == 'lessonHistory') ? functions.aDayInThePast(getCurrentTimestamp) : ' '}${(widget.lesonHistory != null && widget.lesonHistory != '') || (widget.lesonHistory == 'lessonHistory') ? '\"}}},{\"lession_id\":{\"date_created\":{\"_lte\":\"' : ' '}${(widget.lesonHistory != null && widget.lesonHistory != '') || (widget.lesonHistory == 'lessonHistory') ? ((String var1) {
          return DateTime.parse(var1).add(const Duration(days: 1)).toString();
        }(dateTimeFormat('yyyy-MM-dd', getCurrentTimestamp))) : ' '}${(widget.lesonHistory != null && widget.lesonHistory != '') || (widget.lesonHistory == 'lessonHistory') ? '\"}}}]},{\"_or\":[{\"status\":{\"_eq\":\"done\"}},{\"status\":{\"_eq\":\"inprogress\"}}]}' : ' '}${programsId != '' ? ',{\"lession_id\":{\"programs\":{\"programs_id\":{\"id\":{\"_eq\":\"' : ' '}${programsId != '' ? programsId : ' '}${programsId != '' ? '\"}}}}}' : ' '}]}',
    );
    if ((apiResultList.succeeded ?? true)) {
      listLesson = EmployeeLessonListDataStruct.maybeFromMap(
              (apiResultList.jsonBody ?? ''))!
          .data
          .toList()
          .cast<EmployeeLessonListStruct>();
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultList.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getListLesson(context);
      }
    }
  }
}
