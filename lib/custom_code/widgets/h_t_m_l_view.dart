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

class HTMLView extends StatefulWidget {
  const HTMLView({
    Key? key,
    this.width,
    this.height,
    required this.html,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? html;

  @override
  State<HTMLView> createState() => _HTMLViewState();
}

class _HTMLViewState extends State<HTMLView> {
  // @override
  // Widget build(BuildContext context) {
  //   return Container();
  // }
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
    if (_scrollController.offset >=
        (_contentHeight ?? 0) - (widget.height ?? 0)) {
      setState(() {
        _scrollController.removeListener(
            _scrollListener); // Disable scrolling when reaching the bottom
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          controller: _scrollController,
          child: HtmlWidget(
            widget.html ?? '',
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
        );
      },
    );
  }
}
