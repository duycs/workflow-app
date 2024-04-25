import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_profile_user_widget.dart' show UpdateProfileUserWidget;
import 'package:flutter/material.dart';

class UpdateProfileUserModel extends FlutterFlowModel<UpdateProfileUserWidget> {
  ///  Local state fields for this page.

  String image = ' ';

  String date = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for hotline widget.
  FocusNode? hotlineFocusNode;
  TextEditingController? hotlineTextController;
  String? Function(BuildContext, String?)? hotlineTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? reloadTokenUpdateStaff;
  // Stores action output result for [Backend Call - API (UploadFile)] action in Button widget.
  ApiCallResponse? apiResultUploadImage;
  // Stores action output result for [Backend Call - API (UpdateStaff)] action in Button widget.
  ApiCallResponse? apiResultUpdateStaff;
  // Stores action output result for [Backend Call - API (UpdateUserStaff)] action in Button widget.
  ApiCallResponse? apiResultUpdateUserStaff;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? reloadTokenUpdateStaff1;
  // Stores action output result for [Backend Call - API (UpdateStaff)] action in Button widget.
  ApiCallResponse? apiResultUpdateStaff1;
  // Stores action output result for [Backend Call - API (UpdateUserStaff)] action in Button widget.
  ApiCallResponse? apiResultUpdateUserStaff1;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    hotlineFocusNode?.dispose();
    hotlineTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();
  }
}
