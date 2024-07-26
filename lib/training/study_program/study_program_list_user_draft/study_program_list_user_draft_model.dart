import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'study_program_list_user_draft_widget.dart'
    show StudyProgramListUserDraftWidget;
import 'package:flutter/material.dart';

class StudyProgramListUserDraftModel
    extends FlutterFlowModel<StudyProgramListUserDraftWidget> {
  ///  Local state fields for this page.

  List<StudyProgramListStruct> dataList = [];
  void addToDataList(StudyProgramListStruct item) => dataList.add(item);
  void removeFromDataList(StudyProgramListStruct item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, StudyProgramListStruct item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(
          int index, Function(StudyProgramListStruct) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  MetaDataStruct? meta;
  void updateMetaStruct(Function(MetaDataStruct) updateFn) {
    updateFn(meta ??= MetaDataStruct());
  }

  bool isLoad = false;

  String? checkShow;

  String? checkStudyShow;

  int loop = 0;

  String nameSearch = '';

  String dateEndSeach = '';

  String lessonNameSeach = '';

  String dateStartSeach = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldNameSearch widget.
  FocusNode? textFieldNameSearchFocusNode;
  TextEditingController? textFieldNameSearchTextController;
  String? Function(BuildContext, String?)?
      textFieldNameSearchTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldNameSearchFocusNode?.dispose();
    textFieldNameSearchTextController?.dispose();
  }

  /// Action blocks.
  Future getLinkProgram(BuildContext context) async {
    ApiCallResponse? apiResultStudyProgramList;
    ApiCallResponse? apiResultGetDoTest2;
    bool? checkRefreshTokenBlock11;
    bool? checkRefreshTokenBlock;

    apiResultStudyProgramList =
        await StudyProgramGroup.studyProgramOneCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[{}${(nameSearch != '') && (nameSearch != ' ') ? ',{\"name\":{\"_icontains\":\"$nameSearch\"}}' : '  '}${(lessonNameSeach != '') && (lessonNameSeach != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"name\":{\"_icontains\":\"$lessonNameSeach\"}}}}' : '  '}${(dateStartSeach != '') && (dateStartSeach != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"date_created\":{\"_gte\":\"$dateStartSeach\"}}}}' : ' '}${(dateEndSeach != '') && (dateEndSeach != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"date_created\":{\"_lte\":\"${(String date) {
          return DateTime.parse(date).add(const Duration(days: 1)).toString();
        }(dateEndSeach)}\"}}}}' : ' '}${',{\"departments\":{\"departments_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.department_id''',
      ).toString().toString()}\"}}}}'}]}',
    );

    if ((apiResultStudyProgramList.succeeded ?? true)) {
      dataList = StudyProgramListDataStruct.maybeFromMap(
              (apiResultStudyProgramList.jsonBody ?? ''))!
          .data
          .toList()
          .cast<StudyProgramListStruct>();
      meta = StudyProgramListDataStruct.maybeFromMap(
              (apiResultStudyProgramList.jsonBody ?? ''))
          ?.meta;
      while (loop < dataList.length) {
        if (dataList[loop].tests.isNotEmpty) {
          apiResultGetDoTest2 = await DoTestGroup.staffsTestsListCall.call(
            accessToken: FFAppState().accessToken,
            filter: '{\"_and\":[{\"staff_id\":{\"_eq\":\"${getJsonField(
              FFAppState().staffLogin,
              r'''$.id''',
            ).toString().toString()}\"}},{\"test_id\":{\"_eq\":\"${dataList[loop].tests.first.testsId.id}\"}}]}',
          );

          if ((apiResultGetDoTest2.succeeded ?? true)) {
            updateDataListAtIndex(
              loop,
              (e) => e
                ..studioIdTest = StaffsTestsListDataStruct.maybeFromMap(
                        (apiResultGetDoTest2?.jsonBody ?? ''))!
                    .data
                    .toList(),
            );
          } else {
            checkRefreshTokenBlock11 = await action_blocks.checkRefreshToken(
              context,
              jsonErrors: (apiResultGetDoTest2.jsonBody ?? ''),
            );
            if (!checkRefreshTokenBlock11!) {
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
            }
          }
        }
        loop = loop + 1;
      }
      loop = 0;
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultStudyProgramList.jsonBody ?? ''),
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
      }
    }

    isLoad = true;
  }
}
