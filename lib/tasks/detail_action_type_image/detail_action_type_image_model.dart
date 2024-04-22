import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detail_action_type_image_widget.dart' show DetailActionTypeImageWidget;
import 'package:flutter/material.dart';

class DetailActionTypeImageModel
    extends FlutterFlowModel<DetailActionTypeImageWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UploadFile)] action in Button widget.
  ApiCallResponse? apiResultcd8;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
