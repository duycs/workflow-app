import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'do_action_type_upload_file_widget.dart'
    show DoActionTypeUploadFileWidget;
import 'package:flutter/material.dart';

class DoActionTypeUploadFileModel
    extends FlutterFlowModel<DoActionTypeUploadFileWidget> {
  ///  Local state fields for this component.

  List<String> fileName = [];
  void addToFileName(String item) => fileName.add(item);
  void removeFromFileName(String item) => fileName.remove(item);
  void removeAtIndexFromFileName(int index) => fileName.removeAt(index);
  void insertAtIndexInFileName(int index, String item) =>
      fileName.insert(index, item);
  void updateFileNameAtIndex(int index, Function(String) updateFn) =>
      fileName[index] = updateFn(fileName[index]);

  bool isShowPdf = false;

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

  int loop = 0;

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
