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
  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập tên';
    }

    if (val.length > 50) {
      return 'Tên không được nhập quá 50 kí tự';
    }

    return null;
  }

  // State field(s) for hotline widget.
  FocusNode? hotlineFocusNode;
  TextEditingController? hotlineTextController;
  String? Function(BuildContext, String?)? hotlineTextControllerValidator;
  String? _hotlineTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }

    if (!RegExp('(03|05|07|08|09)+([0-9]{8})\\b').hasMatch(val)) {
      return 'Số điện thoại không hợp lệ';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Yêu cầu nhập email';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  String? _addressTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 12) {
      return 'CCCD không hợp lệ';
    }
    if (val.length > 12) {
      return 'CCCD không hợp lệ';
    }

    return null;
  }

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
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    hotlineTextControllerValidator = _hotlineTextControllerValidator;
    textController3Validator = _textController3Validator;
    addressTextControllerValidator = _addressTextControllerValidator;
  }

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
