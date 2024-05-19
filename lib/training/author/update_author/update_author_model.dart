import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'update_author_widget.dart' show UpdateAuthorWidget;
import 'package:flutter/material.dart';

class UpdateAuthorModel extends FlutterFlowModel<UpdateAuthorWidget> {
  ///  Local state fields for this component.

  String avatar = '';

  List<DomainsListStruct> domains = [];
  void addToDomains(DomainsListStruct item) => domains.add(item);
  void removeFromDomains(DomainsListStruct item) => domains.remove(item);
  void removeAtIndexFromDomains(int index) => domains.removeAt(index);
  void insertAtIndexInDomains(int index, DomainsListStruct item) =>
      domains.insert(index, item);
  void updateDomainsAtIndex(int index, Function(DomainsListStruct) updateFn) =>
      domains[index] = updateFn(domains[index]);

  int loop = 0;

  List<CreateDomainAuthorsStruct> selectedDomainList = [];
  void addToSelectedDomainList(CreateDomainAuthorsStruct item) =>
      selectedDomainList.add(item);
  void removeFromSelectedDomainList(CreateDomainAuthorsStruct item) =>
      selectedDomainList.remove(item);
  void removeAtIndexFromSelectedDomainList(int index) =>
      selectedDomainList.removeAt(index);
  void insertAtIndexInSelectedDomainList(
          int index, CreateDomainAuthorsStruct item) =>
      selectedDomainList.insert(index, item);
  void updateSelectedDomainListAtIndex(
          int index, Function(CreateDomainAuthorsStruct) updateFn) =>
      selectedDomainList[index] = updateFn(selectedDomainList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? uploadFileUpdate;
  // Stores action output result for [Backend Call - API (UploadFile)] action in Button widget.
  ApiCallResponse? apiResultUploadAvatarUp;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? authorsUpdate;
  // Stores action output result for [Backend Call - API (AuthorsUpdate)] action in Button widget.
  ApiCallResponse? apiResultAuthorsUpdate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }

  /// Action blocks.
  Future getDomainList(BuildContext context) async {
    bool? reloadDomainList;
    ApiCallResponse? apiResultGetDomainList;

    reloadDomainList = await action_blocks.tokenReload(context);
    if (reloadDomainList!) {
      apiResultGetDomainList = await DomainGroup.getDomainsListCall.call(
        accessToken: FFAppState().accessToken,
      );
      if ((apiResultGetDomainList.succeeded ?? true)) {
        domains = DomainsListDataStruct.maybeFromMap(
                (apiResultGetDomainList.jsonBody ?? ''))!
            .data
            .toList()
            .cast<DomainsListStruct>();
      }
    } else {
      return;
    }
  }
}
