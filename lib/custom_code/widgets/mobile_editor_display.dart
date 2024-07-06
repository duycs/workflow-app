// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'package:appflowy_editor/appflowy_editor.dart';
import 'dart:convert';

class MobileEditorDisplay extends StatefulWidget {
  const MobileEditorDisplay({
    super.key,
    this.width,
    this.height,
    required this.content,
  });

  final double? width;
  final double? height;
  final String content;

  @override
  State<MobileEditorDisplay> createState() => _MobileEditorDisplayState();
}

class _MobileEditorDisplayState extends State<MobileEditorDisplay> {
  @override
  Widget build(BuildContext context) {
    try {
      final Map<String, dynamic> jsonMap = jsonDecode(widget.content);
      final editorState = EditorState(
        document: Document.fromJson(jsonMap),
      );

      return AppFlowyEditor(
        editorState: editorState,
        editorStyle: EditorStyle.mobile(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          textStyleConfiguration: TextStyleConfiguration(
            text: TextStyle(
              fontSize: FlutterFlowTheme.of(context).bodyMedium.fontSize,
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
        ),
        editable: false,
        shrinkWrap: true,
      );
    } catch (e) {
      return Text('Lỗi khi hiển thị nội dung: $e');
    }
  }
}
