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

import 'dart:convert';

// import '/backend/schema/structs/index.dart';
// import '/actions/actions.dart' as action_blocks;

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlToDoc extends StatefulWidget {
  const HtmlToDoc({
    Key? key,
    this.width,
    this.height,
    required this.html,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String html;
  @override
  State<HtmlToDoc> createState() => _HtmlToDocState();
}

class _HtmlToDocState extends State<HtmlToDoc> {
  bool isExpanded = true;
  bool canScroll = false;
  final GlobalKey _htmlKey = GlobalKey();
  double? _contentHeight;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _contentHeight = _getHeight();
        });
      }
    });
  }

  double? _getHeight() {
    final RenderBox? renderBox =
        _htmlKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size.height;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (canScroll &&
        widget.height != null &&
        _scrollController.offset >= (widget.height! / 4)) {
      setState(() {
        canScroll = false; // Vô hiệu hóa cuộn khi nội dung đã cuộn đến đáy
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isExpanded) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double maxHeight = widget.height!;
          double currentHeight = constraints.maxHeight;
          // kieerm tra
          // print(_contentHeight);
          // print(widget.height!);
          // print(_contentHeight != null && _contentHeight! > widget.height!);

          // Kiểm tra nếu chiều cao hiện tại vượt quá hoặc bằng maxHeight
          // kiểm tra _contentHeight thay đổi thì set lai state
          // if (!canScroll) {
          //   Future.delayed(Duration.zero, () {
          //     WidgetsBinding.instance!.addPostFrameCallback((_) {
          //       // Nếu _contentHeight thay đổi, setState sẽ được gọi ở đây
          //       if (_contentHeight != null &&
          //           (_contentHeight! > widget.height!)) {
          //         setState(() {
          //           canScroll =
          //               true; // Vô hiệu hóa cuộn khi nội dung đã cuộn đến đáy
          //         });
          //       } else {
          //         setState(() {
          //           canScroll =
          //               false; // Vô hiệu hóa cuộn khi nội dung đã cuộn đến đáy
          //         });
          //       }
          //     });
          //   });
          // }
          // });
          return Column(
            children: [
              Container(
                constraints: BoxConstraints(maxHeight: widget.height!),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: HtmlWidget(
                    widget.html,
                    key: _htmlKey,
                    textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                    onLoadingBuilder: (context, element, loadingProgress) {
                      // Trong trường hợp này, chúng ta không cần trả về một widget nào
                      // Thay vào đó, chúng ta sẽ cập nhật _contentHeight trong hàm này
                      print(loadingProgress);
                      if (loadingProgress! < 1) {
                        // Hiển thị biểu tượng loading hoặc thông báo tải
                        return CircularProgressIndicator();
                      } else {
                        // Tiến trình tải đã hoàn tất, hiển thị nội dung HTML
                        if (!canScroll) {
                          if (mounted) {
                            setState(() {
                              _contentHeight = _getHeight();
                            });
                          }
                        }
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ),
              if (_contentHeight != null && _contentHeight! > widget.height!)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Text(
                      'Xem thêm',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              // Hiển thị nút "Xem thêm" nếu chưa đạt maxHeight
            ],
          );
        },
      );
    } else {
      return ClipRect(
        child: Column(
          children: [
            HtmlWidget(
              widget.html,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  'Thu nhỏ',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
