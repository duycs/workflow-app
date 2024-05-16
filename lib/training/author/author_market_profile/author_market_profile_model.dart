import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'author_market_profile_widget.dart' show AuthorMarketProfileWidget;
import 'package:flutter/material.dart';

class AuthorMarketProfileModel
    extends FlutterFlowModel<AuthorMarketProfileWidget> {
  ///  Local state fields for this page.

  List<MarketLessonListStruct> listDataProgramsMarket = [];
  void addToListDataProgramsMarket(MarketLessonListStruct item) =>
      listDataProgramsMarket.add(item);
  void removeFromListDataProgramsMarket(MarketLessonListStruct item) =>
      listDataProgramsMarket.remove(item);
  void removeAtIndexFromListDataProgramsMarket(int index) =>
      listDataProgramsMarket.removeAt(index);
  void insertAtIndexInListDataProgramsMarket(
          int index, MarketLessonListStruct item) =>
      listDataProgramsMarket.insert(index, item);
  void updateListDataProgramsMarketAtIndex(
          int index, Function(MarketLessonListStruct) updateFn) =>
      listDataProgramsMarket[index] = updateFn(listDataProgramsMarket[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks.
  Future getProgramsMarket(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock;

    apiResultList = await GroupMarketLessonGroup.getListMarketLessonCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"template\":{\"_eq\":\"1\"}},{\"author_id\":{\"id\":{\"_eq\":\"${widget.itemAuthors?.id}\"}}}]}',
    );
    if ((apiResultList.succeeded ?? true)) {
      listDataProgramsMarket = MarketLessonListDataStruct.maybeFromMap(
              (apiResultList.jsonBody ?? ''))!
          .data
          .toList()
          .cast<MarketLessonListStruct>();
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
        await getProgramsMarket(context);
      }
    }
  }
}
