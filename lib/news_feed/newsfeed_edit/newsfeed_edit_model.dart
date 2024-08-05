import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'newsfeed_edit_widget.dart' show NewsfeedEditWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewsfeedEditModel extends FlutterFlowModel<NewsfeedEditWidget> {
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

  List<FileDataTypeStruct> listImageUploadNF = [];
  void addToListImageUploadNF(FileDataTypeStruct item) =>
      listImageUploadNF.add(item);
  void removeFromListImageUploadNF(FileDataTypeStruct item) =>
      listImageUploadNF.remove(item);
  void removeAtIndexFromListImageUploadNF(int index) =>
      listImageUploadNF.removeAt(index);
  void insertAtIndexInListImageUploadNF(int index, FileDataTypeStruct item) =>
      listImageUploadNF.insert(index, item);
  void updateListImageUploadNFAtIndex(
          int index, Function(FileDataTypeStruct) updateFn) =>
      listImageUploadNF[index] = updateFn(listImageUploadNF[index]);

  List<FileDataTypeStruct> listFileUploadNF = [];
  void addToListFileUploadNF(FileDataTypeStruct item) =>
      listFileUploadNF.add(item);
  void removeFromListFileUploadNF(FileDataTypeStruct item) =>
      listFileUploadNF.remove(item);
  void removeAtIndexFromListFileUploadNF(int index) =>
      listFileUploadNF.removeAt(index);
  void insertAtIndexInListFileUploadNF(int index, FileDataTypeStruct item) =>
      listFileUploadNF.insert(index, item);
  void updateListFileUploadNFAtIndex(
          int index, Function(FileDataTypeStruct) updateFn) =>
      listFileUploadNF[index] = updateFn(listFileUploadNF[index]);

  List<FileDataTypeStruct> listVideoUploadNF = [];
  void addToListVideoUploadNF(FileDataTypeStruct item) =>
      listVideoUploadNF.add(item);
  void removeFromListVideoUploadNF(FileDataTypeStruct item) =>
      listVideoUploadNF.remove(item);
  void removeAtIndexFromListVideoUploadNF(int index) =>
      listVideoUploadNF.removeAt(index);
  void insertAtIndexInListVideoUploadNF(int index, FileDataTypeStruct item) =>
      listVideoUploadNF.insert(index, item);
  void updateListVideoUploadNFAtIndex(
          int index, Function(FileDataTypeStruct) updateFn) =>
      listVideoUploadNF[index] = updateFn(listVideoUploadNF[index]);

  int setColor = 0;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  String? _titleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Tiêu đề không được để trống!';
    }

    return null;
  }

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
  bool? updateNewsFeed;
  // Stores action output result for [Backend Call - API (EditNewsFeed)] action in Button widget.
  ApiCallResponse? apiResultUpdateNewsFeed;

  @override
  void initState(BuildContext context) {
    titleTextControllerValidator = _titleTextControllerValidator;
  }

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    contentFocusNode?.dispose();
    contentTextController?.dispose();
  }

  /// Action blocks.
  Future uploadImage(BuildContext context) async {
    bool? uploadimageToken1;
    ApiCallResponse? apiResultUploadImage1;

    if (uploadedLocalFile1 != null &&
        (uploadedLocalFile1.bytes?.isNotEmpty ?? false)) {
      uploadimageToken1 = await action_blocks.tokenReload(context);
      if (uploadimageToken1!) {
        apiResultUploadImage1 = await UploadFileGroup.uploadListFileCall.call(
          accessToken: FFAppState().accessToken,
          fileList: listImage,
        );

        if ((apiResultUploadImage1?.succeeded ?? true)) {
          if (listImage.length == 1) {
            addToListImageUploadNF(FileDataTypeStruct(
              directusFilesId: FileIDDataTypeStruct(
                id: getJsonField(
                  (apiResultUploadImage1?.jsonBody ?? ''),
                  r'''$.data.id''',
                ).toString().toString(),
              ),
            ));
            while (loop < listImageId.length) {
              addToListImageUploadNF(FileDataTypeStruct(
                directusFilesId: FileIDDataTypeStruct(
                  id: listImageId[loop].directusFilesId.id,
                ),
              ));
              loop = loop + 1;
            }
            loop = 0;
          } else {
            while (loop < listImage.length) {
              addToListImageUploadNF(FileDataTypeStruct(
                directusFilesId: FileIDDataTypeStruct(
                  id: (FileUploadStruct.maybeFromMap(
                              (apiResultUploadImage1?.jsonBody ?? ''))
                          ?.data?[loop])
                      ?.id,
                ),
              ));
              loop = loop + 1;
            }
            loop = 0;
            while (loop < listImageId.length) {
              addToListImageUploadNF(FileDataTypeStruct(
                directusFilesId: FileIDDataTypeStruct(
                  id: listImageId[loop].directusFilesId.id,
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
    } else {
      while (loop < listImageId.length) {
        addToListImageUploadNF(FileDataTypeStruct(
          directusFilesId: FileIDDataTypeStruct(
            id: listImageId[loop].directusFilesId.id,
          ),
        ));
        loop = loop + 1;
      }
      loop = 0;
    }
  }

  Future uploadVideo(BuildContext context) async {
    bool? uploadVideoToken1;
    ApiCallResponse? apiResultUploadVideo1;

    if (uploadedLocalFile3 != null &&
        (uploadedLocalFile3.bytes?.isNotEmpty ?? false)) {
      uploadVideoToken1 = await action_blocks.tokenReload(context);
      if (uploadVideoToken1!) {
        apiResultUploadVideo1 = await UploadFileGroup.uploadListFileCall.call(
          accessToken: FFAppState().accessToken,
          fileList: listVideo,
        );

        if ((apiResultUploadVideo1?.succeeded ?? true)) {
          if (listVideo.length == 1) {
            addToListVideoUploadNF(FileDataTypeStruct(
              directusFilesId: FileIDDataTypeStruct(
                id: getJsonField(
                  (apiResultUploadVideo1?.jsonBody ?? ''),
                  r'''$.data.id''',
                ).toString().toString(),
              ),
            ));
            while (loop < listVideoUploadNF.length) {
              addToListVideoUploadNF(FileDataTypeStruct(
                directusFilesId: FileIDDataTypeStruct(
                  id: listVideoId[loop].directusFilesId.id,
                ),
              ));
              loop = loop + 1;
            }
            loop = 0;
          } else {
            while (loop < listVideo.length) {
              addToListVideoUploadNF(FileDataTypeStruct(
                directusFilesId: FileIDDataTypeStruct(
                  id: (FileUploadStruct.maybeFromMap(
                              (apiResultUploadVideo1?.jsonBody ?? ''))
                          ?.data?[loop])
                      ?.id,
                ),
              ));
              loop = loop + 1;
            }
            loop = 0;
            while (loop < listVideoUploadNF.length) {
              addToListVideoUploadNF(FileDataTypeStruct(
                directusFilesId: FileIDDataTypeStruct(
                  id: listVideoId[loop].directusFilesId.id,
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
    } else {
      while (loop < listVideoUploadNF.length) {
        addToListVideoUploadNF(FileDataTypeStruct(
          directusFilesId: FileIDDataTypeStruct(
            id: listVideoId[loop].directusFilesId.id,
          ),
        ));
        loop = loop + 1;
      }
      loop = 0;
    }
  }

  Future uploadFile(BuildContext context) async {
    bool? uploadFileToken1;
    ApiCallResponse? apiResultUploadFIle1;

    if (uploadedLocalFile2 != null &&
        (uploadedLocalFile2.bytes?.isNotEmpty ?? false)) {
      uploadFileToken1 = await action_blocks.tokenReload(context);
      if (uploadFileToken1!) {
        apiResultUploadFIle1 = await UploadFileGroup.uploadListFileCall.call(
          accessToken: FFAppState().accessToken,
          fileList: listFile,
        );

        if ((apiResultUploadFIle1?.succeeded ?? true)) {
          if (listFile.length == 1) {
            addToListFileUploadNF(FileDataTypeStruct(
              directusFilesId: FileIDDataTypeStruct(
                id: getJsonField(
                  (apiResultUploadFIle1?.jsonBody ?? ''),
                  r'''$.data.id''',
                ).toString().toString(),
              ),
            ));
            while (loop < listFileId.length) {
              addToListFileUploadNF(FileDataTypeStruct(
                directusFilesId: FileIDDataTypeStruct(
                  id: listFileId[loop].directusFilesId.id,
                ),
              ));
              loop = loop + 1;
            }
            loop = 0;
          } else {
            while (loop < listFile.length) {
              addToListFileUploadNF(FileDataTypeStruct(
                directusFilesId: FileIDDataTypeStruct(
                  id: (FileUploadStruct.maybeFromMap(
                              (apiResultUploadFIle1?.jsonBody ?? ''))
                          ?.data?[loop])
                      ?.id,
                ),
              ));
              loop = loop + 1;
            }
            loop = 0;
            while (loop < listFileId.length) {
              addToListFileUploadNF(FileDataTypeStruct(
                directusFilesId: FileIDDataTypeStruct(
                  id: listFileId[loop].directusFilesId.id,
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
    } else {
      while (loop < listFileId.length) {
        addToListFileUploadNF(FileDataTypeStruct(
          directusFilesId: FileIDDataTypeStruct(
            id: listFileId[loop].directusFilesId.id,
          ),
        ));
        loop = loop + 1;
      }
      loop = 0;
    }
  }
}
