import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'newsfeed_widget.dart' show NewsfeedWidget;
import 'package:flutter/material.dart';

class NewsfeedModel extends FlutterFlowModel<NewsfeedWidget> {
  ///  Local state fields for this page.

  List<NewsfeedListStruct> newsfeedPublished = [];
  void addToNewsfeedPublished(NewsfeedListStruct item) =>
      newsfeedPublished.add(item);
  void removeFromNewsfeedPublished(NewsfeedListStruct item) =>
      newsfeedPublished.remove(item);
  void removeAtIndexFromNewsfeedPublished(int index) =>
      newsfeedPublished.removeAt(index);
  void insertAtIndexInNewsfeedPublished(int index, NewsfeedListStruct item) =>
      newsfeedPublished.insert(index, item);
  void updateNewsfeedPublishedAtIndex(
          int index, Function(NewsfeedListStruct) updateFn) =>
      newsfeedPublished[index] = updateFn(newsfeedPublished[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
