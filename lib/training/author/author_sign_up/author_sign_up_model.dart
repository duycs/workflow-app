import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'author_sign_up_widget.dart' show AuthorSignUpWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

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

  int loop = 0;

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

  bool checkAvatar = false;

  bool checkDomain = false;

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
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Yêu cầu nhập giới thiệu';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? uploadFile;
  // Stores action output result for [Backend Call - API (UploadFile)] action in Button widget.
  ApiCallResponse? apiResultUploadAvatar;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? authorsSignUp;
  // Stores action output result for [Backend Call - API (AuthorsSignUp)] action in Button widget.
  ApiCallResponse? apiResultAuthorSignUp;

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
  Future getLinkDomain(BuildContext context) async {
    bool? reloadDomain;
    ApiCallResponse? apiResultGetLinkDomain;

    reloadDomain = await action_blocks.tokenReload(context);
    if (reloadDomain!) {
      apiResultGetLinkDomain = await DomainGroup.getDomainsListCall.call(
        accessToken: FFAppState().accessToken,
      );

      if ((apiResultGetLinkDomain?.succeeded ?? true)) {
        listDomain = DomainsListDataStruct.maybeFromMap(
                (apiResultGetLinkDomain?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<DomainsListStruct>();
      }
    } else {
      return;
    }
  }

  Future getListAuthors(BuildContext context) async {
    bool? getListAuthors;
    ApiCallResponse? apiResultGetListAuthors;

    getListAuthors = await action_blocks.tokenReload(context);
    if (getListAuthors!) {
      apiResultGetListAuthors = await GroupAuthorsGroup.listAuthorsCall.call(
        accessToken: FFAppState().accessToken,
      );

      if ((apiResultGetListAuthors?.succeeded ?? true)) {
        listAuthorName = (getJsonField(
          (apiResultGetListAuthors?.jsonBody ?? ''),
          r'''$.data[:].alias''',
          true,
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
      }
    } else {
      return;
    }
  }
}
