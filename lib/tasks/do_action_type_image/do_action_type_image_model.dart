import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'do_action_type_image_widget.dart' show DoActionTypeImageWidget;
import 'package:flutter/material.dart';

class DoActionTypeImageModel extends FlutterFlowModel<DoActionTypeImageWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UploadFile)] action in Button widget.
  ApiCallResponse? apiResultImage;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
