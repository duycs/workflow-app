import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'newsfeed_create_widget.dart' show NewsfeedCreateWidget;
import 'package:flutter/material.dart';

class NewsfeedCreateModel extends FlutterFlowModel<NewsfeedCreateWidget> {
  ///  Local state fields for this component.

  List<FFUploadedFile> listImage = [];
  void addToListImage(FFUploadedFile item) => listImage.add(item);
  void removeFromListImage(FFUploadedFile item) => listImage.remove(item);
  void removeAtIndexFromListImage(int index) => listImage.removeAt(index);
  void insertAtIndexInListImage(int index, FFUploadedFile item) =>
      listImage.insert(index, item);
  void updateListImageAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      listImage[index] = updateFn(listImage[index]);

  List<FFUploadedFile> listFile = [];
  void addToListFile(FFUploadedFile item) => listFile.add(item);
  void removeFromListFile(FFUploadedFile item) => listFile.remove(item);
  void removeAtIndexFromListFile(int index) => listFile.removeAt(index);
  void insertAtIndexInListFile(int index, FFUploadedFile item) =>
      listFile.insert(index, item);
  void updateListFileAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      listFile[index] = updateFn(listFile[index]);

  List<FFUploadedFile> listVideo = [];
  void addToListVideo(FFUploadedFile item) => listVideo.add(item);
  void removeFromListVideo(FFUploadedFile item) => listVideo.remove(item);
  void removeAtIndexFromListVideo(int index) => listVideo.removeAt(index);
  void insertAtIndexInListVideo(int index, FFUploadedFile item) =>
      listVideo.insert(index, item);
  void updateListVideoAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      listVideo[index] = updateFn(listVideo[index]);

  int loop = 0;

  List<FileDataTypeStruct> listImageId = [];
  void addToListImageId(FileDataTypeStruct item) => listImageId.add(item);
  void removeFromListImageId(FileDataTypeStruct item) =>
      listImageId.remove(item);
  void removeAtIndexFromListImageId(int index) => listImageId.removeAt(index);
  void insertAtIndexInListImageId(int index, FileDataTypeStruct item) =>
      listImageId.insert(index, item);
  void updateListImageIdAtIndex(
          int index, Function(FileDataTypeStruct) updateFn) =>
      listImageId[index] = updateFn(listImageId[index]);

  List<FileDataTypeStruct> listVideoId = [];
  void addToListVideoId(FileDataTypeStruct item) => listVideoId.add(item);
  void removeFromListVideoId(FileDataTypeStruct item) =>
      listVideoId.remove(item);
  void removeAtIndexFromListVideoId(int index) => listVideoId.removeAt(index);
  void insertAtIndexInListVideoId(int index, FileDataTypeStruct item) =>
      listVideoId.insert(index, item);
  void updateListVideoIdAtIndex(
          int index, Function(FileDataTypeStruct) updateFn) =>
      listVideoId[index] = updateFn(listVideoId[index]);

  List<FileDataTypeStruct> listFileId = [];
  void addToListFileId(FileDataTypeStruct item) => listFileId.add(item);
  void removeFromListFileId(FileDataTypeStruct item) => listFileId.remove(item);
  void removeAtIndexFromListFileId(int index) => listFileId.removeAt(index);
  void insertAtIndexInListFileId(int index, FileDataTypeStruct item) =>
      listFileId.insert(index, item);
  void updateListFileIdAtIndex(
          int index, Function(FileDataTypeStruct) updateFn) =>
      listFileId[index] = updateFn(listFileId[index]);

  CreateNNewsFeedDataStruct? requestData;
  void updateRequestDataStruct(Function(CreateNNewsFeedDataStruct) updateFn) {
    updateFn(requestData ??= CreateNNewsFeedDataStruct());
  }

