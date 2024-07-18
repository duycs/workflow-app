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

class CustomWidgetDateTime extends StatefulWidget {
  const CustomWidgetDateTime({
    super.key,
    this.width,
    this.height,
    this.date,
    this.action,
  });

  final double? width;
  final double? height;
  final DateTime? date;
  final Future Function(String? dateStart, String? dateEnd)? action;

  @override
  State<CustomWidgetDateTime> createState() => _CustomWidgetDateTimeState();
}

class _CustomWidgetDateTimeState extends State<CustomWidgetDateTime> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.date ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center children horizontally
        children: [
          Expanded(
            child: DropdownButton<int>(
              value: selectedDate?.month,
              underline: SizedBox.shrink(),
              items: List.generate(12, (index) {
                return DropdownMenuItem(
                  value: index + 1,
                  child: Text('Tháng ${index + 1}'),
                );
              }),
              onChanged: (value) {
                setState(() {
                  selectedDate = DateTime(selectedDate!.year, value!, 1);
                });
                _updateDates();
              },
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: DropdownButton<int>(
              value: selectedDate?.year,
              underline: SizedBox.shrink(),
              items: List.generate(100, (index) {
                int year = DateTime.now().year - 50 + index;
                return DropdownMenuItem(
                  value: year,
                  child: Text('$year'),
                );
              }),
              onChanged: (value) {
                setState(() {
                  selectedDate = DateTime(value!, selectedDate!.month, 1);
                });
                _updateDates();
              },
            ),
          ),
        ],
      ),
    );
  }

  void _updateDates() async {
    if (selectedDate == null || widget.action == null) return;

    DateTime dateStart = DateTime(selectedDate!.year, selectedDate!.month, 1);
    DateTime dateEnd = DateTime(selectedDate!.year, selectedDate!.month + 1, 1);

    String dateStartString =
        "${dateStart.year.toString().padLeft(4, '0')}-${dateStart.month.toString().padLeft(2, '0')}-${dateStart.day.toString().padLeft(2, '0')}";
    String dateEndString =
        "${dateEnd.year.toString().padLeft(4, '0')}-${dateEnd.month.toString().padLeft(2, '0')}-${dateEnd.day.toString().padLeft(2, '0')}";

    await widget.action!(dateStartString, dateEndString);
  }
}
