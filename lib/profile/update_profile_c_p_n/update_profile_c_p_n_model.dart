import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/profile/update_profile_ck_popup/update_profile_ck_popup_widget.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'update_profile_c_p_n_widget.dart' show UpdateProfileCPNWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UpdateProfileCPNModel extends FlutterFlowModel<UpdateProfileCPNWidget> {
  ///  Local state fields for this page.

  String logoId = '';

  String avatarId = '';

  List<String> imageId = [];
  void addToImageId(String item) => imageId.add(item);
  void removeFromImageId(String item) => imageId.remove(item);
  void removeAtIndexFromImageId(int index) => imageId.removeAt(index);
  void insertAtIndexInImageId(int index, String item) =>
      imageId.insert(index, item);
  void updateImageIdAtIndex(int index, Function(String) updateFn) =>
      imageId[index] = updateFn(imageId[index]);

  String videoId = '';

  String description = '';

  bool checkTrue = false;

  String description2 = '';

  UpdateOrganizationStruct? request;
  void updateRequestStruct(Function(UpdateOrganizationStruct) updateFn) =>
      updateFn(request ??= UpdateOrganizationStruct());

  UploadListFileStruct? files;
  void updateFilesStruct(Function(UploadListFileStruct) updateFn) =>
      updateFn(files ??= UploadListFileStruct());

  int? loop = 0;

  List<FFUploadedFile> images = [];
  void addToImages(FFUploadedFile item) => images.add(item);
  void removeFromImages(FFUploadedFile item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, FFUploadedFile item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      images[index] = updateFn(images[index]);

  List<String> imagesUpload = [];
  void addToImagesUpload(String item) => imagesUpload.add(item);
  void removeFromImagesUpload(String item) => imagesUpload.remove(item);
  void removeAtIndexFromImagesUpload(int index) => imagesUpload.removeAt(index);
  void insertAtIndexInImagesUpload(int index, String item) =>
      imagesUpload.insert(index, item);
  void updateImagesUploadAtIndex(int index, Function(String) updateFn) =>
      imagesUpload[index] = updateFn(imagesUpload[index]);

  String input = '';

  String output = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for hotline widget.
  FocusNode? hotlineFocusNode;
  TextEditingController? hotlineTextController;
  String? Function(BuildContext, String?)? hotlineTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? uploadVideoToken;
  // Stores action output result for [Backend Call - API (UploadFile)] action in Button widget.
  ApiCallResponse? apiResultUploadVideo;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? uploadLogoToken;
  // Stores action output result for [Backend Call - API (UploadFile)] action in Button widget.
  ApiCallResponse? apiResultUploadLogo;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? uploadAvatarToken;
  // Stores action output result for [Backend Call - API (UploadFile)] action in Button widget.
  ApiCallResponse? apiResultUploadAvatar;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? updateOrganizationToken;
  // Stores action output result for [Backend Call - API (UpdateOrganization)] action in Button widget.
  ApiCallResponse? apiResultUpdateOrganization;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    hotlineFocusNode?.dispose();
    hotlineTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();
  }

  /// Action blocks.
  Future uploadListImage(BuildContext context) async {
    bool? uploadImageToken2;
    ApiCallResponse? apiResultUploadImage2;

    if (images.length > 0) {
      uploadImageToken2 = await action_blocks.tokenReload(context);
      if (uploadImageToken2!) {
        apiResultUploadImage2 = await UploadFileGroup.uploadListFileCall.call(
          accessToken: FFAppState().accessToken,
          fileList: images,
        );
        if ((apiResultUploadImage2?.succeeded ?? true)) {
          if (imagesUpload.length == 1) {
            updateFilesStruct(
              (e) => e
                ..updateCreate(
                  (e) => e.add(FileDataStruct(
                    organizationsId: getJsonField(
                      FFAppState().staffLogin,
                      r'''$.organization_id''',
                    ).toString().toString(),
                    directusFilesId: FileIDDataTypeStruct(
                      id: getJsonField(
                        (apiResultUploadImage2?.jsonBody ?? ''),
                        r'''$.data.id''',
                      ).toString().toString(),
                    ),
                  )),
                ),
            );
          } else {
            imagesUpload = FileUploadStruct.maybeFromMap(
                    (apiResultUploadImage2?.jsonBody ?? ''))!
                .data
                .map((e) => e.id)
                .toList()
                .toList()
                .cast<String>();
            while (loop! < imageId.length) {
              addToImagesUpload(imageId[loop!]);
              loop = loop! + 1;
            }
            loop = 0;
            while (loop! < imagesUpload.length) {
              updateFilesStruct(
                (e) => e
                  ..updateCreate(
                    (e) => e.add(FileDataStruct(
                      organizationsId: getJsonField(
                        FFAppState().staffLogin,
                        r'''$.organization_id''',
                      ).toString().toString(),
                      directusFilesId: FileIDDataTypeStruct(
                        id: imagesUpload[loop!],
                      ),
                    )),
                  ),
              );
              loop = loop! + 1;
            }
            loop = 0;
          }
        }
      }
    } else {
      while (loop! < imageId.length) {
        updateFilesStruct(
          (e) => e
            ..updateCreate(
              (e) => e.add(FileDataStruct(
                organizationsId: getJsonField(
                  FFAppState().staffLogin,
                  r'''$.organization_id''',
                ).toString().toString(),
                directusFilesId: FileIDDataTypeStruct(
                  id: imageId[loop!],
                ),
              )),
            ),
        );
        loop = loop! + 1;
      }
      loop = 0;
    }

    imageId = [];
    imagesUpload = [];
    images = [];
  }
}
