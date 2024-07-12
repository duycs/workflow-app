import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_user_setting_widget.dart' show ProfileUserSettingWidget;
import 'package:flutter/material.dart';

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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Custom Action - authenticateUsingBiometricsSetting] action in Switch widget.
  bool? authenticateUsingBiometricsSettingLoad;
  // Stores action output result for [Action Block - tokenReload] action in Switch widget.
  bool? tokenReloadProfileUserSetting;
  // Stores action output result for [Custom Action - sshkey] action in Switch widget.
  String? sshkeyPublicKeySettingOn;
  // Stores action output result for [Backend Call - API (UpdateBiometricVerificationWork)] action in Switch widget.
  ApiCallResponse? apiResultz8c;
  // Stores action output result for [Backend Call - API (UserMe)] action in Switch widget.
  ApiCallResponse? getUserSetting;
  // Stores action output result for [Custom Action - authenticateUsingBiometricsSetting] action in Switch widget.
  bool? authenticateUsingBiometricsSettingOff;
  // Stores action output result for [Action Block - tokenReload] action in Switch widget.
  bool? tokenReloadProfileUserSetting1;
  // Stores action output result for [Custom Action - sshkey] action in Switch widget.
  String? sshkeyPublicKeySetting;
  // Stores action output result for [Backend Call - API (UpdateBiometricVerificationWork)] action in Switch widget.
  ApiCallResponse? apiResultz8cCopy;
  // Stores action output result for [Backend Call - API (UserMe)] action in Switch widget.
  ApiCallResponse? getUserSettingOff;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // Stores action output result for [Custom Action - authenticateUsingBiometricsSetting] action in SwitchListTile widget.
  bool? authenticateUsingBiometriceSetting1;
  // Stores action output result for [Action Block - tokenReload] action in SwitchListTile widget.
  bool? checktokenReloadBiometricsSetting;
  // Stores action output result for [Backend Call - API (UpdateBiometricVerificationWork)] action in SwitchListTile widget.
  ApiCallResponse? apiResultUpdateBiometric;
  // Stores action output result for [Backend Call - API (UserMe)] action in SwitchListTile widget.
  ApiCallResponse? apiResultUpdateUser;
  // Stores action output result for [Custom Action - authenticateUsingBiometricsSetting] action in SwitchListTile widget.
  bool? authenticateUsingBiometriceSettingLoadOff1;
  // Stores action output result for [Action Block - tokenReload] action in SwitchListTile widget.
  bool? checktokenReloadBiometricsSetting3;
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
