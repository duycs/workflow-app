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

class FormatText extends StatefulWidget {
  const FormatText({
    super.key,
    this.width,
    this.height,
    required this.number,
    required this.text,
    required this.action,
  });

  final double? width;
  final double? height;
  final int number;
  final String text;
  final Future Function() action;

  @override
  State<FormatText> createState() => _FormatTextState();
}

class _FormatTextState extends State<FormatText> {
  bool showFullText = false;

  @override
  Widget build(BuildContext context) {
    String displayText = widget.text;
    if (widget.text.length > widget.number && !showFullText) {
      displayText = widget.text.substring(0, widget.number) + '...';
    }

    return Container(
      width: widget.width,
      child: GestureDetector(
        onTap: () async {
          if (widget.text.length > widget.number && !showFullText) {
            await widget.action();
            setState(() {
              showFullText = true;
            });
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14,
                  //color: Colors.black,
                  color: Color(0xFF34383A),
                ),
                children: [
                  TextSpan(
                    text: displayText,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            if (widget.text.length > widget.number && !showFullText)
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: GestureDetector(
                  onTap: () async {
                    await widget.action();
                    setState(() {
                      showFullText = true;
                    });
                  },
                  child: Text(
                    'Xem thêm...',
                    style: TextStyle(
                      color: Color(0xFF57636C),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
