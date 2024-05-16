import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'author_sign_up_widget.dart' show AuthorSignUpWidget;
import 'package:flutter/material.dart';

class AuthorSignUpModel extends FlutterFlowModel<AuthorSignUpWidget> {
  ///  Local state fields for this component.

  String avatar = '';

  List<DomainsListStruct> listDomain = [];
  void addToListDomain(DomainsListStruct item) => listDomain.add(item);
  void removeFromListDomain(DomainsListStruct item) => listDomain.remove(item);
  void removeAtIndexFromListDomain(int index) => listDomain.removeAt(index);
  void insertAtIndexInListDomain(int index, DomainsListStruct item) =>
      listDomain.insert(index, item);
  void updateListDomainAtIndex(
          int index, Function(DomainsListStruct) updateFn) =>
      listDomain[index] = updateFn(listDomain[index]);

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
      return 'Yêu cầu nhập tên';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - API (UploadFile)] action in Button widget.
  ApiCallResponse? apiResultUploadAvatar;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }

  /// Action blocks.
  Future getLinkDomain(BuildContext context) async {
    bool? reloadDomain;
    ApiCallResponse? apiResultGetLinkDomain;

    reloadDomain = await action_blocks.tokenReload(context);
    if (reloadDomain!) {
      apiResultGetLinkDomain = await DomainGroup.getDomainsListCall.call(
        accessToken: FFAppState().accessToken,
      );
      if ((apiResultGetLinkDomain.succeeded ?? true)) {
        listDomain = DomainsListDataStruct.maybeFromMap(
                (apiResultGetLinkDomain.jsonBody ?? ''))!
            .data
            .toList()
            .cast<DomainsListStruct>();
      }
    } else {
      return;
    }
  }
}
