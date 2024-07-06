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

import 'package:image_picker/image_picker.dart';

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/src/media_type.dart';
import 'dart:convert';

class MobileEditor extends StatefulWidget {
  const MobileEditor({
    super.key,
    this.width,
    this.height,
    this.setContentCallback,
    required this.closeEditorCallback,
    this.content,
  });

  final double? width;
  final double? height;
  final Future Function(dynamic editorContent)? setContentCallback;
  final Future Function() closeEditorCallback;
  final String? content;

  @override
  State<MobileEditor> createState() => _MobileEditorState();
}

class _MobileEditorState extends State<MobileEditor> {
  late EditorState _editorState;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    // _editorState = EditorState.blank();
    if (widget.content != null && widget.content!.isNotEmpty) {
      try {
        final jsonContent = json.decode(widget.content!);
        _editorState = EditorState(
          document: Document.fromJson(jsonContent),
        );
      } catch (e) {
        print('Error parsing JSON content: $e');
        _editorState = EditorState.blank();
      }
    } else {
      _editorState = EditorState.blank();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () {
              if (widget.closeEditorCallback != null) {
                widget.closeEditorCallback!();
              }
            },
          ),
          title: Text("Nhập nội dung",
              style: FlutterFlowTheme.of(context).titleMedium.copyWith(
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              icon: Text("Lưu",
                  style: FlutterFlowTheme.of(context).titleMedium.copyWith(
                        color: FlutterFlowTheme.of(context).blue,
                      )),
              onPressed: () {
                final editorContent = _editorState.document.toJson();
                final jsonString = json.encode(editorContent);
                if (widget.setContentCallback != null) {
                  widget.setContentCallback!(jsonString);
                }
              },
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 46, // Điều chỉnh chiều cao của toolbar
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
                  bottom: BorderSide(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
                ),
              ),
              child: ClipRect(
                // Thêm ClipRect để ẩn phần tràn
                child: _FixedToolbar(
                  editorState: _editorState,
                  onUploadStart: _showLoading,
                  onUploadEnd: _hideLoading,
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  AppFlowyEditor(
                    editorState: _editorState,
                    editorStyle: EditorStyle.mobile(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                      textStyleConfiguration: TextStyleConfiguration(
                        text: TextStyle(
                          fontSize:
                              FlutterFlowTheme.of(context).bodyMedium.fontSize,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                    ),
                    shrinkWrap: false,
                    autoFocus: true,
                    focusedSelection: Selection.collapsed(Position(path: [0])),
                  ),
                  if (_isUploading)
                    Container(
                      color: Colors.black54,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLoading() {
    setState(() {
      _isUploading = true;
    });
  }

  void _hideLoading() {
    setState(() {
      _isUploading = false;
    });
  }
}

class _FixedToolbar extends StatelessWidget {
  const _FixedToolbar({
    required this.editorState,
    required this.onUploadStart,
    required this.onUploadEnd,
  });

  final EditorState editorState;
  final VoidCallback onUploadStart;
  final VoidCallback onUploadEnd;

  @override
  Widget build(BuildContext context) {
    final items = [
      Icons.image_outlined,
      Icons.check_box_outline_blank_outlined,
      Icons.link,
      Icons.format_quote,
      Icons.format_bold,
      Icons.format_italic,
      Icons.format_underlined,
      Icons.format_strikethrough,
      Icons.text_fields,
      Icons.format_list_bulleted,
      Icons.format_list_numbered,
      Icons.format_align_left,
      Icons.format_align_center,
      Icons.format_align_right,
      Icons.format_align_justify,
      // Icons.code,
      Icons.horizontal_rule,
    ];

    return ValueListenableBuilder(
      valueListenable: editorState.selectionNotifier,
      builder: (context, selection, _) {
        return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 5), // Thêm padding 5px ở đây
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final isBold = _isTextDecorationActive(
                  editorState,
                  selection,
                  AppFlowyRichTextKeys.bold,
                );
                return Container(
                    width: 36,
                    height: 36,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          // Thêm ClipOval ở đây
                          customBorder: CircleBorder(),
                          child: Center(
                              child: Icon(
                            items[index],
                            color: items[index] == Icons.format_bold && isBold
                                ? Colors.blue
                                : Colors.black,
                          )),
                          onTap: () async {
                            switch (items[index]) {
                              case Icons.format_bold:
                                editorState
                                    .toggleAttribute(AppFlowyRichTextKeys.bold);
                                break;
                              case Icons.format_italic:
                                editorState.toggleAttribute(
                                    AppFlowyRichTextKeys.italic);
                                break;
                              case Icons.format_underlined:
                                editorState.toggleAttribute(
                                    AppFlowyRichTextKeys.underline);
                                break;
                              case Icons.format_strikethrough:
                                editorState.toggleAttribute(
                                    AppFlowyRichTextKeys.strikethrough);
                                break;
                              case Icons.text_fields:
                                editorState.formatNode(null, (node) {
                                  return node.copyWith(
                                    type: ParagraphBlockKeys.type,
                                  );
                                });
                                break;
                              case Icons.format_list_bulleted:
                                editorState.formatNode(null, (node) {
                                  return node.copyWith(
                                    type:
                                        node.type == BulletedListBlockKeys.type
                                            ? ParagraphBlockKeys.type
                                            : BulletedListBlockKeys.type,
                                  );
                                });
                                break;
                              case Icons.format_list_numbered:
                                editorState.formatNode(null, (node) {
                                  return node.copyWith(
                                    type:
                                        node.type == NumberedListBlockKeys.type
                                            ? ParagraphBlockKeys.type
                                            : NumberedListBlockKeys.type,
                                  );
                                });
                                break;
                              case Icons.format_align_left:
                                editorState.formatNode(null, (node) {
                                  return node.copyWith(
                                    attributes: {
                                      ...node.attributes,
                                      blockComponentAlign: 'left',
                                    },
                                  );
                                });
                                break;
                              case Icons.format_align_center:
                                editorState.formatNode(null, (node) {
                                  return node.copyWith(
                                    attributes: {
                                      ...node.attributes,
                                      blockComponentAlign: 'center',
                                    },
                                  );
                                });
                                break;
                              case Icons.format_align_right:
                                editorState.formatNode(null, (node) {
                                  return node.copyWith(
                                    attributes: {
                                      ...node.attributes,
                                      blockComponentAlign: 'right',
                                    },
                                  );
                                });
                                break;
                              case Icons.format_align_justify:
                                editorState.formatNode(null, (node) {
                                  return node.copyWith(
                                    attributes: {
                                      ...node.attributes,
                                      blockComponentAlign: 'justify',
                                    },
                                  );
                                });
                                break;
                              case Icons.link:
                                // Xử lý thêm link
                                final selection = editorState.selection;
                                if (selection == null) return;

                                // Hiển thị dialog để nhập URL
                                final url = await showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    // Reset giá trị của urlController mỗi khi mở dialog
                                    final TextEditingController urlController =
                                        TextEditingController();
                                    return AlertDialog(
                                      title: Text('Thêm link'),
                                      content: TextField(
                                        controller: urlController,
                                        decoration: InputDecoration(
                                            hintText: 'Nhập URL'),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text('Hủy'),
                                          onPressed: () =>
                                              Navigator.of(context).pop(null),
                                        ),
                                        TextButton(
                                          child: Text('OK'),
                                          onPressed: () => Navigator.of(context)
                                              .pop(urlController.text),
                                        ),
                                      ],
                                    );
                                  },
                                );

                                if (url != null && url.isNotEmpty) {
                                  final transaction = editorState.transaction;
                                  final node = editorState
                                      .getNodeAtPath(selection.start.path);
                                  if (node != null) {
                                    transaction.formatText(
                                      node,
                                      selection.start.offset,
                                      selection.end.offset -
                                          selection.start.offset,
                                      {AppFlowyRichTextKeys.href: url},
                                    );
                                    editorState.apply(transaction);
                                  }
                                }
                                break;
                              case Icons.format_quote:
                                // Xử lý thêm quote
                                editorState.formatNode(null, (node) {
                                  return node.copyWith(
                                    type: node.type == QuoteBlockKeys.type
                                        ? ParagraphBlockKeys.type
                                        : QuoteBlockKeys.type,
                                  );
                                });
                                break;
                              // case Icons.code:
                              //   // Xử lý thêm code block
                              //   break;
                              case Icons.check_box_outline_blank_outlined:
                                editorState.formatNode(null, (node) {
                                  if (node.type == TodoListBlockKeys.type) {
                                    // Chuyển từ todo list sang paragraph
                                    return node.copyWith(
                                      type: ParagraphBlockKeys.type,
                                      attributes: {
                                        ...node.attributes,
                                        ParagraphBlockKeys.delta:
                                            node.attributes[
                                                TodoListBlockKeys.delta],
                                      }..remove(TodoListBlockKeys.checked),
                                    );
                                  } else {
                                    // Chuyển từ paragraph sang todo list
                                    final delta = node.delta;
                                    return todoListNode(
                                      checked: false,
                                      delta: delta,
                                    );
                                  }
                                });
                                break;
                              case Icons.horizontal_rule:
                                final selection = editorState.selection;
                                if (selection == null) {
                                  return;
                                }
                                final transaction = editorState.transaction;
                                final insertedPath = selection.end.path.next;
                                transaction
                                  ..insertNode(insertedPath, dividerNode())
                                  ..insertNode(
                                      insertedPath.next, paragraphNode())
                                  ..afterSelection = Selection.collapsed(
                                      Position(path: insertedPath.next));
                                editorState.apply(transaction);
                                break;
                              case Icons.image_outlined:
                                await _pickImageAndInsert(editorState, context);
                                break;
                              default:
                                break;
                            }
                          },
                        )));
              },
              separatorBuilder: (_, __) => const SizedBox(width: 6),
              itemCount: items.length,
            ));
      },
    );
  }

  Future<void> _pickImageAndInsert(
      EditorState editorState, BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      onUploadStart();
      try {
        final imageUrl = await _uploadImage(image);
        _insertImage(editorState, imageUrl);
      } catch (e) {
        _showUploadError(context);
      } finally {
        onUploadEnd();
      }
    }
  }

  Future<String> _uploadImage(XFile image) async {
    final bytes = await image.readAsBytes();
    final mimeType = _getMimeType(image.path);
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://workflow-api-dev.pexnic.com/files'),
    );
    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['Authorization'] =
        'Bearer Nw7B92suSDut23Cgv8J46RIiTRgs9Ynu';
    request.files.add(http.MultipartFile.fromBytes(
      'file',
      bytes,
      filename: image.name,
      contentType: MediaType.parse(mimeType),
    ));
    request.fields['folder'] = 'b83f23f5-57d1-4b47-adfc-c413eef9ed0f';

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final responseData = json.decode(responseBody);
      return 'https://workflow-api-dev.pexnic.com/assets/${responseData['data']['id']}';
    } else {
      throw Exception('Failed to upload image');
    }
  }

  void _insertImage(EditorState editorState, String imageUrl) {
    final selection = editorState.selection;
    if (selection == null) {
      return;
    }
    final transaction = editorState.transaction;
    final insertedPath = selection.end.path.next;
    transaction
      ..insertNode(insertedPath, imageNode(url: imageUrl))
      ..insertNode(insertedPath.next, paragraphNode())
      ..afterSelection = Selection.collapsed(Position(path: insertedPath.next));
    editorState.apply(transaction);
  }

  String _getMimeType(String path) {
    final extension = path.split('.').last.toLowerCase();
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      default:
        return 'application/octet-stream';
    }
  }

  void _showUploadError(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thông báo lỗi'),
          content: Text('Upload ảnh không thành công. Bạn vui lòng thử lại.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Thêm các phương thức hỗ trợ như _pickImageAndInsert, _uploadImage, _insertImage, v.v.
  // tương tự như trong fixed_toolbar_editor.dart

  bool _isTextDecorationActive(
    EditorState editorState,
    Selection? selection,
    String name,
  ) {
    selection = selection ?? editorState.selection;
    if (selection == null) {
      return false;
    }
    final nodes = editorState.getNodesInSelection(selection);
    if (selection.isCollapsed) {
      return editorState.toggledStyle.containsKey(name);
    } else {
      return nodes.allSatisfyInSelection(selection, (delta) {
        return delta.everyAttributes(
          (attributes) => attributes[name] == true,
        );
      });
    }
  }

  // Thêm các phương thức khác như _showUploadError, _pickImageAndInsert, _uploadImage, _insertImage, _getMimeType
  // tương tự như trong fixed_toolbar_editor.dart
}
