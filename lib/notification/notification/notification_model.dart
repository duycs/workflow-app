import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'notification_widget.dart' show NotificationWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationModel extends FlutterFlowModel<NotificationWidget> {
  ///  Local state fields for this component.

  List<dynamic> notiList = [];
  void addToNotiList(dynamic item) => notiList.add(item);
  void removeFromNotiList(dynamic item) => notiList.remove(item);
  void removeAtIndexFromNotiList(int index) => notiList.removeAt(index);
  void insertAtIndexInNotiList(int index, dynamic item) =>
      notiList.insert(index, item);
  void updateNotiListAtIndex(int index, Function(dynamic) updateFn) =>
      notiList[index] = updateFn(notiList[index]);

  bool isLoad = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - tokenReload] action in Notification widget.
  bool? checkTokenNoti;
  // Stores action output result for [Backend Call - API (StaffGetOne)] action in Notification widget.
  ApiCallResponse? apiResultStaffNoti;
  // Stores action output result for [Action Block - tokenReload] action in Container widget.
  bool? checkTokenNotiStatus;
  // Stores action output result for [Backend Call - API (UpdateStatusNotification)] action in Container widget.
  ApiCallResponse? apiResultbz5;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
