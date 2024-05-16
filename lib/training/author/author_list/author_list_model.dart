import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'author_list_widget.dart' show AuthorListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for searchAuthors widget.
  FocusNode? searchAuthorsFocusNode;
  TextEditingController? searchAuthorsTextController;
  String? Function(BuildContext, String?)? searchAuthorsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchAuthorsFocusNode?.dispose();
    searchAuthorsTextController?.dispose();
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
}
