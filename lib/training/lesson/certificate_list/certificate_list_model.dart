import '/flutter_flow/flutter_flow_util.dart';
import 'certificate_list_widget.dart' show CertificateListWidget;
import 'package:flutter/material.dart';

class CertificateListModel extends FlutterFlowModel<CertificateListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
