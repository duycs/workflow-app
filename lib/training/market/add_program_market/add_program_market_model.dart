import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/training/market/checkbox_lessions/checkbox_lessions_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'add_program_market_widget.dart' show AddProgramMarketWidget;
import 'package:flutter/material.dart';

class AddProgramMarketModel extends FlutterFlowModel<AddProgramMarketWidget> {
  ///  Local state fields for this component.

  List<CategoriesListStruct> categoryList = [];
  void addToCategoryList(CategoriesListStruct item) => categoryList.add(item);
  void removeFromCategoryList(CategoriesListStruct item) =>
      categoryList.remove(item);
  void removeAtIndexFromCategoryList(int index) => categoryList.removeAt(index);
  void insertAtIndexInCategoryList(int index, CategoriesListStruct item) =>
      categoryList.insert(index, item);
  void updateCategoryListAtIndex(
          int index, Function(CategoriesListStruct) updateFn) =>
      categoryList[index] = updateFn(categoryList[index]);

  List<DomainsListStruct> domainList = [];
  void addToDomainList(DomainsListStruct item) => domainList.add(item);
  void removeFromDomainList(DomainsListStruct item) => domainList.remove(item);
  void removeAtIndexFromDomainList(int index) => domainList.removeAt(index);
  void insertAtIndexInDomainList(int index, DomainsListStruct item) =>
      domainList.insert(index, item);
  void updateDomainListAtIndex(
          int index, Function(DomainsListStruct) updateFn) =>
      domainList[index] = updateFn(domainList[index]);

  bool isLoad = false;

  int loop = 0;

  List<String> checkProgram = [];
  void addToCheckProgram(String item) => checkProgram.add(item);
  void removeFromCheckProgram(String item) => checkProgram.remove(item);
  void removeAtIndexFromCheckProgram(int index) => checkProgram.removeAt(index);
  void insertAtIndexInCheckProgram(int index, String item) =>
      checkProgram.insert(index, item);
  void updateCheckProgramAtIndex(int index, Function(String) updateFn) =>
      checkProgram[index] = updateFn(checkProgram[index]);

  List<dynamic> programID = [];
  void addToProgramID(dynamic item) => programID.add(item);
  void removeFromProgramID(dynamic item) => programID.remove(item);
  void removeAtIndexFromProgramID(int index) => programID.removeAt(index);
  void insertAtIndexInProgramID(int index, dynamic item) =>
      programID.insert(index, item);
  void updateProgramIDAtIndex(int index, Function(dynamic) updateFn) =>
      programID[index] = updateFn(programID[index]);

  List<String> indexCheckbox = [];
  void addToIndexCheckbox(String item) => indexCheckbox.add(item);
  void removeFromIndexCheckbox(String item) => indexCheckbox.remove(item);
  void removeAtIndexFromIndexCheckbox(int index) =>
      indexCheckbox.removeAt(index);
  void insertAtIndexInIndexCheckbox(int index, String item) =>
      indexCheckbox.insert(index, item);
  void updateIndexCheckboxAtIndex(int index, Function(String) updateFn) =>
      indexCheckbox[index] = updateFn(indexCheckbox[index]);

  StudyProgramListStruct? checkBoxLession;
  void updateCheckBoxLessionStruct(Function(StudyProgramListStruct) updateFn) {
    updateFn(checkBoxLession ??= StudyProgramListStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - tokenReload] action in AddProgramMarket widget.
  bool? tokenReloadAddWorkflowMarket;
  // Stores action output result for [Backend Call - API (GetCategoriesList)] action in AddProgramMarket widget.
  ApiCallResponse? apiResultwkg;
  // Stores action output result for [Backend Call - API (GetDomainsList)] action in AddProgramMarket widget.
  ApiCallResponse? apiResultDomain;
  // Stores action output result for [Action Block - CheckRefreshToken] action in AddProgramMarket widget.
  bool? checkRefreshTokenBlocks;
  // Stores action output result for [Action Block - CheckRefreshToken] action in AddProgramMarket widget.
  bool? checkRefreshTokenBlocka;
  // State field(s) for DropDownDomain widget.
  String? dropDownDomainValue;
  FormFieldController<String>? dropDownDomainValueController;
  // State field(s) for DropDownCategory widget.
  String? dropDownCategoryValue;
  FormFieldController<String>? dropDownCategoryValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for SwitchOn widget.
  bool? switchOnValue;
  // State field(s) for SwitchOff widget.
  bool? switchOffValue;
  // Models for checkboxLessions dynamic component.
  late FlutterFlowDynamicModels<CheckboxLessionsModel> checkboxLessionsModels;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? updatePrice;
  // Stores action output result for [Backend Call - API (UpdateStudyProgramPrice)] action in Button widget.
  ApiCallResponse? apiResultUpdatePrice;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? addMarket;
  // Stores action output result for [Backend Call - API (AddProgramMarket)] action in Button widget.
  ApiCallResponse? apiResultk6q;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? reloadTockenStudyProgramGetOne;
  // Stores action output result for [Backend Call - API (StudyProgramGetOne)] action in Button widget.
  ApiCallResponse? apiResultProgramsOne;
  // Stores action output result for [Backend Call - API (UpdateLessonStatusMarket)] action in Button widget.
  ApiCallResponse? apiResulti06;

  @override
  void initState(BuildContext context) {
    checkboxLessionsModels =
        FlutterFlowDynamicModels(() => CheckboxLessionsModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    checkboxLessionsModels.dispose();
  }

  /// Action blocks.
  Future deletePreProgramVersion(BuildContext context) async {
    bool? getProgramPreVersion;
    ApiCallResponse? apiResultGetPreProgram;
    bool? deleteProgram;
    ApiCallResponse? apiResultDeleteProgram;

    if (widget.version! > 0) {
      getProgramPreVersion = await action_blocks.tokenReload(context);
      if (getProgramPreVersion!) {
        apiResultGetPreProgram =
            await StudyProgramGroup.studyProgramOneCall.call(
          accessToken: FFAppState().accessToken,
          filter:
              '{\"_and\":[{\"template\":{\"_eq\":\"1\"}},{\"version\":{\"_eq\":\"${widget.version?.toString()}\"}},{\"copyright_program_id\":{\"_eq\":\"${widget.id}\"}}]}',
        );

        if ((apiResultGetPreProgram.succeeded ?? true)) {
          deleteProgram = await action_blocks.tokenReload(context);
          if (!deleteProgram!) {
            return;
          }
        } else {
          return;
        }

        apiResultDeleteProgram = await StudyProgramGroup.deleteProgramCall.call(
          accessToken: FFAppState().accessToken,
          id: getJsonField(
            (apiResultGetPreProgram.jsonBody ?? ''),
            r'''$.data[0].id''',
          ).toString().toString(),
        );

        if ((apiResultDeleteProgram.succeeded ?? true)) {
        } else {
          return;
        }
      } else {
        return;
      }
    }
  }
}
