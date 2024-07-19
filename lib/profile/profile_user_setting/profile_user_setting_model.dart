import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/confirm_password/confirm_password_widget.dart';
import '/training/do_test/delete_account/delete_account_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import 'profile_user_setting_widget.dart' show ProfileUserSettingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileUserSettingModel
    extends FlutterFlowModel<ProfileUserSettingWidget> {
  ///  Local state fields for this page.

  StaffListStruct? profileUser;
  void updateProfileUserStruct(Function(StaffListStruct) updateFn) {
    updateFn(profileUser ??= StaffListStruct());
  }

  dynamic user;

  DataSettingStruct? dataSetting;
  void updateDataSettingStruct(Function(DataSettingStruct) updateFn) {
    updateFn(dataSetting ??= DataSettingStruct());
  }

  bool? load = false;

  bool checkLogin = false;

  bool isSetPublicKeyInSecureStorage = false;

  bool isLoaded = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - biometricGetPublicKey] action in ProfileUserSetting widget.
  String? biometricPublicKey;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // Stores action output result for [Custom Action - authenticateUsingBiometricsSetting] action in SwitchListTile widget.
  bool? authenticateUsingBiometriceSetting1;
  // Stores action output result for [Action Block - tokenReload] action in SwitchListTile widget.
  bool? checktokenReloadBiometricsSetting;
  // Stores action output result for [Custom Action - createBiometricPublicKey] action in SwitchListTile widget.
  String? publicKey;
  // Stores action output result for [Backend Call - API (UpdateBiometricVerificationWork)] action in SwitchListTile widget.
  ApiCallResponse? apiResultUpdateBiometric;
  // Stores action output result for [Backend Call - API (UserMe)] action in SwitchListTile widget.
  ApiCallResponse? apiResultUpdateUser;
  // Stores action output result for [Custom Action - authenticateUsingBiometricsSetting] action in SwitchListTile widget.
  bool? authenticateUsingBiometriceSettingLoadOff1;
  // Stores action output result for [Action Block - tokenReload] action in SwitchListTile widget.
  bool? checktokenReloadBiometricsSetting3;
  // Stores action output result for [Custom Action - deleteBiometricKeyPair] action in SwitchListTile widget.
  bool? deleteBiometricKeyPair;
  // Stores action output result for [Backend Call - API (UpdateBiometricVerificationWork)] action in SwitchListTile widget.
  ApiCallResponse? apiResultUpdateBiometric1;
  // Stores action output result for [Backend Call - API (UserMe)] action in SwitchListTile widget.
  ApiCallResponse? apiResultUpdateUserCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
