import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'program_list_market_widget.dart' show ProgramListMarketWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProgramListMarketModel extends FlutterFlowModel<ProgramListMarketWidget> {
  ///  Local state fields for this page.

  List<MarketLessonListStruct> listPrograms = [];
  void addToListPrograms(MarketLessonListStruct item) => listPrograms.add(item);
  void removeFromListPrograms(MarketLessonListStruct item) =>
      listPrograms.remove(item);
  void removeAtIndexFromListPrograms(int index) => listPrograms.removeAt(index);
  void insertAtIndexInListPrograms(int index, MarketLessonListStruct item) =>
      listPrograms.insert(index, item);
  void updateListProgramsAtIndex(
          int index, Function(MarketLessonListStruct) updateFn) =>
      listPrograms[index] = updateFn(listPrograms[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for searchMarket widget.
  FocusNode? searchMarketFocusNode;
  TextEditingController? searchMarketTextController;
  String? Function(BuildContext, String?)? searchMarketTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchMarketFocusNode?.dispose();
    searchMarketTextController?.dispose();
  }

  /// Action blocks.
  Future getProgramsList(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock;

    apiResultList = await GroupMarketLessonGroup.getListMarketLessonCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[{\"template\":{\"_eq\":\"1\"}}${() {
        if (widget.price == 'free') {
          return ',{\"price\":{\"_eq\":\"0\"}}';
        } else if (widget.price == 'NoFree') {
          return ',{\"price\":{\"_gt\":\"0\"}}';
        } else {
          return ' ';
        }
      }()}${searchMarketTextController.text != null && searchMarketTextController.text != '' ? ',{\"name\":{\"_icontains\":\"' : ' '}${searchMarketTextController.text != null && searchMarketTextController.text != '' ? searchMarketTextController.text : ' '}${searchMarketTextController.text != null && searchMarketTextController.text != '' ? '\"}}' : ' '}]}',
    );
    if ((apiResultList?.succeeded ?? true)) {
      listPrograms = MarketLessonListDataStruct.maybeFromMap(
              (apiResultList?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<MarketLessonListStruct>();
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
        await getProgramsList(context);
      }
    }
  }
}
