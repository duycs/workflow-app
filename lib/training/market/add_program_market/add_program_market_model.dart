import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
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
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? updatePrice;
  // Stores action output result for [Backend Call - API (UpdateStudyProgramPrice)] action in Button widget.
  ApiCallResponse? apiResultUpdatePrice;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? addMarket;
  // Stores action output result for [Backend Call - API (AddProgramMarket)] action in Button widget.
  ApiCallResponse? apiResultk6q;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
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
