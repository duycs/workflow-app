import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'time_keeping_location_update_widget.dart'
    show TimeKeepingLocationUpdateWidget;
import 'package:flutter/material.dart';

class TimeKeepingLocationUpdateModel
    extends FlutterFlowModel<TimeKeepingLocationUpdateWidget> {
  ///  Local state fields for this component.

  List<ListCityStruct> listCity = [];
  void addToListCity(ListCityStruct item) => listCity.add(item);
  void removeFromListCity(ListCityStruct item) => listCity.remove(item);
  void removeAtIndexFromListCity(int index) => listCity.removeAt(index);
  void insertAtIndexInListCity(int index, ListCityStruct item) =>
      listCity.insert(index, item);
  void updateListCityAtIndex(int index, Function(ListCityStruct) updateFn) =>
      listCity[index] = updateFn(listCity[index]);

  List<DistrictListStruct> listDistricts = [];
  void addToListDistricts(DistrictListStruct item) => listDistricts.add(item);
  void removeFromListDistricts(DistrictListStruct item) =>
      listDistricts.remove(item);
  void removeAtIndexFromListDistricts(int index) =>
      listDistricts.removeAt(index);
  void insertAtIndexInListDistricts(int index, DistrictListStruct item) =>
      listDistricts.insert(index, item);
  void updateListDistrictsAtIndex(
          int index, Function(DistrictListStruct) updateFn) =>
      listDistricts[index] = updateFn(listDistricts[index]);

  List<WardsStruct> listWards = [];
  void addToListWards(WardsStruct item) => listWards.add(item);
  void removeFromListWards(WardsStruct item) => listWards.remove(item);
  void removeAtIndexFromListWards(int index) => listWards.removeAt(index);
  void insertAtIndexInListWards(int index, WardsStruct item) =>
      listWards.insert(index, item);
  void updateListWardsAtIndex(int index, Function(WardsStruct) updateFn) =>
      listWards[index] = updateFn(listWards[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập địa chỉ cụ thể';
    }

    return null;
  }

  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập phạm vi áp dụng';
    }

    return null;
  }

  // Stores action output result for [Custom Action - getCurrentLocationStruct] action in Button widget.
  List<double>? checkLocationTimeKeepingUpdate;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? checkTokenTimeKeepingLocationUpdate;
  // Stores action output result for [Backend Call - API (TimeKeepingLocationUpdate)] action in Button widget.
  ApiCallResponse? apiResulttrf;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Action blocks.
  Future getListDataCity(BuildContext context) async {
    bool? checkTokenListCity;
    ApiCallResponse? apiResultGetListDataCity;

    checkTokenListCity = await action_blocks.tokenReload(context);
    if (!checkTokenListCity!) {
      return;
    }
    apiResultGetListDataCity = await AddressGroup.listCityCall.call(
      accessToken: FFAppState().accessToken,
    );

    if ((apiResultGetListDataCity.succeeded ?? true)) {
      listCity = ListDataCityStruct.maybeFromMap(
              (apiResultGetListDataCity.jsonBody ?? ''))!
          .data
          .toList()
          .cast<ListCityStruct>();
    }
  }

  Future getListDataDistricts(BuildContext context) async {
    bool? checkTokenDistricts;
    ApiCallResponse? apiResultDistricts;

    checkTokenDistricts = await action_blocks.tokenReload(context);
    if (!checkTokenDistricts!) {
      return;
    }
    apiResultDistricts = await AddressGroup.listDistrictCall.call(
      accessToken: FFAppState().accessToken,
    );

    if ((apiResultDistricts.succeeded ?? true)) {
      listDistricts = (getJsonField(
        (apiResultDistricts.jsonBody ?? ''),
        r'''$.data''',
        true,
      )!
              .toList()
              .map<DistrictListStruct?>(DistrictListStruct.maybeFromMap)
              .toList() as Iterable<DistrictListStruct?>)
          .withoutNulls
          .toList()
          .cast<DistrictListStruct>();
    }
  }

  Future getListDataWards(BuildContext context) async {
    bool? checkTokenWards;
    ApiCallResponse? apiResultDataWards;

    checkTokenWards = await action_blocks.tokenReload(context);
    if (!checkTokenWards!) {
      FFAppState().update(() {});
      return;
    }
    apiResultDataWards = await AddressGroup.listWardCall.call(
      accessToken: FFAppState().accessToken,
    );

    if ((apiResultDataWards.succeeded ?? true)) {
      listWards = (getJsonField(
        (apiResultDataWards.jsonBody ?? ''),
        r'''$.data''',
        true,
      )!
              .toList()
              .map<WardsStruct?>(WardsStruct.maybeFromMap)
              .toList() as Iterable<WardsStruct?>)
          .withoutNulls
          .toList()
          .cast<WardsStruct>();
    }
  }
}
