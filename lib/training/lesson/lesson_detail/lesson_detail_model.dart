import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'lesson_detail_widget.dart' show LessonDetailWidget;
import 'package:flutter/material.dart';

class LessonDetailModel extends FlutterFlowModel<LessonDetailWidget> {
  ///  Local state fields for this page.

  List<dynamic> list = [];
  void addToList(dynamic item) => list.add(item);
  void removeFromList(dynamic item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, dynamic item) => list.insert(index, item);
  void updateListAtIndex(int index, Function(dynamic) updateFn) =>
      list[index] = updateFn(list[index]);

  dynamic listDetail;

  String checkFile = '1';

  List<dynamic> listStaffIdHeart = [];
  void addToListStaffIdHeart(dynamic item) => listStaffIdHeart.add(item);
  void removeFromListStaffIdHeart(dynamic item) =>
      listStaffIdHeart.remove(item);
  void removeAtIndexFromListStaffIdHeart(int index) =>
      listStaffIdHeart.removeAt(index);
  void insertAtIndexInListStaffIdHeart(int index, dynamic item) =>
      listStaffIdHeart.insert(index, item);
  void updateListStaffIdHeartAtIndex(int index, Function(dynamic) updateFn) =>
      listStaffIdHeart[index] = updateFn(listStaffIdHeart[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks.
  Future getComments(BuildContext context) async {
    ApiCallResponse? apiResultGetCommment;
    bool? checkRefreshTokenBlock;

    apiResultGetCommment = await LessonGroup.getLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[{\"id\":{\"_eq\":\"${widget.idLesson}\"}}]}',
    );

    if ((apiResultGetCommment.succeeded ?? true)) {
      list = getJsonField(
        (apiResultGetCommment.jsonBody ?? ''),
        r'''$.data[0].comments''',
        true,
      )!
          .toList()
          .cast<dynamic>();
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetCommment.jsonBody ?? ''),
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
        await getComments(context);
      }
    }
  }

  Future getDetail(BuildContext context) async {
    ApiCallResponse? apiResultGetDetail;
    bool? checkRefreshTokenBlock1;

    apiResultGetDetail = await LessonGroup.getLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[{\"id\":{\"_eq\":\"${widget.idLesson}\"}}]}',
    );

    if ((apiResultGetDetail.succeeded ?? true)) {
      listDetail = getJsonField(
        (apiResultGetDetail.jsonBody ?? ''),
        r'''$.data[0]''',
      );
    } else {
      checkRefreshTokenBlock1 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetDetail.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock1!) {
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
        await getDetail(context);
      }
    }
  }

  Future getHeart(BuildContext context) async {
    ApiCallResponse? apiResultHeart;
    bool? checkRefreshTokenBlock2;

    apiResultHeart = await LessonGroup.getLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[{\"id\":{\"_eq\":\"${getJsonField(
        listDetail,
        r'''$.id''',
      ).toString().toString()}\"}}]}',
    );

    if ((apiResultHeart.succeeded ?? true)) {
      listStaffIdHeart = getJsonField(
        (apiResultHeart.jsonBody ?? ''),
        r'''$.data[0].reacts''',
        true,
      )!
          .toList()
          .cast<dynamic>();
    } else {
      checkRefreshTokenBlock2 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultHeart.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock2!) {
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
        await getHeart(context);
      }
    }
  }
}
