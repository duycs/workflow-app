import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/training/author/update_author/update_author_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'author_profile_widget.dart' show AuthorProfileWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AuthorProfileModel extends FlutterFlowModel<AuthorProfileWidget> {
  ///  Local state fields for this page.

  AuthorsListStruct? author;
  void updateAuthorStruct(Function(AuthorsListStruct) updateFn) {
    updateFn(author ??= AuthorsListStruct());
  }

  List<MarketLessonListStruct> programs = [];
  void addToPrograms(MarketLessonListStruct item) => programs.add(item);
  void removeFromPrograms(MarketLessonListStruct item) => programs.remove(item);
  void removeAtIndexFromPrograms(int index) => programs.removeAt(index);
  void insertAtIndexInPrograms(int index, MarketLessonListStruct item) =>
      programs.insert(index, item);
  void updateProgramsAtIndex(
          int index, Function(MarketLessonListStruct) updateFn) =>
      programs[index] = updateFn(programs[index]);

  bool checkLoad = false;

  String checkClick = '1';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in AuthorProfile widget.
  bool? reloadTockenLesstion;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController1;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall1;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  List<String>? get choiceChipsValues1 => choiceChipsValueController1?.value;
  set choiceChipsValues1(List<String>? val) =>
      choiceChipsValueController1?.value = val;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController2;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall2;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  List<String>? get choiceChipsValues2 => choiceChipsValueController2?.value;
  set choiceChipsValues2(List<String>? val) =>
      choiceChipsValueController2?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    listViewPagingController1?.dispose();
    listViewPagingController2?.dispose();
  }

  /// Action blocks.
  Future getOneAuthor(BuildContext context) async {
    bool? getOneAuthor;
    ApiCallResponse? apiResultGetOneAuthors;

    getOneAuthor = await action_blocks.tokenReload(context);
    if (getOneAuthor!) {
      apiResultGetOneAuthors = await GroupAuthorsGroup.getOneAuthorsCall.call(
        accessToken: FFAppState().accessToken,
        id: FFAppState().Author.toString(),
      );

      if ((apiResultGetOneAuthors?.succeeded ?? true)) {
        author = AuthorsListStruct.maybeFromMap(getJsonField(
          (apiResultGetOneAuthors?.jsonBody ?? ''),
          r'''$.data''',
        ));
      }
    }
  }

  Future getListProgramAuthors(BuildContext context) async {
    bool? getListProgramAuthors;
    ApiCallResponse? apiResultGetListProgram;

    getListProgramAuthors = await action_blocks.tokenReload(context);
    if (getListProgramAuthors!) {
      apiResultGetListProgram =
          await GroupMarketLessonGroup.getListMarketLessonCall.call(
        accessToken: FFAppState().accessToken,
        filter:
            '{\"_and\":[{\"template\":{\"_eq\":\"1\"}},{\"author_id\":{\"_eq\":\"${FFAppState().Author.toString()}\"}}]}',
      );

      if ((apiResultGetListProgram?.succeeded ?? true)) {
        programs = MarketLessonListDataStruct.maybeFromMap(
                (apiResultGetListProgram?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<MarketLessonListStruct>();
      }
    }
  }

  /// Additional helper methods.
  PagingController<ApiPagingParams, dynamic> setListViewController1(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall1 = apiCall;
    return listViewPagingController1 ??= _createListViewController1(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController1(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewGetListMarketLessonPage1);
  }

  void listViewGetListMarketLessonPage1(ApiPagingParams nextPageMarker) =>
      listViewApiCall1!(nextPageMarker)
          .then((listViewGetListMarketLessonResponse) {
        final pageItems = (MarketLessonListDataStruct.maybeFromMap(
                        listViewGetListMarketLessonResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController1?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetListMarketLessonResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setListViewController2(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall2 = apiCall;
    return listViewPagingController2 ??= _createListViewController2(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController2(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewGetListMarketLessonPage2);
  }

  void listViewGetListMarketLessonPage2(ApiPagingParams nextPageMarker) =>
      listViewApiCall2!(nextPageMarker)
          .then((listViewGetListMarketLessonResponse) {
        final pageItems = (MarketLessonListDataStruct.maybeFromMap(
                        listViewGetListMarketLessonResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController2?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetListMarketLessonResponse,
                )
              : null,
        );
      });
}
