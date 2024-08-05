import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'do_action_type_image_widget.dart' show DoActionTypeImageWidget;
import 'package:flutter/material.dart';

class DoActionTypeImageModel extends FlutterFlowModel<DoActionTypeImageWidget> {
  ///  Local state fields for this component.

  List<FFUploadedFile> imageUpload = [];
  void addToImageUpload(FFUploadedFile item) => imageUpload.add(item);
  void removeFromImageUpload(FFUploadedFile item) => imageUpload.remove(item);
  void removeAtIndexFromImageUpload(int index) => imageUpload.removeAt(index);
  void insertAtIndexInImageUpload(int index, FFUploadedFile item) =>
      imageUpload.insert(index, item);
  void updateImageUploadAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      imageUpload[index] = updateFn(imageUpload[index]);

  List<String> listUploadImage = [];
  void addToListUploadImage(String item) => listUploadImage.add(item);
  void removeFromListUploadImage(String item) => listUploadImage.remove(item);
  void removeAtIndexFromListUploadImage(int index) =>
      listUploadImage.removeAt(index);
  void insertAtIndexInListUploadImage(int index, String item) =>
      listUploadImage.insert(index, item);
  void updateListUploadImageAtIndex(int index, Function(String) updateFn) =>
      listUploadImage[index] = updateFn(listUploadImage[index]);

  int loop = 0;

  bool isShow = false;

  List<String> listUploadImageToDo = [];
  void addToListUploadImageToDo(String item) => listUploadImageToDo.add(item);
  void removeFromListUploadImageToDo(String item) =>
      listUploadImageToDo.remove(item);
  void removeAtIndexFromListUploadImageToDo(int index) =>
      listUploadImageToDo.removeAt(index);
  void insertAtIndexInListUploadImageToDo(int index, String item) =>
      listUploadImageToDo.insert(index, item);
  void updateListUploadImageToDoAtIndex(int index, Function(String) updateFn) =>
      listUploadImageToDo[index] = updateFn(listUploadImageToDo[index]);

  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? imageToken;
  // Stores action output result for [Backend Call - API (UploadListFile)] action in Button widget.
  ApiCallResponse? apiResultImage;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
