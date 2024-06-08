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

  List<String> listAuthorName = [];
  void addToListAuthorName(String item) => listAuthorName.add(item);
  void removeFromListAuthorName(String item) => listAuthorName.remove(item);
  void removeAtIndexFromListAuthorName(int index) =>
      listAuthorName.removeAt(index);
  void insertAtIndexInListAuthorName(int index, String item) =>
      listAuthorName.insert(index, item);
  void updateListAuthorNameAtIndex(int index, Function(String) updateFn) =>
      listAuthorName[index] = updateFn(listAuthorName[index]);

  bool checkName = false;

  List<String> domainList = [];
  void addToDomainList(String item) => domainList.add(item);
  void removeFromDomainList(String item) => domainList.remove(item);
  void removeAtIndexFromDomainList(int index) => domainList.removeAt(index);
  void insertAtIndexInDomainList(int index, String item) =>
      domainList.insert(index, item);
  void updateDomainListAtIndex(int index, Function(String) updateFn) =>
      domainList[index] = updateFn(domainList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập tên tác giả';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập thông tin giới thiệu';
    }

    return null;
  }

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
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
  }

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

  Future getListAuthors(BuildContext context) async {
    bool? getListAuthors2;
    ApiCallResponse? apiResultGetListAuthors;

    getListAuthors2 = await action_blocks.tokenReload(context);
    if (getListAuthors2!) {
      apiResultGetListAuthors = await GroupAuthorsGroup.listAuthorsCall.call(
        accessToken: FFAppState().accessToken,
      );
      if ((apiResultGetListAuthors.succeeded ?? true)) {
        listAuthorName = (getJsonField(
          (apiResultGetListAuthors.jsonBody ?? ''),
          r'''$.data[:].alias''',
          true,
        ) as List)
            .map<String>((s) => s.toString())
            .toList()
            .toList()
            .cast<String>();
      }
    } else {
      return;
    }
  }
}
