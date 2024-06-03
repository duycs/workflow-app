import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/rating_staf_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/market/filter_programs/filter_programs_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'market_place_widget.dart' show MarketPlaceWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MarketPlaceModel extends FlutterFlowModel<MarketPlaceWidget> {
  ///  Local state fields for this page.

  List<MarketLessonListStruct> listDataProgramsFree = [];
  void addToListDataProgramsFree(MarketLessonListStruct item) =>
      listDataProgramsFree.add(item);
  void removeFromListDataProgramsFree(MarketLessonListStruct item) =>
      listDataProgramsFree.remove(item);
  void removeAtIndexFromListDataProgramsFree(int index) =>
      listDataProgramsFree.removeAt(index);
  void insertAtIndexInListDataProgramsFree(
          int index, MarketLessonListStruct item) =>
      listDataProgramsFree.insert(index, item);
  void updateListDataProgramsFreeAtIndex(
          int index, Function(MarketLessonListStruct) updateFn) =>
      listDataProgramsFree[index] = updateFn(listDataProgramsFree[index]);

  List<MarketLessonListStruct> listDataProgramsNoFree = [];
  void addToListDataProgramsNoFree(MarketLessonListStruct item) =>
      listDataProgramsNoFree.add(item);
  void removeFromListDataProgramsNoFree(MarketLessonListStruct item) =>
      listDataProgramsNoFree.remove(item);
  void removeAtIndexFromListDataProgramsNoFree(int index) =>
      listDataProgramsNoFree.removeAt(index);
  void insertAtIndexInListDataProgramsNoFree(
          int index, MarketLessonListStruct item) =>
      listDataProgramsNoFree.insert(index, item);
  void updateListDataProgramsNoFreeAtIndex(
          int index, Function(MarketLessonListStruct) updateFn) =>
      listDataProgramsNoFree[index] = updateFn(listDataProgramsNoFree[index]);

  List<MarketLessonListStruct> listDataProgramsAll = [];
  void addToListDataProgramsAll(MarketLessonListStruct item) =>
      listDataProgramsAll.add(item);
  void removeFromListDataProgramsAll(MarketLessonListStruct item) =>
      listDataProgramsAll.remove(item);
  void removeAtIndexFromListDataProgramsAll(int index) =>
      listDataProgramsAll.removeAt(index);
  void insertAtIndexInListDataProgramsAll(
          int index, MarketLessonListStruct item) =>
      listDataProgramsAll.insert(index, item);
  void updateListDataProgramsAllAtIndex(
          int index, Function(MarketLessonListStruct) updateFn) =>
      listDataProgramsAll[index] = updateFn(listDataProgramsAll[index]);

  List<AuthorsListStruct> listDataAuthors = [];
  void addToListDataAuthors(AuthorsListStruct item) =>
      listDataAuthors.add(item);
  void removeFromListDataAuthors(AuthorsListStruct item) =>
      listDataAuthors.remove(item);
  void removeAtIndexFromListDataAuthors(int index) =>
      listDataAuthors.removeAt(index);
  void insertAtIndexInListDataAuthors(int index, AuthorsListStruct item) =>
      listDataAuthors.insert(index, item);
  void updateListDataAuthorsAtIndex(
          int index, Function(AuthorsListStruct) updateFn) =>
      listDataAuthors[index] = updateFn(listDataAuthors[index]);

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

  String domain = '';

  String author = '';

  String category = '';

  String priceMin = '';

  String priceMax = '';

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
  Future getProgramsMarketFree(BuildContext context) async {
    ApiCallResponse? apiResultGetList;
    bool? checkRefreshTokenBlock;

    apiResultGetList =
        await GroupMarketLessonGroup.getListMarketLessonCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"template\":{\"_eq\":\"1\"}},{\"price\":{\"_eq\":\"0\"}}${searchMarketTextController.text != null && searchMarketTextController.text != '' ? ',{\"name\":{\"_icontains\":\"' : ' '}${searchMarketTextController.text != null && searchMarketTextController.text != '' ? searchMarketTextController.text : ' '}${searchMarketTextController.text != null && searchMarketTextController.text != '' ? '\"}}' : ' '}]}',
    );
    if ((apiResultGetList?.succeeded ?? true)) {
      listDataProgramsFree = MarketLessonListDataStruct.maybeFromMap(
              (apiResultGetList?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<MarketLessonListStruct>();
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetList?.jsonBody ?? ''),
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
        await getProgramsMarketFree(context);
      }
    }
  }

  Future getProgramsMarketNoFree(BuildContext context) async {
    ApiCallResponse? apiResultGetListNoFree;
    bool? checkRefreshTokenBlock1;

    apiResultGetListNoFree =
        await GroupMarketLessonGroup.getListMarketLessonCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"template\":{\"_eq\":\"1\"}},{\"price\":{\"_gt\":\"0\"}}${searchMarketTextController.text != null && searchMarketTextController.text != '' ? ',{\"name\":{\"_icontains\":\"' : ' '}${searchMarketTextController.text != null && searchMarketTextController.text != '' ? searchMarketTextController.text : ' '}${searchMarketTextController.text != null && searchMarketTextController.text != '' ? '\"}}' : ' '}]}',
    );
    if ((apiResultGetListNoFree?.succeeded ?? true)) {
      listDataProgramsNoFree = MarketLessonListDataStruct.maybeFromMap(
              (apiResultGetListNoFree?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<MarketLessonListStruct>();
    } else {
      checkRefreshTokenBlock1 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetListNoFree?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock1!) {
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
        await getProgramsMarketNoFree(context);
      }
    }
  }

  Future getProgramsMarketAll(BuildContext context) async {
    ApiCallResponse? apiResultGetListAll;
    bool? checkRefreshTokenBlock2;

    apiResultGetListAll =
        await GroupMarketLessonGroup.getListMarketLessonCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"template\":{\"_eq\":\"1\"}}${searchMarketTextController.text != null && searchMarketTextController.text != '' ? ',{\"name\":{\"_icontains\":\"' : ' '}${searchMarketTextController.text != null && searchMarketTextController.text != '' ? searchMarketTextController.text : ' '}${searchMarketTextController.text != null && searchMarketTextController.text != '' ? '\"}}' : ' '}${(domain != null && domain != '') && (domain != 'noData') ? ',{\"domain_id\":{\"name\":{\"_icontains\":\"' : ' '}${(domain != null && domain != '') && (domain != 'noData') ? domain : ' '}${(domain != null && domain != '') && (domain != 'noData') ? '\"}}}' : ' '}${(author != null && author != '') && (author != 'noData') ? ',{\"author_id\":{\"alias\":{\"_icontains\":\"' : ' '}${(author != null && author != '') && (author != 'noData') ? author : ' '}${(author != null && author != '') && (author != 'noData') ? '\"}}}' : ' '}${(category != null && category != '') && (category != 'noData') ? ',{\"category_id\":{\"name\":{\"_icontains\":\"' : ' '}${(category != null && category != '') && (category != 'noData') ? category : ' '}${(category != null && category != '') && (category != 'noData') ? '\"}}}' : ' '}${(priceMin != null && priceMin != '') && (priceMin != 'noData') ? ',{\"price\":{\"_gte\":\"' : ' '}${(priceMin != null && priceMin != '') && (priceMin != 'noData') ? priceMin : ' '}${(priceMin != null && priceMin != '') && (priceMin != 'noData') ? '\"}}' : ' '}${(priceMax != null && priceMax != '') && (priceMax != 'noData') ? ',{\"price\":{\"_lte\":\"' : ' '}${(priceMax != null && priceMax != '') && (priceMax != 'noData') ? priceMax : ' '}${(priceMax != null && priceMax != '') && (priceMax != 'noData') ? '\"}}' : ' '}]}',
    );
    if ((apiResultGetListAll?.succeeded ?? true)) {
      listDataProgramsAll = MarketLessonListDataStruct.maybeFromMap(
              (apiResultGetListAll?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<MarketLessonListStruct>();
    } else {
      checkRefreshTokenBlock2 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetListAll?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock2!) {
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
        await getProgramsMarketAll(context);
      }
    }
  }

  Future getListAuthors(BuildContext context) async {
    ApiCallResponse? apiResultGetListAuthors;
    bool? checkRefreshTokenBlock3;

    apiResultGetListAuthors = await GroupAuthorsGroup.listAthorsSortCall.call(
      accessToken: FFAppState().accessToken,
    );
    if ((apiResultGetListAuthors?.succeeded ?? true)) {
      listDataAuthors = AuthorsListDataStruct.maybeFromMap(
              (apiResultGetListAuthors?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<AuthorsListStruct>();
    } else {
      checkRefreshTokenBlock3 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetListAuthors?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock3!) {
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
        await getListAuthors(context);
      }
    }
  }

  Future getDomains(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock4;

    apiResultList = await GetDomainsGroup.getDomainsCall.call(
      accessToken: FFAppState().accessToken,
    );
    if ((apiResultList?.succeeded ?? true)) {
      listDataDomains = DomainsListDataDataStruct.maybeFromMap(
              (apiResultList?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<DomainsListListStruct>();
    } else {
      checkRefreshTokenBlock4 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultList?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock4!) {
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
        await getDomains(context);
      }
    }
  }
}
