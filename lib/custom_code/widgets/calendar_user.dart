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

class CalendarUser extends StatefulWidget {
  const CalendarUser({
    super.key,
    this.width,
    this.height,
    this.action,
    this.date,
    this.json,
    this.dateUpdate,
  });

  final double? width;
  final double? height;
  final Future Function(String? date)? action;
  final DateTime? date;
  final List<dynamic>? json;
  final Future Function(DateTime? dateStart, DateTime? dateEnd)? dateUpdate;

  @override
  State<CalendarUser> createState() => _CalendarUserState();
}

class _CalendarUserState extends State<CalendarUser> {
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.date != null) {
      selectedDate = widget.date!;
    }
    _updateDateRange();
  }

  void _updateDateRange() async {
    DateTime dateStart = DateTime(selectedDate.year, selectedDate.month, 1);
    DateTime dateEnd = DateTime(selectedDate.year, selectedDate.month + 1, 1);

    if (widget.dateUpdate != null) {
      await widget.dateUpdate!(dateStart, dateEnd);
    }
  }

  Map<String, Color> statusColors = {
    "0": Color(0xFFE0E3E7),
    "1": Color(0xFF4B39EF),
    "2": Color(0xFF39D2C0),
    "3": Color(0xFFEE8B60),
    "4": Color(0xFFFF5963),
    "5": Color(0xFF57636C),
  };

  Color getColorForDate(DateTime date) {
    for (var entry in widget.json ?? []) {
      DateTime dateCreated = DateTime.parse(entry['date_created']);
      if (dateCreated.year == date.year &&
          dateCreated.month == date.month &&
          dateCreated.day == date.day) {
        String status = entry['status'];
        return statusColors[status] ?? Colors.white;
      }
    }
    return Colors.white;
  }

  Color getTextColorForDate(DateTime date) {
    for (var entry in widget.json ?? []) {
      DateTime dateCreated = DateTime.parse(entry['date_created']);
      if (dateCreated.year == date.year &&
          dateCreated.month == date.month &&
          dateCreated.day == date.day) {
        return Colors.white;
      }
    }
    return Colors.black;
  }

  void _nextMonth() {
    setState(() {
      selectedDate = DateTime(selectedDate.year, selectedDate.month + 1, 1);
      _updateDateRange();
    });
  }

  void _prevMonth() {
    setState(() {
      selectedDate = DateTime(selectedDate.year, selectedDate.month - 1, 1);
      _updateDateRange();
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime firstDayOfMonth =
        DateTime(selectedDate.year, selectedDate.month, 1);
    DateTime lastDayOfMonth =
        DateTime(selectedDate.year, selectedDate.month + 1, 0);
    DateTime firstDisplayDay = firstDayOfMonth
        .subtract(Duration(days: (firstDayOfMonth.weekday - 1 + 7) % 7));
    DateTime lastDisplayDay =
        lastDayOfMonth.add(Duration(days: 7 - lastDayOfMonth.weekday));

    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: _prevMonth,
                ),
                Text(
                  'Tháng ${selectedDate.month}/${selectedDate.year}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: _nextMonth,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var day in [
                  'MON',
                  'TUE',
                  'WED',
                  'THU',
                  'FRI',
                  'SAT',
                  'SUN'
                ])
                  Container(
                    width:
                        (MediaQuery.of(context).size.width - 20 - (6 * 8)) / 7,
                    height: 60,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      day,
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito Sans',
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                DateTime date = firstDisplayDay.add(Duration(days: index));
                bool isCurrentMonth = date.month == selectedDate.month;

                return GestureDetector(
                  onTap: () async {
                    await widget.action?.call(date.toIso8601String());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: getColorForDate(date),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x33000000),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: TextStyle(
                          color: isCurrentMonth
                              ? getTextColorForDate(date)
                              : Colors.black.withOpacity(0.3),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: lastDisplayDay.difference(firstDisplayDay).inDays + 1,
            ),
          ),
          // Expanded(
          //   child: Padding(
          //     padding: EdgeInsets.all(8.0),
          //     child: LayoutBuilder(
          //       builder: (context, constraints) {
          //         double itemWidth = (constraints.maxWidth - 60) / 7;
          //         return Wrap(
          //           spacing: 10,
          //           runSpacing: 10,
          //           children: List.generate(
          //             lastDisplayDay.difference(firstDisplayDay).inDays + 1,
          //             (index) {
          //               DateTime date =
          //                   firstDisplayDay.add(Duration(days: index));
          //               bool isCurrentMonth = date.month == selectedDate.month;

          //               return GestureDetector(
          //                 onTap: () async {
          //                   await widget.action?.call(date.toIso8601String());
          //                 },
          //                 child: Container(
          //                   width: itemWidth,
          //                   height: itemWidth, // Đảm bảo item là hình vuông
          //                   decoration: BoxDecoration(
          //                     color: getColorForDate(date),
          //                     borderRadius: BorderRadius.circular(12),
          //                     boxShadow: [
          //                       BoxShadow(
          //                         color: Color(0x33000000),
          //                         blurRadius: 4,
          //                         offset: Offset(0, 2),
          //                       ),
          //                     ],
          //                   ),
          //                   child: Center(
          //                     child: Text(
          //                       '${date.day}',
          //                       style: TextStyle(
          //                         color: isCurrentMonth
          //                             ? getTextColorForDate(date)
          //                             : Colors.black.withOpacity(0.3),
          //                         fontSize: 14,
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               );
          //             },
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
