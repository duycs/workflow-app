import '/flutter_flow/flutter_flow_util.dart';
import 'chi_tiet_tien_do_cong_viec_widget.dart'
    show ChiTietTienDoCongViecWidget;
import 'package:flutter/material.dart';

class ChiTietTienDoCongViecModel
    extends FlutterFlowModel<ChiTietTienDoCongViecWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
