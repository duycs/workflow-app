import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/study_program/filter_study_program/filter_study_program_widget.dart';
import '/training/study_program/study_program_create/study_program_create_widget.dart';
import '/training/study_program/study_program_edit/study_program_edit_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'study_program_list_widget.dart' show StudyProgramListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudyProgramListModel extends FlutterFlowModel<StudyProgramListWidget> {
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
  void updateMetaStruct(Function(MetaDataStruct) updateFn) =>
      updateFn(meta ??= MetaDataStruct());

  bool isLoad = false;

  String? checkShow;

  String? nameSearch = '';

  String? dateEndSearch = '';

  String? dateStartSearch = '';

  String? lessionsNameSearch = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in StudyProgramList widget.
  bool? tokenReloadStudyProgramList;
  // Stores action output result for [Backend Call - API (StudyProgramList)] action in StudyProgramList widget.
  ApiCallResponse? apiResultStudyProgramList;
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
  Future getListProgram(BuildContext context) async {
    bool? tokenReloadCallBackGetListProgram;
    ApiCallResponse? apiResultStudyProgramListSearch;

    tokenReloadCallBackGetListProgram =
        await action_blocks.tokenReload(context);
    if (tokenReloadCallBackGetListProgram!) {
      apiResultStudyProgramListSearch =
          await StudyProgramGroup.studyProgramListCall.call(
        accessToken: FFAppState().accessToken,
        filter: '{\"_and\":[{}${(nameSearch != null && nameSearch != '') && (nameSearch != ' ') ? ',{\"name\":{\"_icontains\":\"${nameSearch}\"}}' : ' '}${(lessionsNameSearch != null && lessionsNameSearch != '') && (lessionsNameSearch != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"name\":{\"_icontains\":\"${lessionsNameSearch}\"}}}}' : ' '}${(dateStartSearch != null && dateStartSearch != '') && (dateStartSearch != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"date_created\":{\"_gte\":\"${dateStartSearch}\"}}}}' : ' '}${(dateEndSearch != null && dateEndSearch != '') && (dateEndSearch != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"date_created\":{\"_lte\":\"${(String var1) {
            return DateTime.parse(var1).add(Duration(days: 1)).toString();
          }(dateEndSearch!)}\"}}}}' : ' '}${',{\"organization_id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffLogin,
          r'''$.organization_id''',
        ).toString().toString()}\"}}'}]}',
      );
      if ((apiResultStudyProgramListSearch?.succeeded ?? true)) {
        dataList = StudyProgramListDataStruct.maybeFromMap(
                (apiResultStudyProgramListSearch?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<StudyProgramListStruct>();
        meta = StudyProgramListDataStruct.maybeFromMap(
                (apiResultStudyProgramListSearch?.jsonBody ?? ''))
            ?.meta;
        checkShow = null;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Lỗi tải dữ liệu!',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }

      isLoad = true;
    } else {
      FFAppState().update(() {});
      return;
    }
  }
}
