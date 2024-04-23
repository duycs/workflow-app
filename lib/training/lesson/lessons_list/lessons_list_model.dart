import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'lessons_list_widget.dart' show LessonsListWidget;
import 'package:flutter/material.dart';

class LessonsListModel extends FlutterFlowModel<LessonsListWidget> {
  ///  Local state fields for this page.

  List<LessonsStruct> list = [];
  void addToList(LessonsStruct item) => list.add(item);
  void removeFromList(LessonsStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, LessonsStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(LessonsStruct) updateFn) =>
      list[index] = updateFn(list[index]);

  String status = '';

  String dateStart = '';

  String dateEnd = '';

  String programId = '';

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
  Future getLessons(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock;

    apiResultList = await LessonGroup.getLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}}${nameSearchTextController.text != '' ? ',{\"name\":{\"_icontains\":\"' : ' '}${nameSearchTextController.text != '' ? nameSearchTextController.text : ' '}${nameSearchTextController.text != '' ? '\"}}' : ' '}${(status != '') && (status != 'noData') ? ',{\"status\":{\"_icontains\":\"' : ' '}${(status != '') && (status != 'noData') ? status : ' '}${(status != '') && (status != 'noData') ? '\"}}' : ' '}${(dateStart != '') && (dateStart != 'noDate') ? ',{\"date_created\":{\"_gte\":\"' : ' '}${(dateStart != '') && (dateStart != 'noDate') ? dateStart : ' '}${(dateStart != '') && (dateStart != 'noDate') ? '\"}}' : ' '}${(dateEnd != '') && (dateEnd != 'noData') ? ',{\"date_created\":{\"_lte\":\"' : ' '}${(dateEnd != '') && (dateEnd != 'noData') ? dateEnd : ' '}${(dateEnd != '') && (dateEnd != 'noData') ? '\"}}' : ' '}${programId != '' ? ',{\"programs\":{\"programs_id\":{\"id\":{\"_eq\":\"' : ' '}${programId != '' ? programId : ' '}${programId != '' ? '\"}}}}' : ' '}]}',
    );
    if ((apiResultList.succeeded ?? true)) {
      list =
          LessonsListDataStruct.maybeFromMap((apiResultList.jsonBody ?? ''))!
              .data
              .toList()
              .cast<LessonsStruct>();
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
        await getLessons(context);
      }
    }
  }
}
