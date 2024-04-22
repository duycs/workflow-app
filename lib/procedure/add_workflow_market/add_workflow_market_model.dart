import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_workflow_market_widget.dart' show AddWorkflowMarketWidget;
import 'package:flutter/material.dart';

class AddWorkflowMarketModel extends FlutterFlowModel<AddWorkflowMarketWidget> {
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

  // Stores action output result for [Backend Call - API (GetCategoriesList)] action in AddWorkflowMarket widget.
  ApiCallResponse? apiResultwkg;
  // Stores action output result for [Backend Call - API (GetDomainsList)] action in AddWorkflowMarket widget.
  ApiCallResponse? apiResultDomain;
  // Stores action output result for [Action Block - CheckRefreshToken] action in AddWorkflowMarket widget.
  bool? checkRefreshTokenBlocks;
  // Stores action output result for [Action Block - CheckRefreshToken] action in AddWorkflowMarket widget.
  bool? checkRefreshTokenBlocka;
  // State field(s) for DropDownDomain widget.
  String? dropDownDomainValue;
  FormFieldController<String>? dropDownDomainValueController;
  // State field(s) for DropDownCategory widget.
  String? dropDownCategoryValue;
  FormFieldController<String>? dropDownCategoryValueController;
  // Stores action output result for [Backend Call - API (workflowMarket)] action in Button widget.
  ApiCallResponse? apiResult16g;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
