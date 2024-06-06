import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/order/order_create/order_create_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'program_market_detail_widget.dart' show ProgramMarketDetailWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProgramMarketDetailModel
    extends FlutterFlowModel<ProgramMarketDetailWidget> {
  ///  Local state fields for this page.

  MarketLessonListStruct? dataGetOne;
  void updateDataGetOneStruct(Function(MarketLessonListStruct) updateFn) =>
      updateFn(dataGetOne ??= MarketLessonListStruct());

  List<String> listPrograms = [];
  void addToListPrograms(String item) => listPrograms.add(item);
  void removeFromListPrograms(String item) => listPrograms.remove(item);
  void removeAtIndexFromListPrograms(int index) => listPrograms.removeAt(index);
  void insertAtIndexInListPrograms(int index, String item) =>
      listPrograms.insert(index, item);
  void updateListProgramsAtIndex(int index, Function(String) updateFn) =>
      listPrograms[index] = updateFn(listPrograms[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks.
  Future getOneProgram(BuildContext context) async {
    ApiCallResponse? apiResultListGetOne;
    bool? checkRefreshTokenBlock;

    apiResultListGetOne = await GroupMarketLessonGroup.getOneProgramsCall.call(
      accessToken: FFAppState().accessToken,
      idPrograms: widget.idProgram,
    );
    if ((apiResultListGetOne?.succeeded ?? true)) {
      dataGetOne = MarketLessonListStruct.maybeFromMap(getJsonField(
        (apiResultListGetOne?.jsonBody ?? ''),
        r'''$.data''',
      ));
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultListGetOne?.jsonBody ?? ''),
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
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getOneProgram(context);
      }
    }
  }

  Future postStaffsProgramsFree(BuildContext context) async {
    ApiCallResponse? apiResultPost;
    bool? checkRefreshTokenBlock;

    apiResultPost = await StudyProgramGroup.staffsProgramsPostCall.call(
      accessToken: FFAppState().accessToken,
      requestDataJson: <String, dynamic>{
        'staff_id': getJsonField(
          FFAppState().staffLogin,
          r'''$.id''',
        ),
        'program_id': widget.idProgram,
      },
    );
    if ((apiResultPost?.succeeded ?? true)) {
      var confirmDialogResponse = await showDialog<bool>(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Thông báo!'),
                content: Text('Áp dụng khoá học cho cá nhân thành công!'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, false),
                    child: Text('Ở lại'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, true),
                    child: Text('Học khoá học'),
                  ),
                ],
              );
            },
          ) ??
          false;
      if (confirmDialogResponse) {
        context.pushNamed(
          'StudyProgramListUser',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      } else {
        return;
      }

      return;
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultPost?.jsonBody ?? ''),
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
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await postStaffsProgramsFree(context);
      }

      return;
    }
  }

  Future postCopyStaffPrograms(BuildContext context) async {
    ApiCallResponse? apiResultPostCopy;
    bool? checkRefreshTokenBlock1;

    apiResultPostCopy = await StudyProgramGroup.coppyStaffProgramsCall.call(
      accessToken: FFAppState().accessToken,
      requestDataJson: <String, dynamic>{
        'private': getJsonField(
          <String, int>{
            'map': 0,
          },
          r'''$.map''',
        ),
        'programs': getJsonField(
          <String, List<String>>{
            'map': listPrograms,
          },
          r'''$.map''',
        ),
      },
    );
    if ((apiResultPostCopy?.succeeded ?? true)) {
      var confirmDialogResponse = await showDialog<bool>(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Thông báo!'),
                content: Text('Áp dụng khoá học cho tổ chức thành công!'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, false),
                    child: Text('Ở lại'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, true),
                    child: Text('Xem khoá học'),
                  ),
                ],
              );
            },
          ) ??
          false;
      if (confirmDialogResponse) {
        context.pushNamed(
          'StudyProgramList',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      } else {
        return;
      }

      return;
    } else {
      checkRefreshTokenBlock1 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultPostCopy?.jsonBody ?? ''),
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
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await postCopyStaffPrograms(context);
      }

      return;
    }
  }
}
