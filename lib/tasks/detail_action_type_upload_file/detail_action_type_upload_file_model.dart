import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detail_action_type_upload_file_widget.dart'
    show DetailActionTypeUploadFileWidget;
import 'package:flutter/material.dart';

class DetailActionTypeUploadFileModel
    extends FlutterFlowModel<DetailActionTypeUploadFileWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UploadFile)] action in Button widget.
  ApiCallResponse? apiResult7cn;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
