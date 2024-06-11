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
import 'dart:ui';

class BlurredOverlay extends StatelessWidget {
  final double sigmaX;
  final double sigmaY;
  final Widget child;
  final double? contentHeight;
  final double? widgetHeight;

  const BlurredOverlay({
    Key? key,
    required this.child,
    this.sigmaX = 0.0,
    this.sigmaY = 0.0,
    this.contentHeight,
    this.widgetHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: [
          child,
          if (contentHeight != null && contentHeight! > widgetHeight!)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.0),
                      Colors.white.withOpacity(0.05),
                      Colors.white,
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateContentHeight();
    });
  }

  void _updateContentHeight() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
          return Column(
            children: [
              Container(
                constraints: BoxConstraints(maxHeight: widget.height!),
                child: BlurredOverlay(
                  contentHeight: _contentHeight,
                  widgetHeight: widget.height,
                  child: SingleChildScrollView(
                    physics: canScroll
                        ? AlwaysScrollableScrollPhysics()
                        : NeverScrollableScrollPhysics(),
                    child: HtmlWidget(
                      widget.html,
                      key: _htmlKey,
                      onLoadingBuilder: (context, element, loadingProgress) {
                        if (loadingProgress == null || loadingProgress == 1) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            _updateContentHeight();
                          });
                          return SizedBox.shrink();
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                      onTapImage: (image) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _updateContentHeight();
                        });
                      },
                      onTapUrl: (url) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _updateContentHeight();
                        });
                        return true;
                      },
                    ),
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
