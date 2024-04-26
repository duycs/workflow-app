import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/lesson/filter_lesson/filter_lesson_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'lessons_list_widget.dart' show LessonsListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  String checkAPI = '';

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
      ).toString().toString()}\"}}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? ',{\"name\":{\"_icontains\":\"' : ' '}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? nameSearchTextController.text : ' '}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? '\"}}' : ' '}${(status != null && status != '') && (status != 'noData') ? ',{\"status\":{\"_icontains\":\"' : ' '}${(status != null && status != '') && (status != 'noData') ? status : ' '}${(status != null && status != '') && (status != 'noData') ? '\"}}' : ' '}${(dateStart != null && dateStart != '') && (dateStart != 'noDate') ? ',{\"date_created\":{\"_gte\":\"' : ' '}${(dateStart != null && dateStart != '') && (dateStart != 'noDate') ? dateStart : ' '}${(dateStart != null && dateStart != '') && (dateStart != 'noDate') ? '\"}}' : ' '}${(dateEnd != null && dateEnd != '') && (dateEnd != 'noData') ? ',{\"date_created\":{\"_lte\":\"' : ' '}${(dateEnd != null && dateEnd != '') && (dateEnd != 'noData') ? ((String var1) {
          return DateTime.parse(var1).add(Duration(days: 1)).toString();
        }(dateEnd)) : ' '}${(dateEnd != null && dateEnd != '') && (dateEnd != 'noData') ? 'T23:59:03.955000Z\"}}' : ' '}${programId != null && programId != '' ? ',{\"programs\":{\"programs_id\":{\"id\":{\"_eq\":\"' : ' '}${programId != null && programId != '' ? programId : ' '}${programId != null && programId != '' ? '\"}}}}' : ' '}]}',
    );
    if ((apiResultList?.succeeded ?? true)) {
      list =
          LessonsListDataStruct.maybeFromMap((apiResultList?.jsonBody ?? ''))!
              .data
              .toList()
              .cast<LessonsStruct>();
      checkAPI = '1';
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultList?.jsonBody ?? ''),
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
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getLessons(context);
      }
    }
  }
}
