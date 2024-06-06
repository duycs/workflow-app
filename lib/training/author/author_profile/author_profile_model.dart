import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
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
import '/flutter_flow/custom_functions.dart' as functions;
import 'author_profile_widget.dart' show AuthorProfileWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AuthorProfileModel extends FlutterFlowModel<AuthorProfileWidget> {
  ///  Local state fields for this page.

  AuthorsListStruct? author;
  void updateAuthorStruct(Function(AuthorsListStruct) updateFn) =>
      updateFn(author ??= AuthorsListStruct());

  List<MarketLessonListStruct> programs = [];
  void addToPrograms(MarketLessonListStruct item) => programs.add(item);
  void removeFromPrograms(MarketLessonListStruct item) => programs.remove(item);
  void removeAtIndexFromPrograms(int index) => programs.removeAt(index);
  void insertAtIndexInPrograms(int index, MarketLessonListStruct item) =>
      programs.insert(index, item);
  void updateProgramsAtIndex(
          int index, Function(MarketLessonListStruct) updateFn) =>
      programs[index] = updateFn(programs[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks.
  Future getOneAuthor(BuildContext context) async {
    bool? getOneAuthor;
    ApiCallResponse? apiResultGetOneAuthors;

    getOneAuthor = await action_blocks.tokenReload(context);
    if (getOneAuthor!) {
      apiResultGetOneAuthors = await GroupAuthorsGroup.getOneAuthorsCall.call(
        accessToken: FFAppState().accessToken,
        id: getJsonField(
          FFAppState().staffOrganization,
          r'''$.authors[0]''',
        ).toString().toString(),
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
            '{\"_and\":[{\"template\":{\"_eq\":\"1\"}},{\"author_id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffOrganization,
          r'''$.authors[0]''',
        ).toString().toString()}\"}}]}',
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
}
