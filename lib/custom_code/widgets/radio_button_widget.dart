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

import 'package:group_radio_button/group_radio_button.dart';

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  String _singleValue =
      'Text alignment right Text alignment right Text alignment Text alignment right Text alignment right Text alignment right Text alignment right Text alignment right ';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RadioButton(
        description:
            "Text alignment right Text alignment right Text alignment right Text alignment right Text alignment right Text alignment right Text alignment right Text alignment right Text alignment righ",
        value:
            "Text alignment right Text alignment right Text alignment right Text alignment right Text alignment right Text alignment right Text alignment right Text alignment right Text alignment righ",
        groupValue: _singleValue,
        onChanged: (value) => setState(
          () => _singleValue = value!,
        ),
      ),
    );
  }
}
