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
                color: FlutterFlowTheme.of(context).primaryText,
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
}
