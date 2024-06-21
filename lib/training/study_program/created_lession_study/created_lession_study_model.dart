import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'created_lession_study_widget.dart' show CreatedLessionStudyWidget;
import 'package:flutter/material.dart';

class CreatedLessionStudyModel
    extends FlutterFlowModel<CreatedLessionStudyWidget> {
  ///  Local state fields for this component.

  String image = '';

  String video = '';

  String file = '';

  List<TestListStruct> dataTest = [];
  void addToDataTest(TestListStruct item) => dataTest.add(item);
  void removeFromDataTest(TestListStruct item) => dataTest.remove(item);
  void removeAtIndexFromDataTest(int index) => dataTest.removeAt(index);
  void insertAtIndexInDataTest(int index, TestListStruct item) =>
      dataTest.insert(index, item);
  void updateDataTestAtIndex(int index, Function(TestListStruct) updateFn) =>
      dataTest[index] = updateFn(dataTest[index]);

  LessonsStruct? dataListLession;
  void updateDataListLessionStruct(Function(LessonsStruct) updateFn) {
    updateFn(dataListLession ??= LessonsStruct());
  }

  int? checkDay;

  String input = '';

  String output = '';

  String checkContent = '';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập tiêu đề';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập mô tả';
    }

    return null;
  }

  // State field(s) for test_id widget.
  String? testIdValue;
  FormFieldController<String>? testIdValueController;
  // State field(s) for durationHours widget.
  FocusNode? durationHoursFocusNode;
  TextEditingController? durationHoursTextController;
  String? Function(BuildContext, String?)? durationHoursTextControllerValidator;
  // State field(s) for estimate_in_day widget.
  FocusNode? estimateInDayFocusNode;
  TextEditingController? estimateInDayTextController;
  String? Function(BuildContext, String?)? estimateInDayTextControllerValidator;
  String? _estimateInDayTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    estimateInDayTextControllerValidator =
        _estimateInDayTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    durationHoursFocusNode?.dispose();
    durationHoursTextController?.dispose();

    estimateInDayFocusNode?.dispose();
    estimateInDayTextController?.dispose();
  }

  /// Action blocks.
  Future getListTest(BuildContext context) async {
    bool? checkTokenTestList;
    ApiCallResponse? apiResutDataTesst;

    checkTokenTestList = await action_blocks.tokenReload(context);
    if (checkTokenTestList!) {
      apiResutDataTesst = await TestGroup.testListCall.call(
        accessToken: FFAppState().accessToken,
        filter: '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffLogin,
          r'''$.organization_id''',
        ).toString().toString()}\"}}]}',
      );

      if ((apiResutDataTesst.succeeded ?? true)) {
        dataTest = TestListDataStruct.maybeFromMap(
                (apiResutDataTesst.jsonBody ?? ''))!
            .data
            .toList()
            .cast<TestListStruct>();
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future getUploadImage(BuildContext context) async {}
}
