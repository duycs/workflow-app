import '/flutter_flow/flutter_flow_util.dart';
import 'filter_reprot_image_widget.dart' show FilterReprotImageWidget;
import 'package:flutter/material.dart';

class FilterReprotImageModel extends FlutterFlowModel<FilterReprotImageWidget> {
  ///  Local state fields for this component.

  String dateStart = '';

  String dateEnd = '';

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for nameStaff widget.
  FocusNode? nameStaffFocusNode;
  TextEditingController? nameStaffTextController;
  String? Function(BuildContext, String?)? nameStaffTextControllerValidator;
  // State field(s) for tenquytrinh widget.
  FocusNode? tenquytrinhFocusNode1;
  TextEditingController? tenquytrinhTextController1;
  String? Function(BuildContext, String?)? tenquytrinhTextController1Validator;
  // State field(s) for tenquytrinh widget.
  FocusNode? tenquytrinhFocusNode2;
  TextEditingController? tenquytrinhTextController2;
  String? Function(BuildContext, String?)? tenquytrinhTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameStaffFocusNode?.dispose();
    nameStaffTextController?.dispose();

    tenquytrinhFocusNode1?.dispose();
    tenquytrinhTextController1?.dispose();

    tenquytrinhFocusNode2?.dispose();
    tenquytrinhTextController2?.dispose();
  }
}