  int setColor = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for Content widget.
  FocusNode? contentFocusNode;
  TextEditingController? contentTextController;
  String? Function(BuildContext, String?)? contentTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? createNewsFeed;
  // Stores action output result for [Backend Call - API (CreateNewsFeed)] action in Button widget.
  ApiCallResponse? apiResultCreateNewsFeed;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    contentFocusNode?.dispose();
    contentTextController?.dispose();
  }

  /// Action blocks.
  Future uploadImage(BuildContext context) async {
    bool? uploadimageToken;
    ApiCallResponse? apiResultUploadImage;

    if ((uploadedLocalFile1.bytes?.isNotEmpty ?? false)) {
      uploadimageToken = await action_blocks.tokenReload(context);
      if (uploadimageToken!) {
        apiResultUploadImage = await UploadFileGroup.uploadListFileCall.call(
          accessToken: FFAppState().accessToken,
          fileList: listImage,
        );

        if ((apiResultUploadImage.succeeded ?? true)) {
          if (listImage.length == 1) {
            addToListImageId(FileDataTypeStruct(
              directusFilesId: FileIDDataTypeStruct(
                id: getJsonField(
                  (apiResultUploadImage.jsonBody ?? ''),
                  r'''$.data.id''',
                ).toString().toString(),
              ),
            ));
          } else {
            while (loop < listImage.length) {
              addToListImageId(FileDataTypeStruct(
                directusFilesId: FileIDDataTypeStruct(
                  id: (FileUploadStruct.maybeFromMap(
                              (apiResultUploadImage.jsonBody ?? ''))
                          ?.data[loop])
                      ?.id,
                ),
              ));
              loop = loop + 1;
            }
            loop = 0;
          }
        }
      } else {
        FFAppState().update(() {});
      }
    }
  }

  Future uploadVideo(BuildContext context) async {
    bool? uploadVideoToken;
    ApiCallResponse? apiResultUploadVideo;

    if ((uploadedLocalFile3.bytes?.isNotEmpty ?? false)) {
      uploadVideoToken = await action_blocks.tokenReload(context);
      if (uploadVideoToken!) {
        apiResultUploadVideo = await UploadFileGroup.uploadListFileCall.call(
          accessToken: FFAppState().accessToken,
          fileList: listVideo,
        );

        if ((apiResultUploadVideo.succeeded ?? true)) {
          if (listVideo.length == 1) {
            addToListVideoId(FileDataTypeStruct(
              directusFilesId: FileIDDataTypeStruct(
                id: getJsonField(
                  (apiResultUploadVideo.jsonBody ?? ''),
                  r'''$.data.id''',
                ).toString().toString(),
              ),
            ));
          } else {
            while (loop < listVideo.length) {
              addToListVideoId(FileDataTypeStruct(
                directusFilesId: FileIDDataTypeStruct(
                  id: (FileUploadStruct.maybeFromMap(
                              (apiResultUploadVideo.jsonBody ?? ''))
                          ?.data[loop])
                      ?.id,
                ),
              ));
              loop = loop + 1;
            }
            loop = 0;
          }
        }
      } else {
        FFAppState().update(() {});
      }
    }
  }

  Future uploadFile(BuildContext context) async {
    bool? uploadFileToken;
    ApiCallResponse? apiResultUploadFIle;

    if ((uploadedLocalFile2.bytes?.isNotEmpty ?? false)) {
      uploadFileToken = await action_blocks.tokenReload(context);
      if (uploadFileToken!) {
        apiResultUploadFIle = await UploadFileGroup.uploadListFileCall.call(
          accessToken: FFAppState().accessToken,
          fileList: listFile,
        );

        if ((apiResultUploadFIle.succeeded ?? true)) {
          if (listFile.length == 1) {
            addToListFileId(FileDataTypeStruct(
              directusFilesId: FileIDDataTypeStruct(
                id: getJsonField(
                  (apiResultUploadFIle.jsonBody ?? ''),
                  r'''$.data.id''',
                ).toString().toString(),
              ),
            ));
          } else {
            while (loop < listFile.length) {
              addToListFileId(FileDataTypeStruct(
                directusFilesId: FileIDDataTypeStruct(
                  id: (FileUploadStruct.maybeFromMap(
                              (apiResultUploadFIle.jsonBody ?? ''))
                          ?.data[loop])
                      ?.id,
                ),
              ));
              loop = loop + 1;
            }
            loop = 0;
          }
        }
      } else {
        FFAppState().update(() {});
      }
    }
  }
}
