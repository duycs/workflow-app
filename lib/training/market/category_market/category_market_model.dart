import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'category_market_widget.dart' show CategoryMarketWidget;
import 'package:flutter/material.dart';

class CategoryMarketModel extends FlutterFlowModel<CategoryMarketWidget> {
  ///  Local state fields for this page.

  List<DomainsListListStruct> listDataDomains = [];
  void addToListDataDomains(DomainsListListStruct item) =>
      listDataDomains.add(item);
  void removeFromListDataDomains(DomainsListListStruct item) =>
      listDataDomains.remove(item);
  void removeAtIndexFromListDataDomains(int index) =>
      listDataDomains.removeAt(index);
  void insertAtIndexInListDataDomains(int index, DomainsListListStruct item) =>
      listDataDomains.insert(index, item);
  void updateListDataDomainsAtIndex(
          int index, Function(DomainsListListStruct) updateFn) =>
      listDataDomains[index] = updateFn(listDataDomains[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for searchDomains widget.
  FocusNode? searchDomainsFocusNode;
  TextEditingController? searchDomainsTextController;
  String? Function(BuildContext, String?)? searchDomainsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchDomainsFocusNode?.dispose();
    searchDomainsTextController?.dispose();
  }

  /// Action blocks.
  Future getDomains(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock;

    apiResultList = await GetDomainsGroup.getDomainsCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[${searchDomainsTextController.text != '' ? '{\"name\":{\"_icontains\":\"' : ' '}${searchDomainsTextController.text != '' ? searchDomainsTextController.text : ' '}${searchDomainsTextController.text != '' ? '\"}}' : ' '}]}',
    );
    if ((apiResultList.succeeded ?? true)) {
      listDataDomains = DomainsListDataDataStruct.maybeFromMap(
              (apiResultList.jsonBody ?? ''))!
          .data
          .toList()
          .cast<DomainsListListStruct>();
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
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getDomains(context);
      }
    }
  }
}
