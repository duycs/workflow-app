import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'program_market_detail_widget.dart' show ProgramMarketDetailWidget;
import 'package:flutter/material.dart';

class ProgramMarketDetailModel
    extends FlutterFlowModel<ProgramMarketDetailWidget> {
  ///  Local state fields for this page.

  MarketLessonListStruct? dataGetOne;
  void updateDataGetOneStruct(Function(MarketLessonListStruct) updateFn) =>
      updateFn(dataGetOne ??= MarketLessonListStruct());

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
    if ((apiResultListGetOne.succeeded ?? true)) {
      dataGetOne = MarketLessonListStruct.maybeFromMap(getJsonField(
        (apiResultListGetOne.jsonBody ?? ''),
        r'''$.data''',
      ));
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultListGetOne.jsonBody ?? ''),
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
    if ((apiResultPost.succeeded ?? true)) {
      var confirmDialogResponse = await showDialog<bool>(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: const Text('Thông báo!'),
                content: const Text('Áp dụng khoá học cho cá nhân thành công!'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, false),
                    child: const Text('Ở lại'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, true),
                    child: const Text('Học khoá học'),
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
            kTransitionInfoKey: const TransitionInfo(
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
        jsonErrors: (apiResultPost.jsonBody ?? ''),
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
      programId: widget.idProgram,
    );
    if ((apiResultPostCopy.succeeded ?? true)) {
      var confirmDialogResponse = await showDialog<bool>(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: const Text('Thông báo!'),
                content: const Text('Áp dụng khoá học cho tổ chức thành công!'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, false),
                    child: const Text('Ở lại'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, true),
                    child: const Text('Xem khoá học'),
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
            kTransitionInfoKey: const TransitionInfo(
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
        jsonErrors: (apiResultPostCopy.jsonBody ?? ''),
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
        await postCopyStaffPrograms(context);
      }

      return;
    }
  }
}
