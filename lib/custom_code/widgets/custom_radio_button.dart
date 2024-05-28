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

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({
    Key? key,
    this.width,
    this.height,
    required this.content,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String> content;

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  late List<String> contents;
  String _selectedValue = '';

  @override
  void initState() {
    super.initState();
    contents = widget.content;
    if (contents.isNotEmpty) {
      _selectedValue =
          contents[0]; // Initialize with the first element if not empty
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: contents.length,
        itemBuilder: (BuildContext context, int index) {
          String key = contents[index];
          return ListTile(
            title: Text(key),
            leading: Radio<String>(
              value: key,
              groupValue: _selectedValue,
              onChanged: (String? value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
