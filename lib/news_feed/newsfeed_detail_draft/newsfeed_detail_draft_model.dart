import '/flutter_flow/flutter_flow_util.dart';
import 'newsfeed_detail_draft_widget.dart' show NewsfeedDetailDraftWidget;
import 'package:flutter/material.dart';

class NewsfeedDetailDraftModel
    extends FlutterFlowModel<NewsfeedDetailDraftWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
