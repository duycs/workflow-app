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
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CKEditorUpdate extends StatefulWidget {
  factory CKEditorUpdate({
    double? width,
    double? height,
    String? initialData,
    Future Function(String data)?
        action, // Tham số action là một hàm nhận một chuỗi và không trả về giá trị
  }) {
    return CKEditorUpdate._internal(
      width: width,
      height: height,
      editorKeyValue: '',
      initialData: initialData ??
          '', // Sử dụng initialData hoặc chuỗi rỗng nếu nó là null
      action:
          action, // Sử dụng action hoặc một hàm không làm gì cả nếu nó là null
    );
  }

  CKEditorUpdate._internal({
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
  State<CKEditorUpdate> createState() => _CKEditorUpdateState();
}

class _CKEditorUpdateState extends State<CKEditorUpdate> {
  late HtmlEditorController controller;
  final FocusNode focusNode = FocusNode();
  bool isShow = true;
  Color selectedColor = Colors.black;
  bool isColorPickerOpen = false;
  Color pickedColor = Colors.white;

  @override
  void initState() {
    super.initState();
    controller = HtmlEditorController();
  }

  void openColorPicker() {
    setState(() {
      isColorPickerOpen = true;
    });
  }

  void setColor(color) {
    setState(() {
      pickedColor = color;
    });
  }

  void closeColorPicker() {
    setState(() {
      isColorPickerOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isColorPickerOpen) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (isColorPickerOpen) {
                closeColorPicker();
              }
            },
            child: Container(
              width: widget.width,
              height: widget.height,
              color: Colors.white,
              child: SingleChildScrollView(
                child: HtmlEditor(
                  controller: controller,
                  htmlToolbarOptions: HtmlToolbarOptions(
                    toolbarPosition: ToolbarPosition.belowEditor,
                    toolbarType: ToolbarType.nativeScrollable,
                    customToolbarButtons: [
                      TextButton(
                        onPressed: openColorPicker,
                        child: Icon(Icons.color_lens_sharp),
                      ),
                    ],
                    defaultToolbarButtons: [
                      FontButtons(),
                      FontSettingButtons(),
                      StyleButtons(),
                      FontButtons(),
                      ListButtons(),
                      ColorButtons(),
                      ParagraphButtons(),
                      InsertButtons(),
                      OtherButtons(),
                    ],
                  ),
                  htmlEditorOptions: HtmlEditorOptions(
                    hint: "Nhập văn bản",
                    shouldEnsureVisible: true,
                    autoAdjustHeight: false,
                    adjustHeightForKeyboard: false,
                    spellCheck: true,
                    initialText: widget.initialData,
                  ),
                  otherOptions: OtherOptions(height: widget.height! - 40),
                  callbacks: Callbacks(
                    onChangeContent: (String? currentHtml) {
                      if (widget.action != null) {
                        widget.action!((currentHtml ?? "") as String);
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(
        alignment: Alignment.bottomLeft,
        width: MediaQuery.of(context).size.width,
        height: 500,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 50),
              child: Text(
                'Chọn màu!',
                key: ValueKey(1), // Đặt key ở đây nếu cần
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blue, // Sử dụng Colors.blue thay vì Color.blue
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: ColorPicker(
                pickerColor: pickedColor,
                onColorChanged: (color) {
                  setColor(color);
                },
                colorPickerWidth: 300.0,
                pickerAreaHeightPercent: 0.7,
                enableAlpha: true,
                displayThumbColor: true,
                showLabel: true,
                paletteType: PaletteType.hsv,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      closeColorPicker();
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(100, 40)),
                    ),
                    child: Text('Thoát'),
                  ),
                  SizedBox(width: 20), // Khoảng cách giữa hai nút
                  ElevatedButton(
                    onPressed: () {
                      print('pickedColor: $pickedColor');
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(100, 40)),
                    ),
                    child: Text('Lưu'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

// class ColorPickerOverlay extends StatelessWidget {
//   final bool isColorPickerOpen;
//   final Color selectedColor;
//   final ValueChanged<Color> onColorChanged;
//   final VoidCallback onSave;
//   final VoidCallback onClose;

//   const ColorPickerOverlay({
//     Key? key,
//     required this.isColorPickerOpen,
//     required this.selectedColor,
//     required this.onColorChanged,
//     required this.onSave,
//     required this.onClose,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 300),
//       child: isColorPickerOpen ? _buildColorPicker(context) : SizedBox.shrink(),
//     );
//   }

//   Widget _buildColorPicker(BuildContext context) {
//     return IgnorePointer(
//       ignoring: true,
//       child: Positioned(
//         left: 0,
//         bottom: 0,
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: 500,
//           color: Colors.white,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               ColorPicker(
//                 pickerColor: selectedColor,
//                 onColorChanged: onColorChanged,
//                 colorPickerWidth: 300.0,
//                 pickerAreaHeightPercent: 0.7,
//                 enableAlpha: true,
//                 displayThumbColor: true,
//                 showLabel: true,
//                 paletteType: PaletteType.hsv,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: onSave,
//                 style: ButtonStyle(
//                   minimumSize: MaterialStateProperty.all(Size(100, 40)),
//                 ),
//                 child: Text('Lưu'),
//               ),
//               SizedBox(height: 10),
//               TextButton(
//                 onPressed: onClose,
//                 style: ButtonStyle(
//                   minimumSize: MaterialStateProperty.all(Size(100, 40)),
//                 ),
//                 child: Text('Thoát'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
