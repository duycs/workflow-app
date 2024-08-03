import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detail_action_type_image_widget.dart' show DetailActionTypeImageWidget;
import 'package:flutter/material.dart';

class DetailActionTypeImageModel
    extends FlutterFlowModel<DetailActionTypeImageWidget> {
  ///  Local state fields for this component.

  List<FFUploadedFile> images = [];
  void addToImages(FFUploadedFile item) => images.add(item);
  void removeFromImages(FFUploadedFile item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, FFUploadedFile item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      images[index] = updateFn(images[index]);

  List<String> imagesList = [];
  void addToImagesList(String item) => imagesList.add(item);
  void removeFromImagesList(String item) => imagesList.remove(item);
  void removeAtIndexFromImagesList(int index) => imagesList.removeAt(index);
  void insertAtIndexInImagesList(int index, String item) =>
      imagesList.insert(index, item);
  void updateImagesListAtIndex(int index, Function(String) updateFn) =>
      imagesList[index] = updateFn(imagesList[index]);

  int loop = 0;

  bool isShow = false;

  List<String> imagesListDetail = [];
  void addToImagesListDetail(String item) => imagesListDetail.add(item);
  void removeFromImagesListDetail(String item) => imagesListDetail.remove(item);
  void removeAtIndexFromImagesListDetail(int index) =>
      imagesListDetail.removeAt(index);
  void insertAtIndexInImagesListDetail(int index, String item) =>
      imagesListDetail.insert(index, item);
  void updateImagesListDetailAtIndex(int index, Function(String) updateFn) =>
      imagesListDetail[index] = updateFn(imagesListDetail[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - tokenReload] action in IconButton widget.
  bool? downloadImageToken;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? uploadListImageToken;
  // Stores action output result for [Backend Call - API (UploadListFile)] action in Button widget.
  ApiCallResponse? apiResultUploadListImage;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
