import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'author_list_widget.dart' show AuthorListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class AuthorListModel extends FlutterFlowModel<AuthorListWidget> {
  ///  Local state fields for this page.

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

  List<AuthorsListStruct> listDataAuthorsSort = [];
  void addToListDataAuthorsSort(AuthorsListStruct item) =>
      listDataAuthorsSort.add(item);
  void removeFromListDataAuthorsSort(AuthorsListStruct item) =>
      listDataAuthorsSort.remove(item);
  void removeAtIndexFromListDataAuthorsSort(int index) =>
      listDataAuthorsSort.removeAt(index);
  void insertAtIndexInListDataAuthorsSort(int index, AuthorsListStruct item) =>
      listDataAuthorsSort.insert(index, item);
  void updateListDataAuthorsSortAtIndex(
          int index, Function(AuthorsListStruct) updateFn) =>
      listDataAuthorsSort[index] = updateFn(listDataAuthorsSort[index]);

  bool isShow = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - tokenReload] action in AuthorList widget.
  bool? checkTokentAuthor;
  // State field(s) for searchAuthors widget.
  FocusNode? searchAuthorsFocusNode;
  TextEditingController? searchAuthorsTextController;
  String? Function(BuildContext, String?)? searchAuthorsTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchAuthorsFocusNode?.dispose();
    searchAuthorsTextController?.dispose();

    listViewPagingController?.dispose();
  }

  /// Action blocks.
  Future getListAuthors(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock;

    apiResultList = await GroupAuthorsGroup.listAuthorsCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[${searchAuthorsTextController.text != null && searchAuthorsTextController.text != '' ? '{\"alias\":{\"_icontains\":\"' : ' '}${searchAuthorsTextController.text != null && searchAuthorsTextController.text != '' ? searchAuthorsTextController.text : ' '}${searchAuthorsTextController.text != null && searchAuthorsTextController.text != '' ? '\"}}' : ' '}]}',
    );

    if ((apiResultList?.succeeded ?? true)) {
      listDataAuthors =
          AuthorsListDataStruct.maybeFromMap((apiResultList?.jsonBody ?? ''))!
              .data
              .toList()
              .cast<AuthorsListStruct>();
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
                color: FlutterFlowTheme.of(context).secondaryBackground,
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

  Future getListAuthorsSort(BuildContext context) async {
    ApiCallResponse? apiResultListSort;
    bool? checkRefreshTokenBlock1;

    apiResultListSort = await GroupAuthorsGroup.listAthorsSortCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[${searchAuthorsTextController.text != null && searchAuthorsTextController.text != '' ? '{\"alias\":{\"_icontains\":\"' : ' '}${searchAuthorsTextController.text != null && searchAuthorsTextController.text != '' ? searchAuthorsTextController.text : ' '}${searchAuthorsTextController.text != null && searchAuthorsTextController.text != '' ? '\"}}' : ' '}]}',
      limit: 10,
      offset: 0,
    );

    if ((apiResultListSort?.succeeded ?? true)) {
      listDataAuthorsSort = AuthorsListDataStruct.maybeFromMap(
              (apiResultListSort?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<AuthorsListStruct>();
    } else {
      checkRefreshTokenBlock1 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultListSort?.jsonBody ?? ''),
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
        await getListAuthorsSort(context);
      }
    }
  }

  /// Additional helper methods.
  PagingController<ApiPagingParams, dynamic> setListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall = apiCall;
    return listViewPagingController ??= _createListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewListAuthorsPage);
  }

  void listViewListAuthorsPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewListAuthorsResponse) {
        final pageItems = (AuthorsListDataStruct.maybeFromMap(
                        listViewListAuthorsResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewListAuthorsResponse,
                )
              : null,
        );
      });
}
