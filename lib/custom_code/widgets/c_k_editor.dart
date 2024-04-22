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

import 'package:file_picker/file_picker.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class CKEditor extends StatefulWidget {
  factory CKEditor({
    double? width,
    double? height,
    String? initialData,
    Future Function(String data)?
        action, // Tham số action là một hàm nhận một chuỗi và không trả về giá trị
  }) {
    return CKEditor._internal(
      width: width,
      height: height,
      editorKeyValue: '',
      initialData: initialData ??
          '', // Sử dụng initialData hoặc chuỗi rỗng nếu nó là null
      action:
          action, // Sử dụng action hoặc một hàm không làm gì cả nếu nó là null
    );
  }

  CKEditor._internal({
    Key? key,
    this.width,
    this.height,
    required this.editorKeyValue,
    required this.initialData,
    required this.action,
  }) : super(key: key);

  final double? width;
  final double? height;
  final bool isWeb = false;
  final String editorKeyValue;
  final String initialData;
  final Future Function(String data)? action;

  @override
  CKEditorState createState() => CKEditorState();
}

class CKEditorState extends State<CKEditor> {
  late HtmlEditorController controller;
  final FocusNode focusNode = FocusNode();
  bool isShow = true;

  @override
  void initState() {
    super.initState();
    controller = HtmlEditorController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.white,
      child: HtmlEditor(
        controller: controller,

        htmlToolbarOptions: HtmlToolbarOptions(
          toolbarPosition: ToolbarPosition.belowEditor,
          toolbarType:
              !isShow ? ToolbarType.nativeGrid : ToolbarType.nativeScrollable,
          // customToolbarButtons: [
          //   TextButton(
          //     onPressed: () {
          //       setState(() {
          //         isShow = !isShow;
          //       });
          //       // Hide keyboard if it's currently open
          //       FocusScope.of(context).unfocus();
          //     },
          //     child: Icon(Icons.more_vert),
          //     // child: isShow ? Icon(Icons.arrow_drop_up) : Icon(arrow_drop_down),
          //   ),
          // ],
          defaultToolbarButtons: [
            FontButtons(),
            FontSettingButtons(),
            StyleButtons(),
            FontButtons(),
            ColorButtons(),
            ListButtons(),
            ParagraphButtons(),
            InsertButtons(),
            OtherButtons(),
          ],

          // Customize the toolbar further from here
        ),
        // Set up additional options as needed, this is just a basic check the docs
        htmlEditorOptions: HtmlEditorOptions(
          hint: "Nhập văn bản",
          shouldEnsureVisible: true,
          autoAdjustHeight: false,
          adjustHeightForKeyboard: true,
          spellCheck: true,
          // initialText: initialData,
          initialText: widget.initialData,
          // ... other options will come here, add a comma after each
        ),
        otherOptions: OtherOptions(height: widget.height! - 70),
        callbacks: Callbacks(onChangeContent: (String? currentHtml) {
          if (widget.action != null) {
            widget.action!((currentHtml ?? "") as String);
          }
          // FFAppState().update(() {
          //   FFAppState().dataCkEditor = currentHtml ?? "";
          // });
        }),
      ),
    );
  }
}
