import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'filter_lesson_home_page_widget.dart' show FilterLessonHomePageWidget;
import 'package:flutter/material.dart';

class FilterLessonHomePageModel
    extends FlutterFlowModel<FilterLessonHomePageWidget> {
  ///  Local state fields for this component.

  String? status = '';

  DateTime? dateStart;

  DateTime? dateEnd;

  DateTime? dateStartCPN;

  DateTime? dateEndCPN;

  String? lessonFavoritStatus = '';

  List<StudyProgramListStruct> programList = [];
  void addToProgramList(StudyProgramListStruct item) => programList.add(item);
  void removeFromProgramList(StudyProgramListStruct item) =>
      programList.remove(item);
  void removeAtIndexFromProgramList(int index) => programList.removeAt(index);
  void insertAtIndexInProgramList(int index, StudyProgramListStruct item) =>
      programList.insert(index, item);
  void updateProgramListAtIndex(
          int index, Function(StudyProgramListStruct) updateFn) =>
      programList[index] = updateFn(programList[index]);

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for LessonFavoriteStatus widget.
  String? lessonFavoriteStatusValue;
  FormFieldController<String>? lessonFavoriteStatusValueController;
  // State field(s) for programs widget.
  String? programsValue;
  FormFieldController<String>? programsValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future programs(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock;

    apiResultList = await StudyProgramGroup.studyProgramListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[${'{\"organization_id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}},{\"status\":{\"_eq\":\"published\"}}'}${widget!.checkPrograms != 'programs' ? ' ,{\"departments\":{\"departments_id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffDepartment,
          r'''$.id''',
        ).toString().toString()}\"}}}' : ' '}${widget!.checkPrograms == 'programs' ? ',{\"departments\":{\"departments_id\":{\"_neq\":\"${getJsonField(
          FFAppState().staffDepartment,
          r'''$.id''',
        ).toString().toString()}\"}}}' : ' '}]}',
    );

    if ((apiResultList.succeeded ?? true)) {
      programList = StudyProgramListDataStruct.maybeFromMap(
              (apiResultList.jsonBody ?? ''))!
          .data
          .toList()
          .cast<StudyProgramListStruct>();
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
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await programs(context);
      }
    }
  }
}
