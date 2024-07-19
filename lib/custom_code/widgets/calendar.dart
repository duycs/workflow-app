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

import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    Key? key,
    this.width,
    this.height,
    this.action,
    this.date,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future Function(String? date)? action;
  final DateTime? date;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List> _events;
  late List _selectedEvents;
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = widget.date ??
        DateTime
            .now(); // Sử dụng widget.date nếu có, ngược lại là ngày hiện tại
    _events = {};
    _selectedEvents = [];
  }

  List _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _focusedDay,
      firstDate: DateTime.utc(1),
      lastDate: DateTime.utc(9999),
      locale: Locale('vi', 'VN'), // Đặt locale thành tiếng Việt
    );
    if (picked != null && picked != _focusedDay) {
      setState(() {
        _selectedDay = picked;
        _focusedDay = picked;
        _selectedEvents = _getEventsForDay(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () {
                  setState(() {
                    _focusedDay = DateTime(
                      _focusedDay.year,
                      _focusedDay.month - 1,
                    );
                  });
                },
              ),
              Text(
                DateFormat('MM-yyyy', 'vi').format(_focusedDay),
                style: TextStyle(fontSize: 16.0),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                  IconButton(
                    icon: Icon(Icons.chevron_right),
                    onPressed: () {
                      setState(() {
                        _focusedDay = DateTime(
                          _focusedDay.year,
                          _focusedDay.month + 1,
                        );
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: TableCalendar(
            locale: 'vi_VN', // Đặt locale thành tiếng Việt
            firstDay: DateTime.utc(1),
            lastDay: DateTime.utc(9999),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            eventLoader: _getEventsForDay,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _selectedEvents = _getEventsForDay(selectedDay);
              });

              String formattedDate =
                  DateFormat('dd/MM/yyyy').format(selectedDay);
              if (widget.action != null) {
                widget.action!(formattedDate);
              }
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryColor,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronVisible: false,
              rightChevronVisible: false,
              formatButtonShowsNext: false, // Ẩn nút định dạng
              titleTextFormatter: (date, locale) => '', // Ẩn tiêu đề tháng năm
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle().copyWith(color: Colors.red),
              weekdayStyle: TextStyle().copyWith(color: Colors.black),
            ),
            startingDayOfWeek:
                StartingDayOfWeek.monday, // Bắt đầu tuần từ thứ Hai
          ),
        ),
      ],
    );
  }
}
