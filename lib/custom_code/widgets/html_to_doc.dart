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

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

String truncateHtml(String html, int maxLines) {
  int lastHtmlElementIndex = 0;
  for (int i = 0; i < maxLines; i++) {
    lastHtmlElementIndex = html.indexOf('<p', lastHtmlElementIndex);
    if (lastHtmlElementIndex == -1) {
      break;
    }
    lastHtmlElementIndex++;
  }
  return html.substring(0, lastHtmlElementIndex);
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
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    if (widget.html != null && widget.html!.isNotEmpty) {
      final double lineHeight = 20;
      final int maxLines = 4;

      String displayedHtml;
      if (widget.html!.split('<p').length <= maxLines) {
        displayedHtml = widget.html!;
      } else {
        displayedHtml =
            isExpanded ? widget.html! : truncateHtml(widget.html!, maxLines);
      }

      return Column(
        children: [
          Container(
            width: widget.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HtmlWidget(displayedHtml),
                if (!isExpanded && widget.html!.length > displayedHtml.length)
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
                if (isExpanded)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isExpanded = false;
                        });
                      },
                      child: Text(
                        'Thu gọn',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
