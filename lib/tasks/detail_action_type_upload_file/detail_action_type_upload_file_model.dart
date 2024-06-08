import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detail_action_type_upload_file_widget.dart'
    show DetailActionTypeUploadFileWidget;
import 'package:flutter/material.dart';

class DetailActionTypeUploadFileModel
    extends FlutterFlowModel<DetailActionTypeUploadFileWidget> {
  ///  Local state fields for this component.

  int loop = 0;

  List<FileIDDataTypeStruct> listFileId = [];
  void addToListFileId(FileIDDataTypeStruct item) => listFileId.add(item);
  void removeFromListFileId(FileIDDataTypeStruct item) =>
      listFileId.remove(item);
  void removeAtIndexFromListFileId(int index) => listFileId.removeAt(index);
  void insertAtIndexInListFileId(int index, FileIDDataTypeStruct item) =>
      listFileId.insert(index, item);
  void updateListFileIdAtIndex(
          int index, Function(FileIDDataTypeStruct) updateFn) =>
      listFileId[index] = updateFn(listFileId[index]);

  List<FFUploadedFile> listFileUpload = [];
  void addToListFileUpload(FFUploadedFile item) => listFileUpload.add(item);
  void removeFromListFileUpload(FFUploadedFile item) =>
      listFileUpload.remove(item);
  void removeAtIndexFromListFileUpload(int index) =>
      listFileUpload.removeAt(index);
  void insertAtIndexInListFileUpload(int index, FFUploadedFile item) =>
      listFileUpload.insert(index, item);
  void updateListFileUploadAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      listFileUpload[index] = updateFn(listFileUpload[index]);

  List<String> listStringId = [];
  void addToListStringId(String item) => listStringId.add(item);
  void removeFromListStringId(String item) => listStringId.remove(item);
  void removeAtIndexFromListStringId(int index) => listStringId.removeAt(index);
  void insertAtIndexInListStringId(int index, String item) =>
      listStringId.insert(index, item);
  void updateListStringIdAtIndex(int index, Function(String) updateFn) =>
      listStringId[index] = updateFn(listStringId[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - tokenReload] action in IconButton widget.
  bool? downloadFileToken;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? uploadFileToken;
  // Stores action output result for [Backend Call - API (UploadListFile)] action in Button widget.
  ApiCallResponse? apiResultUploadFile;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
