// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<WorkflowsStepCreateStruct>> reorderItems(
  List<WorkflowsStepCreateStruct> list,
  int oldIndex,
  int newIndex,
) async {
  if (oldIndex < newIndex) {
    newIndex -= 1;
  }

  // Remove the item from its original position in the list and store
  // it in the 'item' variable.
  final item = list.removeAt(oldIndex);

  // Insert the removed item into its new position in the list.
  list.insert(newIndex, item);
  // Add your function code here!
  return list;
}
