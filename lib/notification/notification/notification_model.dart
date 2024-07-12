import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notification_widget.dart' show NotificationWidget;
import 'package:flutter/material.dart';

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

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - tokenReload] action in Notification widget.
  bool? checkTokenNoti;
  // Stores action output result for [Backend Call - API (StaffGetOne)] action in Notification widget.
  ApiCallResponse? apiResultStaffNoti;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
