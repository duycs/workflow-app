import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/procedure/check_box_toggle/check_box_toggle_widget.dart';
import 'domains_search_widget.dart' show DomainsSearchWidget;
import 'package:flutter/material.dart';

class DomainsSearchModel extends FlutterFlowModel<DomainsSearchWidget> {
  ///  Local state fields for this component.

  String checkHD = '';

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

  List<String> listSeacrh = [];
  void addToListSeacrh(String item) => listSeacrh.add(item);
  void removeFromListSeacrh(String item) => listSeacrh.remove(item);
  void removeAtIndexFromListSeacrh(int index) => listSeacrh.removeAt(index);
  void insertAtIndexInListSeacrh(int index, String item) =>
      listSeacrh.insert(index, item);
  void updateListSeacrhAtIndex(int index, Function(String) updateFn) =>
      listSeacrh[index] = updateFn(listSeacrh[index]);

  int loop2 = 0;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (GetDomainsList)] action in DomainsSearch widget.
  ApiCallResponse? apiResultlld;
  // State field(s) for TextName widget.
  FocusNode? textNameFocusNode;
  TextEditingController? textNameTextController;
  String? Function(BuildContext, String?)? textNameTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // Models for checkBoxToggle dynamic component.
  late FlutterFlowDynamicModels<CheckBoxToggleModel> checkBoxToggleModels;

  @override
  void initState(BuildContext context) {
    checkBoxToggleModels =
        FlutterFlowDynamicModels(() => CheckBoxToggleModel());
  }

  @override
  void dispose() {
    textNameFocusNode?.dispose();
    textNameTextController?.dispose();

    checkBoxToggleModels.dispose();
  }
}
