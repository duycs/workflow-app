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

// Các import tự động của FlutterFlow
import '/custom_code/widgets/index.dart'; // Import các widget tùy chỉnh khác
import '/custom_code/actions/index.dart'; // Import các hành động tùy chỉnh
import '/flutter_flow/custom_functions.dart'; // Import các hàm tùy chỉnh

// Bắt đầu mã widget tùy chỉnh
// KHÔNG XÓA HOẶC SỬA MÃ TRÊN ĐÂY!

class CustomWidgetDateTime extends StatefulWidget {
  const CustomWidgetDateTime({
    Key? key,
    this.width,
    this.height,
    this.date,
    this.action,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DateTime? date;
  final Future<void> Function(String? dateStart, String? dateEnd)? action;

  @override
  _CustomWidgetDateTimeState createState() => _CustomWidgetDateTimeState();
}

class _CustomWidgetDateTimeState extends State<CustomWidgetDateTime> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.date ?? DateTime.now();
    _updateDates();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: DropdownButton<int>(
              value: selectedDate.month,
              underline: SizedBox.shrink(),
              items: List.generate(12, (index) {
                return DropdownMenuItem<int>(
                  value: index + 1,
                  child: Text(
                    'Tháng ${index + 1}',
                    style: TextStyle(fontSize: 14),
                  ),
                );
              }),
              onChanged: (value) {
                setState(() {
                  selectedDate = DateTime(selectedDate.year, value!, 1);
                });
                _updateDates();
              },
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: DropdownButton<int>(
              value: selectedDate.year,
              underline: SizedBox.shrink(),
              items: List.generate(100, (index) {
                int year = DateTime.now().year - 50 + index;
                return DropdownMenuItem<int>(
                  value: year,
                  child: Text(
                    '$year',
                    style: TextStyle(fontSize: 14),
                  ),
                );
              }),
              onChanged: (value) {
                setState(() {
                  selectedDate = DateTime(value!, selectedDate.month, 1);
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
    DateTime startDate = DateTime(selectedDate.year, selectedDate.month, 1);
    DateTime endDate = DateTime(selectedDate.year, selectedDate.month + 1, 1);

    String dateStartString =
        "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}";
    String dateEndString =
        "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}";

    await widget.action?.call(dateStartString, dateEndString);
  }
}
